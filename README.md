# Fast Geometric Consistency Test (FGCT)

## Overview

FGCT is used for logos/trademarks or object detection and clasification
from test images. Method is done in three steps:

* Extract features (SIFT) from test and reference logo image.
* Match test image features with logo images feature in the descriptor space.
* Use mathced pair and using FGCT calculte the corresponding features that forms
a consistent geometry on image and logo feature sets.

## TODO

1. Replace exhaustive search matching (matchFeatures.m) with LSH.
2. Replace SIFTlib with cuda based lib.

## Notes

IMPORTANT: At first run you need to compile first the SIFT library.
For compiling the SIFT library run the sift_compile.m on SIFTlib folder.

## References

N. Zikos and A. Delopoulos, "Fast geometric consistency test for real time logo detection," Content-Based Multimedia Indexing (CBMI), 2015 13th International Workshop on, Prague, 2015, pp. 1-6.
doi: 10.1109/CBMI.2015.7153636
