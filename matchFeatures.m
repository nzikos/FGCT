function pairs=matchFeatures(testFeatures,logoFeatures,dthr)
% matchFeatures  FGCT method
%   pairs=matchFeatures(testFeatures,logoFeatures,dthr)
%   adds matrices A and B.
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

Distances = pdist2(logoFeatures.descriptors', testFeatures.descriptors');

[minDists,id_logo]=min(Distances);
[minDists,id_im]=sort(minDists,'ascend');
id_logo=id_logo(id_im);

siz=length(find(minDists<dthr));

id_logo=id_logo(1:siz);
id_im=id_im(1:siz);

pairs.id_logo = id_logo;
pairs.id_im = id_im;