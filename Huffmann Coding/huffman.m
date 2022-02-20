function code_words = huffman(p)
    p = p/sum(p);
    if(length(p)>2)
        [pdes,idx] = sort(p,'descend');
        q1 = pdes(1:(length(pdes)-1));
        q1(length(pdes)-1) = pdes(length(pdes)-1)+pdes(length(pdes));
        old_code = huffman(q1);
        new_code = [old_code(1:(length(old_code)-1)) strcat(old_code{length(old_code)},'0') strcat(old_code{length(old_code)},'1')];
        code_words(idx) = new_code;
    elseif(length(p)==2)
        code_words = {'0', '1'};
    end
end