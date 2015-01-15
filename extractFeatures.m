function features=extractFeatures(filename)
% extractFeatures  Method for extracting SIFT features from image
%   features=extractFeatures(filename)
%   Read thes images filename transforms it to grayscale and extracts SIFT
%   features. The output features is a structure
%      features.frames: Matrix where each vector refers to the position,
%      the scale and the principal orientation of the feature.
%      features.descriptors: Matrix where each vector refers to the 128
%      element descriptor.
%      features.file: Is string with images name.
%      features.numFeatures: Total number of features.
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

I = imread(filename);
if size(I,3)==3
    I=rgb2gray(I);
end
I=double(I)/256;
[features.frames,features.descriptors] = sift(I, 'Verbosity', 0);
features.file = filename;
features.numFeatures = size(features.frames,2);