function[PPD]=Energyfunction_RBF(Nres,Dis,aa,Xp,str,ep)
a = length(Xp) ;
b = a * 210 ;
PPD=zeros(1,b);
A=cell(20);
for k=1:20
    for h=1:20
        A{k,h}=zeros(1,a);
    end
end
DisXp = Distance_Matrix(Dis,Xp,1);
if strcmp(str,'TPS')
    IM=tps(ep,DisXp);
else
    kernel=rbf(str) ;
    IM=kernel(ep,DisXp);
end
m = 0 ;
for i=1:Nres
    k=aa(i);
    for j=i+1:Nres
        m = m + 1 ;
        h=aa(j);
        if k>h
            c=k;
            k=h;
            h=c;
        end
        for t = 1:a
            A{k,h}(1,t)=A{k,h}(1,t)+IM(m,t);
        end
    end
end
h=0;
for i=1:20
    for j=i:20
        PPD(1,1+h:a+h)=A{i,j};
        h=h+a;
    end
end
end