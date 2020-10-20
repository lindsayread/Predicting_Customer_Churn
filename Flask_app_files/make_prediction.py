import pickle
import pandas as pd
import numpy as np

# read in the model
my_model = pickle.load(open("proj3_model9.p","rb"))
#my_scaler = pickle.load(open("proj3_model9SCALER.p","rb"))

# create a function to take in user-entered amounts and apply the model
def left_or_stayed(amounts_float, model=my_model):

    #scaled_list = my_scaler.transform(amounts_float)

    # inputs into the model NOTE: MAY NEED TO PUT BRACKETS HERE
    input_df = [amounts_float]

    # make a prediction
    prediction = my_model.predict(input_df)[0]

    # return a message
    message_array = ["This customer will stay with Telco!",
                     "This customer will leave Telco!"]

    return message_array[prediction]
