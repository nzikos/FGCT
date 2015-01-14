% main  Demostrates the FGCT method
%   Extract test and logo image features, claculates the matching
%   descriptors and then calculates using FGCT the geometric consistency. 
%   IMPORTANT: At first run you need to compile first the SIFT library.
%   For compiling the SIFT library run the sift_compile.m on SIFTlib folder.
%
%% AUTHOR    : Nikos Zikos
%% $DATE     : 13-Jan-2015 15:53:25 $
%% $Revision : 1.00 $
%% DEVELOPED : 7.14 (R2012a)
%% FILENAME  : main.m

clear all;clc;
addpath('SIFTlib')
checkCompilation();

fprintf('Extracting test image SIFT features...')
testImages=extractFeaturesBulk('./sampleData/test/');
fprintf('done\n')
fprintf('Extracting logo reference image SIFT features...')
logoImages=extractFeaturesBulk('./sampleData/logos/');
fprintf('done\n')

% FGCT Parameters
dthr    = 0.4;
alpha   = 1.2;
sigma   = 4;

fprintf('Calculating correspondances for every test image for every logo...')
tic
for i=1:length(testImages);
    for j=1:length(logoImages)
        % Procedure to match features between image and logo
        % Matching is done using exhaustive search. Using LSH methods
        % the process time is reduced about 10 times.
        pairs = matchFeatures(testImages(i),logoImages(j),dthr);
        % Procedure that calculate the correspondance using FGCT
        correspondance(i,j) = FGCT(testImages(i),logoImages(j),pairs,alpha,sigma);
    end
end
d = toc;
fprintf('done\n')
disp(['Average execution time: ' num2str(1000*d/(numel(correspondance))) 'ms per image'])

bar(correspondance);grid on
legend('Class 1','Class 2')
