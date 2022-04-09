function [decoded] = binaryDecoder(encodedString)
    %binaryDecoder Decodes the fixed length encoded string back to
    %alphabets
    
    letters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
    binaries = {'00000','00001','00010','00011',...
        '00100','00101','00110','00111',...
        '01000','01001','01010','01011',...
        '01100','01101','01110','01111',...
        '10000','10001','10010','10011',...
        '10100','10101','10110','10111',...
        '11000','11001'};
    decoderMap = containers.Map(binaries, letters);
    
    decoded = "";
    for k = 1:5:strlength(encodedString)
        code = "";
        for l = k:k+4
            code = append(code,encodedString(l));
        end
        decoded = append(decoded,decoderMap(code));
    end
end