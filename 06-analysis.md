# Analysis #

Logistic regression gives us a baseline to compare with other approaches. The baseline is
therefore around 19.1% classification error using the test set reserved for this purpose.

There is an apparent improvement in the classification error using a Multilayered Neural
Net with only two neurons. This more powerful model has an classification error of around
17.6%, but given the small size of the test set (1390 datapoints) and assuming a
confidence of 95%, we know that the real classification error lies between
$(14.0,21.2)$ (approximately), which means that there is actually no warranty that this
model does in fact is better than logistic regression :( .

A similar conclusion can be derived when analyzing the two additional proposed models.
Even though anything I write here about the models could be completely wrong, I could
argue that we see how the first model which has a very small number of additional neurons
seems to classify as well as the one-hidden-layer 2 neurons NN model. I could also argue
that the "huge" model does not perform better than logistic regression, which is a very
simple model suggesting that this very huge model is not very good for the task.

The classification error could probably get lower using a better preprocessing strategy,
recall how non-normalized data, no preprocessing on the data, made the process of learning
excruciatingly slow.

Another factor that could help improve the classification error is having more data, or
finding the right kind of model (this is, though, very hard, because the best model should
adjust to the data distribution very closely, but not knowing this distribution is the
whole reason of not using analytic methods on this problem).

<!-- vim:set filetype=markdown.pandoc : -->
