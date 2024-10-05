function[PPD]=Energyfunction_Bspline(Nres,DisD,Bp,aa)
a = length(Bp);
b = a * 231 ;
PPD=zeros(1,b);
A=cell(21);
for k=1:21
    for h=1:21
        A{k,h}=zeros(1,a);
    end
end
for i=1:Nres
    k=aa(i);
    for j=i+1:Nres
        h=aa(j);
        if k>h
            c=k;
            k=h;
            h=c;
        end
        for t=1:a
            A{k,h}(1,t)=A{k,h}(1,t)+fnval(DisD(i,j),Bp{1,t});
        end
    end
end
h=0;
for i=1:21
    for j=i:21
        PPD(1,1+h:a+h)=A{i,j};
        h=h+a;
    end
end
end