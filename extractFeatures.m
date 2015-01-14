function features=extractFeatures(filename)
% extractFeatures  FGCT method
%   features=extractFeatures(filename)
%   adds matrices A and B.
%
% Examples:
%   features=extractFeatures('test.jpg');
%
%
%% AUTHOR    : Nikos Zikos
%% $DATE     : 13-Jan-2015 15:53:25 $
%% $Revision : 1.00 $
%% DEVELOPED : 7.14 (R2012a)
%% FILENAME  : extractFeatures.m

I = double(rgb2gray(imread(filename)))/256 ;
[features.frames,features.descriptors] = sift(I, 'Verbosity', 0);
features.file=filename;
features.numFeatures=size(features.frames,2);