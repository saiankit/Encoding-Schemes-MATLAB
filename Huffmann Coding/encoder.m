% Clear the whole workspace before running
clc; clear;
% Probability matrix
p = [0.13 0.10 0.36 0.12 0.14 0.09 0.02 0.04];
code_words = huffman(p);
n = length(p);
h_cap = 0;
h = 0;
% Loop to calculate the entropy and average word length
for i = 1:n
    h = h + (p(i) * log2(1/(p(i))));
    h_cap = h_cap + (p(i) * strlength(code_words{1,i}));
end
eff = (h / h_cap) * 100;
fprintf('Efficiency with Huffman Encoding is : %f %%\n', eff);