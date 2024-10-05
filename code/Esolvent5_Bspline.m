function[Es5]=Esolvent5_Bspline(Nres,non5,aa)
Bs = cell(1,8) ;
k = 0 ;
for r = 1:8
    t = -0.5+k:0.5:1.5+k ;
    Bs{1,r} = spmak(t,1) ;
    fnplt(Bs{1,r})
    hold on ;
    k = k + 0.5 ;
end
b = 8 * 20 ;
Es5=zeros(1,b);
A=cell(20);
for k=1:20
    A{k,1}=zeros(1,8);
end
for i=1:Nres
    k=aa(i);
    for t=1:8
        A{k,1}(1,t)=A{k,1}(1,t)+fnval(non5(i,1),Bs{1,t});
    end
end
h=0;
for i=1:20
    Es5(1,1+h:8+h)=A{i,1};
    h=h+8;
end
end