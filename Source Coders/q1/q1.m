clc; clear;
prompt = 'Please enter String\n';
str = input(prompt,"s");

encoded = binaryEncoder(str);

disp('Your encoded String is');
disp(encoded);

decoded = binaryDecoder(encoded);

disp('Your decoded string is');
disp(decoded);