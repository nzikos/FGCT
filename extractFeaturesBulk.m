function features=extractFeaturesBulk(directory)
% extractFeaturesBulk  Extract SIFT features from all images in a directory
%   features=extractFeaturesBulk(directory)
%   direcory: string with directory
%   features: Vector of structures as defined in extractFeatures.m. Each
%   element refers each image inside directory.
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
h = waitbar(0,'Extracting features');
j=0;
for i=1:length(dirList)
    waitbar(i/length(dirList),h,['Extracting features from: ' directory])
    if ~isempty(strfind(dirList(i).name, '.jpg')) || ~isempty(strfind(dirList(i).name, '.png'))
        j = j+1;
        features(j) = extractFeatures([directory dirList(i).name]);
    end
end
close(h);pause(0.01)