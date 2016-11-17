# Exponentiate_Features

Linear and Logistic Regression are implemented after exponentiating the input features

# Algorithm

The powers that each of the features need to be exponentiated to are calculated by using the derivative of the cost function with respect to that feature. The cost function is modified to account for the exponents. Gradient Descent rule is modified to account for the exponents also.

# Results

The exponentiated models are seen to work better than the normal implementation as it is able to account for more non-linearities in the dataset. Graphs for a two feature dataset are plotted using the conventional methods and the exponentiated method to verify the results.

#Code

The "Simultaneous" folder contains code for the simultaneous update of the normal weights and the exponents using gradient descent.
