function[mt]=MTfunction(Nres,DisN,DisD)
SN=zeros(Nres);
P=zeros(Nres);
R=zeros(Nres);
mt = 0 ;
for i=1:Nres
    for j=1:Nres
       if DisN(i,j)<= 9 && DisN(i,j)>=3
          SN(i,j) = 4 ;
          R(i,j) = (0.5)*(DisD(i,j)-DisN(i,j)) ;
          P(i,j) = exp(-R(i,j)) ;
          mt = mt + (P(i,j) + R(i,j) - 1) ;
       end
    end
end
a=1/Nres;
mt=a*mt;
end