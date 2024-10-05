function[M]=DeleteZeroRowOrColumn(M)
A=size(M,1);
for j=A:-1:1
    if M(j,:)==0
       M(j,:)=[];
       a=8*j;
       for k=a:-1:a-7
           M(:,k)=[];
       end
    end
end
end