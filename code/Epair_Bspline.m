function[Epair]=Epair_Bspline(Nres,Dis,Bs,B1,S,aa)
R = Dis*S ;
a = 8 ;
b = a * 210 ;
Epair=zeros(1,b);
A=cell(20);
for k=1:20
    for h=1:20
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
        A{k,h}(1,1) = A{k,h}(1,1) + B1(i,j) ;
        for t=4:10
            A{k,h}(1,t-2)=A{k,h}(1,t-2)+fnval(R(i,j),Bs{1,t});
        end
    end
end
h=0;
for i=1:20
    for j=i:20
        Epair(1,1+h:a+h)=A{i,j};
        h=h+a;
    end
end
end