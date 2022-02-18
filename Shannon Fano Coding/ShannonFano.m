function code1 = ShannonFano(p1)
set(0,'RecursionLimit',1e4);

if ((sum(p1>=0)~=length(p1)))
    error('Enter a probability vector');
end
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
       % disp(new_code);
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
   % disp(idx);
    code1(idx) = new_code;

elseif(length(p1)==2)
    code1 = {'0', '1'};
else
    code1 = {'0'};
end
length1 = cellfun(@length, code1);
end