function[Dis]=Distance_Matrix(first,second,method)
[a,b]=size(first);
[c,d]=size(second);
m = 0 ;
if strcmp(method,'Ca')
    Dis=zeros(a,c);
    for i=1:a
        for j=i:c
            R = bsxfun(@minus,first(i,:),second(j,:));
            Dis(i,j) = sqrt(sum(R.^2));
        end
    end
else
    Dis = zeros ;
    for i=1:a
        for j=i+1:b
            R = abs(bsxfun(@minus,first(i,j),second)) ;
            Dis(1+m:c+m,1:d) = R ;
            m = m + c ;
        end
    end
end
end