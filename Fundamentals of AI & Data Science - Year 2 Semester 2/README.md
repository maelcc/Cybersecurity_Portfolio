# Network Traffic Attack Detection with Machine Learning

A machine learning project that classifies network sessions as benign or malicious, targeting attacks such as brute-force attempts and Denial-of-Service. It also includes a linear regression model that predicts session duration to spot abnormal connection behaviour.

## What It Does

- Explores and visualises a network traffic dataset to find attack indicators
- Compares a baseline Decision Tree against improved Decision Tree and KNN classifiers
- Tests whether keeping outliers improves detection (they can be evidence of attacks)
- Engineers two custom features: 'login_failure_rate' and 'data_transfer_ratio'
- Predicts session duration with linear regression and evaluates the fit

## Key Results

- The improved Decision Tree with outliers kept was the best classifier (77% accuracy)
- All classifiers suffered from class imbalance: about 74% of the dataset is benign traffic, and recall stayed below 12%
- The project shows why accuracy alone is misleading for imbalanced security data, and why recall matters when missed attacks are costly

## Technologies

- Python, pandas, matplotlib, scikit-learn
- Preprocessing: imputation, categorical standardisation, One-Hot and Ordinal encoding, Min-Max scaling
- Models: Decision Tree, K-Nearest Neighbours, Linear Regression
- Tuning and evaluation: GridSearchCV, accuracy, precision, recall, F1-score, MAE, RMSE, R2 score

## Usage

Open the notebook and run the cells top to bottom with the dataset file in the same folder.

## Educational Purpose

This project was created for educational purposes only. It is a coursework project published to demonstrate learning. The dataset is fictional and the models are not intended for production threat detection.