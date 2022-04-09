numerr = [];
pcterr = [];
x = [];
ratio = [];
for k = 100:100:20000
    nums = mod( reshape(randperm(1*k), 1, k), 2 );
    x(end+1) = k;
    nz = bsc(nums, 0.7);
    [numerrs, pcterrs] = biterr(nums,nz);
    numerr(end+1) = numerrs;
    pcterr(end+1) = pcterrs;
    ratio(end+1) = numerrs/k;
end
f1 = figure;
plot(x,numerr,'LineWidth',2);
grid on;
title('Error Digits v/s Total Digits');
xlabel('Total Digits');
ylabel('Error Digits');
f2 = figure;
plot(x,ratio,'LineWidth',2);
grid on;
title('(Error Digits/Total Digits) v/s Total Digits');
xlabel('Total Digits');
ylabel('(Error Digits/Total Digits)');