function[Bs]=BsplineBasicFunctionfrom0to15
Bs=cell(1,26);
k=0;
for r=1:26
    if r~=1 && r~=2
       t=0.25+k:0.5:1.75+k;
       Bs{1,r}=spmak(t,1);
       fnplt(Bs{1,r})
       hold on;
       k=k+0.5;
    else
       t=0+k:0.75:2.25+k;
       Bs{1,r}=spmak(t,1);
       fnplt(Bs{1,r})
       hold on;
       k=k+0.75; 
    end
end
end