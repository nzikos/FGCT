function features=extractFeaturesBulk(directory)
% extractFeaturesBulk  FGCT method
%   features=extractFeaturesBulk(directory)
%   adds matrices A and B.
%
% Examples:
%   features=extractFeaturesBulk('./sampleData/test/')
%
%
%% AUTHOR    : Nikos Zikos
%% $DATE     : 13-Jan-2015 15:53:25 $
%% $Revision : 1.00 $
%% DEVELOPED : 7.14 (R2012a)
%% FILENAME  : extractFeaturesBulk.m

dirList=dir(directory);

j=0;
for i=1:length(dirList)
    if ~dirList(i).isdir && ~strncmpi(dirList(i).name,'.',1)
        j=j+1;
        features(j)=extractFeatures([directory dirList(i).name]);
    end
end