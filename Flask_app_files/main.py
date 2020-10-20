from flask import Flask, request, render_template
from make_prediction import left_or_stayed
import numpy as np

# create a flask object
app = Flask(__name__)

# creates an association between the / page and the entry_page function (defaults to GET)
@app.route('/')
def entry_page():
    return render_template('index.html')

# creates an association between the /predict_recipe page and the render_message function
# (includes POST requests which allow users to enter in data via form)
@app.route('/predict_recipe/', methods=['GET', 'POST'])
def render_message():

    # user-entered ingredients
    ingredients = ['SeniorCitizen', 'tenure', 'MonthlyCharges', 'PhoneService_Yes',
    'MultipleLines_Yes', 'InternetService_Fiber optic', 'TechSupport_Yes',
    'StreamingTV_No internet service', 'StreamingMovies_No internet service',
    'MultiplePeople', 'longtermcontract_Yes', 'automaticpayment_Yes', 'PaperlessBilling_Yes']

    # error messages to ensure correct units of measure
    messages = ["SeniorCitizen must be 0(No) or 1(Yes)",
                "Tenure in months",
                "MonthlyCharges in USD",
                "PhoneService_Yes (Enter 1 if Yes, 0 if No)",
                "MultipleLines_Yes (Enter 1 if Yes, 0 if No)",
                "InternetService_Fiber optic (Enter 1 if Yes, 0 if No)",
                "TechSupport_Yes (Enter 1 if Yes, 0 if No)",
                "StreamingTV_No internet service (Enter 1 if Yes, 0 if No)",
                "StreamingMovies_No internet service (Enter 1 if Yes, 0 if No)",
                "MultiplePeople (Enter 1 if Yes, 0 if No)",
                "longtermcontract_Yes (Enter 1 if Yes, 0 if No)",
                "automaticpayment_Yes (Enter 1 if Yes, 0 if No)",
                "PaperlessBilling_Yes (Enter 1 if Yes, 0 if No)"]

    # hold all amounts as floats
    amounts = []

    # takes user input and ensures it can be turned into a floats
    for i, ing in enumerate(ingredients):
        user_input = request.form[ing]
        try:
            float_ingredient = float(user_input)
        except:
            return render_template('index.html', message=messages[i])
        amounts.append(float_ingredient)

    # show user final message
    final_message = left_or_stayed(amounts)
    return render_template('index.html', message=final_message)

if __name__ == '__main__':
    app.run(debug=True)
