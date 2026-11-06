from flask import Flask, render_template, request, redirect, url_for, session
from bcrypt import checkpw, hashpw, gensalt
import pyodbc
import os

app = Flask(__name__)
app.secret_key = os.environ.get('SECRET_KEY', 'default-dev-key')
BLOB_URL = "https://techstorageb00175970.blob.core.windows.net/profile-pictures/"

def get_db_connection():
    conn_str = (
        f"DRIVER={{ODBC Driver 18 for SQL Server}};"
        f"SERVER={os.environ.get('SQL_SERVER', 'techstart-sql-b00175970.database.windows.net')};"
        f"DATABASE={os.environ.get('SQL_DATABASE', 'techstart_db')};"
        f"UID={os.environ.get('SQL_USERNAME', 'dbadmin')};"
        f"PWD={os.environ.get('SQL_PASSWORD', 'Pass1234')};"
        "Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"
    )
    return pyodbc.connect(conn_str)

@app.route('/login', methods=['POST'])
def login():
    email = request.form['email']
    password = request.form['password']
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT full_name, role, password_hash FROM staff_directory WHERE email = ?", email)
        row = cursor.fetchone()
        conn.close()
        if row:
            input_password_bytes = password.encode('utf-8')
            stored_hash_bytes = row.password_hash.encode('utf-8')
            if checkpw(input_password_bytes, stored_hash_bytes): 
                session['user'] = row.full_name
                session['role'] = row.role
                name_mapping = {
                    'Liam O\'Connor': 'liamo',
                    'Sophie Byrne': 'sophieb',
                    'Noah Murphy': 'noahm',
                    'Emma Walsh': 'emmaw',
                    'Jack Kelly': 'jackk',
                    'Ava Ryan': 'avar',
                }
                user_filename_prefix = name_mapping.get(row.full_name, 'default') 
                profile_pic_url = f"{BLOB_URL}{user_filename_prefix}-profile.jpg"
                session['profile_pic'] = profile_pic_url
                return redirect(url_for('home'))
        return "Invalid Credentials", 401
    except Exception as e:
        return f"Database Error: {e}", 500

@app.route('/')
def home():
    if 'user' in session:
        return render_template('dashboard.html', user=session['user'], role=session['role'])
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)