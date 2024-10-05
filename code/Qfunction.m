function[Q]=Qfunction(Nres,DisN,DisD)
SN=zeros(Nres);
SD=zeros(Nres);
sc=0;
lc=0;
for i=1:Nres
   for j=i:Nres
       if DisN(i,j)<=9 && DisN(i,j)>=3
          SN(i,j)=1;
       end
   end
end
for i=1:Nres
   for j=i:Nres
       if DisD(i,j)<=9 && DisD(i,j)>=3
          SD(i,j)=1;
       end
   end
end
for i=1:Nres
   for j=i:Nres
       if SN(i,j)==SD(i,j) && SN(i,j)~=0
           sc=sc+1;
       elseif SN(i,j)~=SD(i,j)
           lc=lc+1;
       end
   end
end
q=sc/(lc+sc);
Q=1-q;
end
