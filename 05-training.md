# Training #

## Logistic Regression ##

Solving logistic regression using Gradient Descent (GD) is very slow, see figure
\todo{add figure of logistic-slow}, but we can use Stochastic Gradient Descent to find a
non-optimal solution quickly and then find the best local minimum with GD,
\todo{see second figure}.

\missingfigure{logistic-slow training and testing error}

\missingfigure{both logistic1 and logistic2 training and testing errors}

<!--
   -plot 'training/logistic-slow.txt' using 'epoch':'train_classification_error' with line, 'training/logistic-slow.txt' using 'epoch':'test_classification_error' with line
   cp training/logistic{1,}.txt
   tail -n +3 training/logistic2.txt >> training/logistic.txt
   -plot 'training/logistic1.txt' using 'epoch':'train_classification_error' with line, 'training/logistic1.txt' using 'epoch':'test_classification_error' with line
   -plot 'training/logistic2.txt' using 'epoch':'train_classification_error' with line, 'training/logistic2.txt' using 'epoch':'test_classification_error' with line
   -->

The lowest training error for logistic regression was ~15.9%, and the test error was ~19.1%.

## NN with a hidden layer of two neurons ##

The results of training the NN can be seen in the figure \todo{add figure}. The values for
the training and test errors are ~12.7% and ~17.6%, respectively.

\missingfigure{training and testing error of nn 2-hidden}

<!--plot 'training/hidden-2.txt' using 'train_classification_error' with line, 'training/hidden-2.txt' using 'test_classification_error' with line-->

## Two Arbitrary NN models ##

The results of training the NN model with two hidden layers, one of which is divided into
two different regions (to separate learning of discrete and continous features) can be
seen in figure \todo{add ref fig}. The values for training and test erors are ~13.0%
and ~17.7%, respectively.

\missingfigure{training and testing error of arbitrary discrete and continuous}
<!--plot 'training/separated_discrete_continuous.txt' using 'train_classification_error' with line, 'training/separated_discrete_continuous.txt' using 'test_classification_error' with line-->

The results of training the huge NN model (3 hidden layers) can be seen in figure
\todo{add ref figure}. The values for training and test erors are ~7.0% and ~19.9%,
\todo{add real values} respectively.

\missingfigure{training and testing error of huge}
<!--plot 'training/huge.txt' using 'train_classification_error' with line, 'training/huge.txt' using 'test_classification_error' with line-->

<!-- vim:set filetype=markdown.pandoc : -->
