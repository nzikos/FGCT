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
    if ~isempty(strfind(dirList(i).name, '.jpg')) || ~isempty(strfind(dirList(i).name, '.png'))
        j = j+1;
        dirList2(j) = dirList(i);
    end
end

% Instead can be used: parfor
for i=1:length(dirList2)
    features(i) = extractFeatures([directory dirList2(i).name]);
    waitbar(i/length(dirList2),h,['Extracting features from: ' directory])
end
close(h);pause(0.01)