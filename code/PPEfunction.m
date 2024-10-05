function[PPE]=PPEfunction(Nres,Dis,Bs,aa,S,a,b,c,d)
PPE=zeros(c,d);
A=cell(a);
Dis=Dis.*S;
for i=1:a
    for j=1:a
        A{i,j}=zeros(1,b);
    end
end

for i=1:Nres
   for j=i+1:Nres
       if Dis(i,j)~=0
          k=aa(i);
          h=aa(j);
          if k>h
             c=k;
             k=h;
             h=c;
          end
          for t=1:b
              B=fnval(Dis(i,j),Bs{1,t});  
              A{k,h}(1,t)=A{k,h}(1,t)+B;
          end 
       end
   end
end
k=1;
h=1;
for i=1:a
    for j=i:a
        for t=1:b
            PPE(k,h)=A{i,j}(1,t);
            h=h+1;
        end
        k=k+1;
    end
end
% PPE=DeleteZeroRowOrColumn(PPE);
end