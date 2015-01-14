function correspondance=FGCT(testFeatures,logoFeatures,pairs,alpha,sigma,geomthr)
% FGCT  FGCT method
%   correspondance=FGCT(testFeatures,logoFeatures,pairs,alpha,sigma,geomthr)
%   Calculates the geometric consistency using FGCT mentod.
%       testFeatures: Structure with test image features as described in
%       extractFeature.m
%       logoFeatures: Structure with logo features as described in
%       extractFeature.m
%       pairs: Structure with matching indeces as described in
%       matchFeatures.m
%       alpha: Parameter regulates the geometry consistency (0..1).
%       sigma: Standard deviation refers to the likelyhood.
%       geomthr: Threshold defines the number corresponding features that
%       form a consistent geometry.
%       correspondance: percentage of the corresponding features by the
%       total number of logo features.
%  
% Examples:
%   correspondance=FGCT(testFeatures,logoFeatures,pairs,1,6,0.2);
%
%
%% AUTHOR    : Nikos Zikos
%% $DATE     : 13-Jan-2015 15:53:25 $
%% $Revision : 1.00 $
%% DEVELOPED : 7.14 (R2012a)
%% FILENAME  : FGCT.m

% Break if number of pairs are unsuficient
if length(pairs.id_logo)<6
    correspondance=0;
    return
end

% Construct matrix D_L
DL = pdist2(logoFeatures.frames(1:2,pairs.id_logo)',logoFeatures.frames(1:2,pairs.id_logo)');

% Construct matrix D_I
DI = pdist2(testFeatures.frames(1:2,pairs.id_im)',testFeatures.frames(1:2,pairs.id_im)');
SI = repmat(testFeatures.frames(3,pairs.id_im)',1,size(DI,2));
SL = repmat(logoFeatures.frames(3,pairs.id_logo)',1,size(DL,2));
SclM = SL./SI;
DI = DI.*SclM;

%Construct matrix D
Dab = exp(-(DL-DI).^2./(sigma*SclM).^2);
D = Dab+Dab';

% Initialize similarity vector K
K = ones(size(Dab,1),1)/size(Dab,1);
dK = K;

%Iterative procedure to calculate the fixed point K
while (norm(dK,2)>10^-5)
    G = exp(alpha*D*K);
    dK = G/norm(G,1)-K;
    K = K+dK;
end

% Calculate Correspondance
[~,idx]=sort(K,'descend');
for i=1:length(idx)
    a = K*0;
    a(idx(1:i)) = 1/i;
    consistency = a'*D*a;
    if (consistency<geomthr);break;end
end

correspondance = i/logoFeatures.numFeatures;

