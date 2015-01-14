function pairs=matchFeatures(testFeatures,logoFeatures,dthr)
% matchFeatures  Method for matching features with exhaustive search
%   pairs=matchFeatures(testFeatures,logoFeatures,dthr)
%   Matches features between the test images and the logo reference. dthr
%   referes to the threshold on feature distance. Every feature within a 
%   hyper ball with radius dthr is mathced with the corresponding feature.
%   The inputs testFeatures and logoFeatures are structures defined in
%   extractFeatures.m
%   The output pairs is a structure such as:
%      pairs.id_logo: Vector with logo feature indeces
%      pairs.id_im: Vector with the corresponding image feature indeces
%
% Examples:
%   pairs=matchFeatures(testFeatures,logoFeatures,0.6)
%
%
%% AUTHOR    : Nikos Zikos
%% $DATE     : 13-Jan-2015 15:53:25 $
%% $Revision : 1.00 $
%% DEVELOPED : 7.14 (R2012a)
%% FILENAME  : matchFeatures.m

% Calculate all Euclidia distances between all features
Distances = pdist2(logoFeatures.descriptors', testFeatures.descriptors');

% Find min distances and sort them
[minDists,id_logo]=min(Distances);
[minDists,id_im]=sort(minDists,'ascend');
id_logo=id_logo(id_im);

% Reject distances higher than dthr
siz=length(find(minDists<dthr));
id_logo=id_logo(1:siz);
id_im=id_im(1:siz);

% Construct the pars structure
pairs.id_logo = id_logo;
pairs.id_im = id_im;