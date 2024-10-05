function[FlexE]=FlexEfunction(Nres,DisN,DisD)
SN=zeros(Nres);
for i=1:length(DisN)
    for j=i:length(DisN)
       if DisN(i,j)<= 9 && DisN(i,j)>=0.75
          SN(i,j)=1;
       end
    end
end
R=(DisD-DisN).^2;
P = R/2 ;
FlexE=sum(sum(SN.*P));
a=1/(Nres);
FlexE=a*FlexE;
end