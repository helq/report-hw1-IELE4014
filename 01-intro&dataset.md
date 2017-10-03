# Introduction and Dataset #

In the present paper I hope to show the process I followed to try to solve a binary
classification problem using two techniques of machine learning, logistic regression and
neural networks.

The task is to classify two different genres of music from the MSD genre
dataset[^urldataset]. The two genres that were intended to be classified for this paper
are "dance and electronica" and "jazz and blues", the former with a total of 4935 members
and the latter with a total of 4334. The error used in the analysis of the data gattered
in the paper is accuracy, or more precisely the "inverse" of accuracy, namely $error = 1 - acc$,
and not any other measures like f1-score, recall or sensitivity, to name a few. No
measures different to accuracy are required here given that the data is almost evenly
distributed over to classes of similar sizes.

[^urldataset]: The dataset can be found in
  <https://labrosa.ee.columbia.edu/millionsong/blog/11-2-28-deriving-genre-dataset>

The code implementing the training procedures, postprocessing and graphic analysis can be
found in <https://github.com/helq/haskell-binary-classification>.

<!-- vim:set filetype=markdown.pandoc : -->
