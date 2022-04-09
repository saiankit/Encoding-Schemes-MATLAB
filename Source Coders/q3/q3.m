clear all; clc;
nums = mod( reshape(randperm(1*10002), 1, 10002), 2 )

P = [1 0 1;1 1 0;0 1 1];
G = [eye(3) P];
encodedMatrix = [];
for k = 1:3:10002
    m = nums(k:k+2);
    C = encode(m,6,3,'linear',G);
    encodedMatrix(end+1, :) = C;
end
H = [1 1 0 1 0 0;0 1 1 0 1 0;1 0 1 0 0 1];
ht = transpose(H);
error_count = 0;
synMatrix = encodedMatrix * ht;
check = [0 0 0];
for i = 1: length(synMatrix)
    if(synMatrix(i:i+2)~=check)
        error_count = error_count + 1;
    end
end

nz = bsc(encodedMatrix, 0.3);

decodedMatrix = [];
for k = 1:6:20004
    c = nz(k:k+5);
    D = decode(c,6,3,'linear',G);
    decodedMatrix(end+1, :) = D;
end
decodedMatrix = transpose(decodedMatrix(:));
[numerrs, pcterrs] = biterr(nums,decodedMatrix);

disp('Total number of errors corrected by the Linear Block Decoder are: ')
disp(error_count * 3);
disp('Ratio of number of errors corrected to total bits transmitted: ')
disp((error_count * 3/10002)*100);

disp('Total Error Bits after decoding the data from BSC: ')
disp(numerrs);