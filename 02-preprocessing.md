# Preprocessing #

In early attempts, I tried to train the network without preprocessing at all, and the net
was not able to learn anything, or at least, nothing fast enough. As it can be seen in the
figure \todo{add figure number} the training error never got below 40%, even after 10000
training epochs. The gradient, as can be seen in the figure \todo{add second fig}, was very
small, but the optimization error (see figure \todo{add figure with trainCE}) got
nontheless small as time went on, suggesting that the net was indeed learning but it was
in a region of the optimization space where the gradient was very small.

\missingfigure{Show error rate not going down when preprocessing is deactivated}

\missingfigure{Shor how the gradient didn't change much and got pretty damn low}

\missingfigure{show trainCE of net to show that it was indeed learning, optimizing,
optimization the optimization function use was $(prediction-label)^2$}

I decided to normalize each column of the input data using the student's
t-statistic[^statwiki] and found that the optimization process converged fast to a value
around 19%! Take away, normalization is key for solving machine learning problems!

[^statwiki]: A detailed description of all possible methods to normalize input data can be
  found in <https://en.wikipedia.org/wiki/Normalization_(statistics)>. I used the method
  called student's t-statistic given that I only had the estimated parameters and not the
  real values for the distributions.

One additional preprocessing step was to apply log to each column on the data and add it
as more info to use for learning. The principle behind this preprocessing step was that
the correlation between the labels and the data could be non-lineal, especifically,
exponential.[^sidenote]

<!--I need to note that this preprocessing step didn't seem to had added any more
information for the nns to learn-->

[^sidenote]: As a side note, applying log to the data gave strange results on training the
  first time I implemented it, many of the column data became NaN and made the learning
  process ineffective, the Neural Nets just diverged and couldn give any prediction. To
  prevent NaN values on the data I decided to add one ($1$) before applying log, this
  little change prevented log to receive 0 as value and allowed me to continue with the
  training process without much trouble.

The discrete features in the dataset `time_signature` and `key` were converted into a
one-hot-vector representations. `time_signature` has 8 (from 0 to 7) possible values while
`key` has 12 (from 0 to 11) possible values. The resulting vector of discrete features for
each datapoint has size 21 (8 + 12 + 1, 1 value for the `mode` binary feature). For each
of the 27 continuous features an additional feature was created, the additional features
were the result of applying log to each column. A normalization step was performed for
each of the 54 continuous resulting features. The total of features used per datapoint
was 75 (21 discrete and 54 continuous).

## Training, Testing and Validation datasets ##

The original 9269 datapoints were distributed randomly in:

- Test set. Size 1390, 15% of 9269
- and, Training set. Size 7879, 85% remaining of 9269

The value of 15% was selected as a good compromise between the scare total dapoints for
the problem, and a (not so) descent precision error. I refer here about precision in the
context of Chernoff bounds. Remember that the additive form of the Chernoff bounds are
given by the equation:

\inlinetodo{Add chernoff equation}

If we assum delta equal to 5% \todo{convert to latex} (a confidence of 95%), and N to
the size of the test set, we know by solving the equation above that there is at most
a ~3.64% difference between the experimental classification error and the real error of
the model when the model is tested using the test set, i.e., I know that if I get a 19%
classification error on the test set for a model, then this model has a real[^realdata]
classification error lies between 16% and 22%

[^realdata]: When I refer to "real" here I'm talking about all possible datapoints, music
  between the two genres, and not only the data that we have access to

As shown in the next section three different kinds of models were used to try to solve
the problem, the second kind of model used was a neural network with a single hidden layer
of arbitrary size. To select the right size on the number of neurons in the hidden network
k-fold cross validation was used, for this the training set was divided in blocks of 14%
of the dataset size (XXXX data points by block \todo{add number}). With a size of 14% it
was possible to break the training set in six blocks, contrary to use 15% (the value used
for the test set) which would only give five blocks to perform k-fold.

An important point to note here is that the same test and training sets, as well as the
"validation" sets used in cross validation, were the same for all models tested, i.e., the
same original seed was used to randomize the dataset for each test, every test is
therefore replicable, all instructions to replicate the results in the current paper can
be found in the source code.

<!-- vim:set filetype=markdown.pandoc : -->
