# Optimization/Training Algorithm #

The algorithm used for training all networks in this work was Stochastic Gradient Descent
with Momentum (SGDM). SGDM is the default algorithm for optimizing in the grenade library,
<!--TODO: I never really said that this was the library I was using-->
it's popular enough and gave me reliable results.

In earlier experimentation I found that some of the best parameters to use in training the
NNs were:

- Batch size: 100 (around 1/92 of the original set size).
- Stopping conditions:
    1. A maximum of 300 epochs. Any NN that was trained for more than 300 seemed to not
       improve a lot in the validation test.
    2. Classification Error in Training set (trainCE) gets smaller than 8.5%. Any NN that
       went below the threshhold of 8.5% was most certaintly memorizing the training data.
    3. Maximum trainCE difference in the last 15 epochs has been smaller than
       0.4%, i.e., if after 15 epoch the trainCE didn't change much (all errors are between a
       margin of 0.4%) then there's no need to continue the training, the NN won't probably
       learn anything further.

The parameters used for logistic regression were similar to the above, but given the
nature of logistic regression (it has a single global minimum) I decided to use all
training data at once (no batching), and the third criteria for stopping changed from
looking at the last 15 epoch to look the last 30 epochs for a change in the trainCE
smaller than 0.4%.

<!-- vim:set filetype=markdown.pandoc : -->
