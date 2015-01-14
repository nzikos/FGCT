function checkCompilation()

cd('SIFTlib');
if ~exist(['siftdescriptor.' mexext],'file')
    disp('IMPORTANT: At first run you need to compile first the SIFT library.')
    disp('For compiling the SIFT library run the sift_compile.m on SIFTlib folder.')
    sift_compile();      
end
cd('..');