# Project Details

## Purpose & Outcome

The purpose of this project was to apply AI and data science techniques to detect malicious network traffic, focusing on attacks such as brute-force and Denial-of-Service attempts in network session data.

I built and compared several machine learning models: a baseline Decision Tree trained on raw data as a benchmark, then improved Decision Tree and K-Nearest Neighbours classifiers with full preprocessing and hyperparameter tuning, as well as a linear regression model to predict session duration. I engineered two custom features, 'login_failure_rate' and 'data_transfer_ratio', to better separate attack behaviour from normal user behaviour.

The outcome was a full comparison of all models, showing the improved Decision Tree (with outliers kept) as the best classifier at 77% accuracy. The most important finding was the impact of class imbalance: since about 74% of the traffic was benign, all classifiers had recall below 12%, meaning they missed most real attacks and would not be suitable for production without further work. The project also showed why keeping outliers matters in a cybersecurity context, since extreme values can be evidence of attacks.

## Technologies, Tools and Methods

- Python for data analysis and machine learning
- pandas for data exploration and manipulation
- matplotlib for visualisation (histograms, scatterplots, distribution charts)
- scikit-learn: Decision Tree Classifier, K-Nearest Neighbours, Linear Regression
- Data preprocessing: mean and mode imputation for missing values, categorical standardisation, port number remapping
- Encoding: Label, Ordinal, and One-Hot encoding depending on the feature
- Min-Max scaling, fitted on training data only
- IQR-based outlier removal (tested and compared against keeping outliers)
- Feature engineering ('login_failure_rate', 'data_transfer_ratio')
- Train/test split and GridSearchCV for hyperparameter tuning
- Evaluation metrics: accuracy, precision, recall, F1-score, MAE, RMSE, R2 score

## Individual Contribution

I completed the entire project by myself. I performed the data exploration and identified the patterns indicating brute-force and DoS activity, I made the preprocessing decisions (how to impute missing values, whether to keep outliers, which columns to drop), and I created the two engineered features. I built and tuned the baseline and improved models, ran the outlier comparison experiments, evaluated every model, and wrote the analysis of the results, including the class imbalance findings.