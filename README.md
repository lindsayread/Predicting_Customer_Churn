# **Metis Project 3: Predicting Customer Churn at Telco - Summer 2020**

## About:

In this project, my goal was to use Classification Models to predict whether or not a customer will stay or leave Telco (a telecommunication company providing both phone and internet service) in the next month.

First, I ran SQL queries to identify class imbalance as well as some key features that would likely be useful in modeling. During the SQL queries, I also feature engineered a couple of features, 'automaticpayment' and 'longtermcontract', which both ended up being two of the top predictors of customer churn.

After importing the data to a Jupyter Notebook, doing some EDA and data cleaning, I tried out several classification models on the data. I was able to determine that a Random Forest Classification model with SMOTE over sampling resulted in the best F1 score. I chose to optimize for F1 score because I wanted to know both which factors were making customers leave as well as which factors were helpful in retaining customers. In this way, F1 is a balance of recall and precision, caring both about minimizing false positives as well as false negatives. I was able to use SHAP to identify the average impact of each of my features on customer churn.

Once I decided on a classification model (Random Forest), I tuned several hyper-parameters to optimize for F1 (max_depth, n_estimators, and threshold tuning). After tuning the hyper-parameters, I scored this final model on my test set, where my F1 score was 0.62.

I implemented a Flask App where a user is able to enter some information (such as whether or not the customer has a long-term contract, how long they have been a customer, and whether or not they have Fiber Optic Internet Service), and it will predict whether or not that customer will leave Telco in the next month.

Based on my model, I was able to determine that customers with a long-term contract, automatic payment, and paperless billing were more likely to stay at Telco than customers without those features. Interestingly, my model found that customers with Fiber Optic Internet Service were much more likely to churn than those with any other type of internet service. These insights could be vital to a companies success; with these findings, Telco can see, with data, the aspects of their business that customers tend to like in addition to the aspects that may be detrimental to their business. For example, knowing that long-term contract, automatic payment, and paperless billing contributes positively to customer retention, Telco could incentivize customers to opt for those options. On the other hand, Telco could use the insights of features that contributed heavily to customer churn to improve upon those services or deter customers from using those services.

In this project, you will find a PDF of my presentation, code files relating to my SQL queries, a code file for EDA and modeling, code files for my flask app, my data source, and the skills/analysis used.

## Files:
### Slideshow PDF:
- [TelcoChurnPDF.pdf](https://github.com/thisismetis/chi20_ds15/tree/master/student_submissions/projects/project-03/read_lindsay/TelcoChurnPDF.pdf)

### SQL Related Files:
1. Text used to import .csv file into a SQL table on postgresql:
[CSVintoSQL.txt](https://github.com/thisismetis/chi20_ds15/tree/master/student_submissions/projects/project-03/read_lindsay/SQLrelated/CSVintoSQL.txt)
2. SQL Queries (from DBeaver):
[telcoProj3.sql](https://github.com/thisismetis/chi20_ds15/tree/master/student_submissions/projects/project-03/read_lindsay/SQLrelated/telcoProj3.sql)
3. SQL Queries via sqlalchemy:
[sqlqueries.ipynb](https://github.com/thisismetis/chi20_ds15/tree/master/student_submissions/projects/project-03/read_lindsay/SQLrelated/sqlqueries.ipynb)

### Code Files:
1. Code file for EDA, feature engineering, and Modeling:

[TelcoEDAandModeling-CleanedUp.ipynb](https://github.com/thisismetis/chi20_ds15/tree/master/student_submissions/projects/project-03/read_lindsay/TelcoEDAandModeling-CleanedUp.ipynb)

### Flask App Files:

1. html file that formats the html page:
[index.html](https://github.com/thisismetis/chi20_ds15/tree/master/student_submissions/projects/project-03/read_lindsay/Flask_app_files/index.html)
2. File that takes the Random Forest Model and Scaler used in my Jupyter Notebook to make a prediction of whether a customer will leave or stay with Telco based on the inputs given by the user.
[make_prediction.py](https://github.com/thisismetis/chi20_ds15/tree/master/student_submissions/projects/project-03/read_lindsay/Flask_app_files/make_prediction.py)
3. File that brings together index.html and make_prediction.py to return error messages and to return an output to the user (either that the customer will leave or stay).
[main.py](https://github.com/thisismetis/chi20_ds15/tree/master/student_submissions/projects/project-03/read_lindsay/Flask_app_files/main.py)

### README.md:
- [README.md](https://github.com/thisismetis/chi20_ds15/tree/master/student_submissions/projects/project-03/read_lindsay/README.md)

## Data:

[Kaggle: Telco Customer Churn](https://www.kaggle.com/blastchar/telco-customer-churn)

## Skills & Analysis:

- postgresql, DBeaver, sqlaclchemy
- AWS cloud storage
- classification algorithms (Logistic Regression, KNN, Bernoulli Naive Bayes, Gaussian Naive Bayes, Decision Trees, Random Forests)
- over sampling techniques (Random Over Sampling, SMOTE)
- hyperparameter tuning
- Quantifying quality of model via classification metrics
- shap to explain impact of features on target with Random Forest Model
- interactive visualization via Flask App (created with .py, html, and CSS)
- Pandas, Numpy, sklearn
- Matplotlib and seaborn visualizations
- cost-benefit analysis
- Verified model with cross validation
