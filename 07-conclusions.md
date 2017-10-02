# Conclusions #

This homework seemed easy to solve because it isn't that complicated to define a big
neural network capable of learing almost any distribution we throw at it, but the
very small dimension of the feature space (it was a reduced feature space from other
richer feature space, the wave representation of sound, i.e., thousends of datapoints per
song and not simply 30 features describing them) and the very small quantity of
datapoints/songs available made it incredible hard to minimize the testing error below 17%
reliably.

Given a simple classification proble, I presented three-ish models that classify the data
with an error of around 17.1%. The problem is hard to solve given the special conditions
of it.

There are several aproaches that we could take to try do find a better classifier, but all
of them are hard. Either, finding a better preprocessing strategy, having more data
available, or finding the right distribution for the data, are hard tasks. Probably
the best strategy to follow to improve the classifiers would be to finding more data.

Another possible approach is to have access to more features that describe the two classes
of datapoints, after all, the 30 features present for each datapoint in the dataset are
just a fraction of what the real audio data consisted.

<!-- vim:set filetype=markdown.pandoc : -->
