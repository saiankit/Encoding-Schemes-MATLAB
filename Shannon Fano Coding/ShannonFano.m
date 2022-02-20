function code_words = ShannonFano(p1)
    p1 = p1/sum(p1);
    
    if(length(p1)>2)
        [pdes,idx] = sort(p1,'descend');
        qsum = (2*cumsum(pdes))-1;
        [~,idx1] = min(abs(qsum));
        if((idx1>1)&&(idx1<length(pdes)-1))
            q1 = pdes(1:idx1);
            q2 = pdes((idx1+1):length(pdes));
            old_code1 = ShannonFano(q1);
            old_code2 = ShannonFano(q2);
            new_code = [strcat('0',old_code1) strcat('1',old_code2)];
        elseif(idx1==1)
            q1 = pdes(1);
            q2 = pdes(2:length(pdes));
            old_code1 = ShannonFano(q1);
            old_code2 = ShannonFano(q2);
            new_code = [old_code1  strcat('1',old_code2)];
        else
            q1 = pdes(1:((length(pdes)-1)));
            q2 = pdes(length(pdes));
            old_code1 = ShannonFano(q1);
            old_code2 = ShannonFano(q2);
            new_code = [strcat('1',old_code1)  old_code2];
        end
        code_words(idx) = new_code;
    elseif(length(p1)==2)
        code_words = {'0', '1'};
    else
        code_words = {'0'};
    end
end