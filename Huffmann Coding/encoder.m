clc; clear;
p = [0.4 0.2 0.2 0.1 0.1];
%p = [0.25 0.5 0.125 0.125];
code = huffman(p);

n = length(p);
h_cap = 0;
h = 0;
for i = 1:n
    rev = 1/(p(i));
    h = h + (p(i) * log2(rev));
    h_cap = h_cap + (p(i) * strlength(code{1,i}));
end

eff = h / h_cap;

eff * 100;

fprintf('Efficiency with HUffmann Encoding is : %f %%\n', eff * 100);