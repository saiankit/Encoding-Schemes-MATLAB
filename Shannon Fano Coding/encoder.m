clc; clear;
p = [0.22 0.28 0.15 0.30 .05];
%p = [0.25 0.5 0.125 0.125];
code = ShannonFano(p);

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

fprintf('Efficiency with Shannon Encoding is : %f %%\n', eff * 100);