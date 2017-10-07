# Appendix #

## Details on the source code ##

All training, testing and validation code was written in Haskell using the library
grenade[^urlgrenade], and making an extensive use of dependent types. The library
(grenade) is still a work in progress and lacks many standard procedures for training and
testing that most libraries for machine learning have. Some of the procedures I
implemented for this homework include:

- Training by batches in an epoch (using SGDM)
- K-fold cross validation training
- Arbitrary conditions to stop training process
- Many small procedures and instances from typeclasses definitions to make the above work
  (e.g., `Gradients` should be an instance of `Num` typeclass)

[^urlgrenade]: Source code and documentation for grenade can be found at
  <https://github.com/HuwCampbell/grenade>

All results presented in this work are replicable, refer to README in the source code for
more information on how to replicate the results. To make all results replicable all
random numbers used for the creation of the networks and the training procedures depend on
the same seed, which wasn't changed while performing the experiments in this work.

As a note aside, working with a new Haskell characteristic (dependent types) was a hard
learning process, but proved to be worth it because it was very difficult to write faulty
code and compile it. The compiler is very demanding on the correctness of the types up to
the point of making it a little hard to work with different types of Neural Networks at
the same time (all types are erased on running time), but thanks to the great online
Haskell community I could overpass the obstacles[^so_question].

<!--
   -[^sourcecodeurl]: As mentioned in the Introduction, the source for this homework can be
   -  found at: <https://github.com/helq/haskell-binary-classification>.
   -->

[^so_question]: You can follow this question <https://stackoverflow.com/questions/46508490/>
  on how to determine different types of NNs on runtime using dependent types in Haskell

<!-- vim:set filetype=markdown.pandoc : -->
