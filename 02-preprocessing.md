# Preprocessing #

In early attempts, I tried to train the network without preprocessing at all, and the net
was not able to learn anything, or at least, nothing fast enough. As it can be in the
figure <!--TODO: add figure--> the training error never got below 40%. But after some
little preprocessing (normalizing) the net was able to learn leaving with an error of
~17%.

Applying log to the data gave strange results on training (error of zero!!!, imposible!),
after some fiddling I added a one before applying the log function, and pufff... worked,
there was no more error, but the error didn't change much

<!--TODO: which? why?-->

## Training, Testing and Validation datasets ##
