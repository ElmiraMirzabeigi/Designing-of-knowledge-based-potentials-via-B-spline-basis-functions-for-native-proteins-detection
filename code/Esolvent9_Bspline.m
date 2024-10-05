function[Es9]=Esolvent9_Bspline(Nres,non9,aa)
Bs = cell(1,8) ;
k = 0 ;
for r = 1:8
    t = -3.25+k:2.75:8.75+k ;
    Bs{1,r} = spmak(t,1) ;
    fnplt(Bs{1,r})
    hold on ;
    k = k + 2.75 ;
end
b = 8 * 20 ;
Es9=zeros(1,b);
A=cell(20);
for k=1:20
    A{k,1}=zeros(1,8);
end
for i=1:Nres
    k=aa(i);
    for t=1:8
        A{k,1}(1,t)=A{k,1}(1,t)+fnval(non9(i,1),Bs{1,t});
    end
end
h=0;
for i=1:20
    Es9(1,1+h:8+h)=A{i,1};
    h=h+8;
end
end