# Models #

The homework asked for three different kinds of models to use to solve the classification
problem. These models are Logistic Regression, an NN (Multil-layer perceptron) with one
hidden layer of arbitrary size, and arbitrarily sized/complex NNs.

The process followed to determine the right model from the two last kinds (NNs with a
hidden layer, and arbitray NNs) is detailed in the following subsections:

## Multilayered Perceptron with one hidden layer ##

The activation function in the output of all hidden layers was $tanh$, and the activation
function at the last neuron was the logistic function.

To determine the "right" number of neurons in the hidden layer, k-fold cross validation
was performed on the training data. The results of k-fold can be seen in figures
\ref{im04}, \ref{im05}, and \ref{im06}.

As it can be seen in figure \ref{im04} the cross validation error is smallest for neurons
of size 2, 4, and 53 with errors around 16.6% and 16.8%. Remember from "Section
Preprocessing" that the real classification error for each model is between -3.7% and +3.7%
of the value it appears on the figure, this means that there is no certainty at all that
any of the tested models is better at generalizing that any other by looking at the cross
validation errors.

But from the figure \ref{im05}, it is clear that the models memorize well the training data as
more neurons are used in the hidden layer. It must be noted that no model seem to be able
to reduce its training error below 6.5%, this is because I decided to stop the training
process of any model when it went below 8.5%, the 6.5% threshold is just artificial. If a
model with 60 neurons in the hidden layer were to be further trained, ignoring the 8.5%
threshold, it will get very low scores. I selected the 8.5% threshold because all NNs
that I tried in earlier attempts seemed to not improve after going lower than 8.5%
showing symptoms of overfitting (the training error continued to go down while the
validation error didn't).

The best models should be those in which the gap between the training error and the
(cross) validation error isn't too big. As it can be seen in the figure \ref{im05} the best
models, those with less overfitting, are the models with 1, 2, 3 and 4 neurons in the
hidden layer.

The efect of the 8.5% threshold can be seen in the number of epochs the model was trained
before it was stopped, see figure \ref{im06}. For big models ($neurons > 40$) the effect in the number of epochs
necessary to make the NN learn the data is very small, just about 10-12 epochs. The
threshold (8.5%) never affects models that cannot memorize enough, those with a small number of
neurons ($neurons < 9$) in the hidden layer, the training process is stopped for these
models when they stabilize enough.

Models that stabilize and don't seem to memorize much should be
considered the best, therefore the best model could either have 2, 3 or 4 neurons in the
hidden layer. Given all the above the best model to select seems to be a NN with 2 neurons
in the hidden layer.

![K-fold Cross Validation Error on number of neurons in hidden layer, no aparent model is better than the rest\label{im04}](imgs/im04.eps)

![Mean training error on number of neurons in hidden layer\label{im05}](imgs/im05.eps)

![Number of epochs necessary to train the network. It's big for the NN with little neurons
because they can never go below the artificial threshold of 8.5% where any net is stopped,
or take a long time to stabilize\label{im06}](imgs/im06.eps)

## Arbitrary Neural Network ##

Notice how the best selected model in the previous subsection differs very little from
logistic regression, in fact if we take an slightly smaller model, say one single neuron
in the hidden layer, then the model would be almost logistic regression (a $tanh$ function
is in the middle of the sum of input features and the logistic function). The best working
NN model found is almost identical to logistic regression, though the NN model seem to
perform better than logistic regression (see Section \ref{training}) but the error between the
two models is still between the error bounds (-3.7%,+3.7%).

I chosed only two models, different to logistic regression and NN with a hidden layer, to
show how even different NN models don't seem to get better results than the 2 neurons in
the hidden layer network. Proposed models:

- A NN with "two hidden layers": the first layer gets divided into two separate groups of
  neurons, one learns the data from the discrete features and the other learns the data
  from the continuous features, see figure for details \ref{zipNet}.
- A very huge NN for this problem: three hidden layers with 40, 10 and 3 neurons for
  hidden layers 1, 2 and 3, respectively.

![Special NN, with two hidden layers, one of them is broken into two pieces each one in
charge of learning one set of different features, discrete and continuous
features\label{zipNet}](imgs/zipNet.pdf)

<!-- vim:set filetype=markdown.pandoc : -->
