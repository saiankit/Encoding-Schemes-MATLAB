% Clearing Workspace before starting the run
clc; clear;

% Input a grayscale image
image = imread('cameraman.tif');

% imhist calculates the histogram of the grayscale image and stores the
% histogram counts in counts matrix and the bin Locations in binLocations
% matrix
[counts, binLocations] = imhist(image);

% To normalize the histogram counts, and get the probabilites of each pixel
% we are dividing the counts matrix with a scalar [ numel(image) => total
% number of pixels in the whole image ] 
normalisedHistogramCounts = counts./numel(image);

% Probabilty matrix is the the normalised Histogram Matrix but considering
% only cases when it is greater than 0, so that the logarithm doesn't
% throw any error
probabilityMatrix = normalisedHistogramCounts(normalisedHistogramCounts>0);

% Entropy is the - (sum of p * log2(p))
H = sum(-probabilityMatrix.*log2(probabilityMatrix));
fprintf("The entropy of the image is %f \n", H);