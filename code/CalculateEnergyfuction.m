function[result]=CalculateEnergyfuction(Ed,EN,D,beta)
a=size(Ed,2);
b=size(EN,2);
E=sum(Ed,1);
EN=sum(EN,1);
E(1,a+1:a+b)=EN;
f=Ffunction(E,D,beta);
result=FMINCONfunction(f,a+b+1);
end                                                                                                                                                                                       