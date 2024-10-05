function[Bs]=BsplineBasicFunction8
Bs=cell(1,8);
k=0;
for r=1:8
       t=0+k:1.5:4.5+k;
       Bs{1,r}=spmak(t,1);
       fnplt(Bs{1,r})
       hold on;
       k=k+1.5; 
end
end