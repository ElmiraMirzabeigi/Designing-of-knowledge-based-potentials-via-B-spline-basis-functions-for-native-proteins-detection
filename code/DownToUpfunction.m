function[P]=DownToUpfunction(P)
a=size(P,1);
for i=1:a-1
    for j=i+1:a
        if P(i,1)>P(j,1)
           c=P(i,:);
           P(i,:)=P(j,:);
           P(j,:)=c;
        end
    end
end
end