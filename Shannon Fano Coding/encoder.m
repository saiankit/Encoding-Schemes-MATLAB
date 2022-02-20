% Clear the workspace before starting the program
clc; clear;

% Probability array
p = [0.13 0.10 0.36 0.12 0.14 0.09 0.02 0.04];
code_words = ShannonFano(p);

n = length(p);
h_cap = 0;
h = 0;
for i = 1:n
    h = h + (p(i) * log2(1/p(i)));
    h_cap = h_cap + (p(i) * strlength(code_words{1,i}));
end

eff = (h / h_cap) * 100;

fprintf('Efficiency with Shannon Encoding is : %f %%\n', eff);