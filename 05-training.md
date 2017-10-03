# Training #

## Logistic Regression ##

Solving logistic regression using Gradient Descent (GD) is very slow, see figure
\ref{im07}, but we can use Stochastic Gradient Descent to find a
non-optimal solution quickly and then find the best local minimum using GD,
see figure\ref{im08}.

![Solving the logistic problem using Gradient Descent (GD) (all data is used to determine the
direction of the gradient per epoch). GD proves to be slow \label{im07}](imgs/im07.eps)

![Solving the logistic problem using Stochastic Gradient Descent (SGD) with an initial
batch size of 100, and switching to Gradient Descent (no batching) in epoch 30. Using this
two step method is faster to find to a good solution with SGD and improve it to find the
best possible solution using GD.
\label{im08}](imgs/im08.eps)

The lowest training error for logistic regression was ~15.9%, and the test error was ~19.1%.

## NN with a hidden layer of two neurons ##

The results of training the NN can be seen in the figure \ref{im09}. The values for
the training and test errors are ~12.7% and ~17.6%, respectively.

![Training and Test error for a NN with a hidden layer of two neurons.\label{im09}](imgs/im09.eps)

## Two Arbitrary NN models ##

The results of training the NN model with two hidden layers, one of which is divided into
two different regions (to separate learning of discrete and continous features) can be
seen in figure \ref{im10}. The values for training and test erors are ~13.0%
and ~17.7%, respectively.

![Training and Test error for the NN that separates the middle layer into two non-conected
layers, one for the discrete features and the other continuous features.\label{im10}](imgs/im10.eps)

The results of training the huge NN model (3 hidden layers) can be seen in figure
\ref{im11}. The values for training and test erors are ~7.0% and ~19.9%,
respectively.

![Training and Test error for the "huge" NN.\label{im10}](imgs/im10.eps)

<!-- vim:set filetype=markdown.pandoc : -->
