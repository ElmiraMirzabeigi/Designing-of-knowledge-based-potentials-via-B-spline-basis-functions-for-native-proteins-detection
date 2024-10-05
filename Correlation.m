function[Corr]=Correlation(first,second)
Ndecoys = length(first) ;
C = zeros ;
ave_1=mean(first);
ave_2=mean(second);
std_1=STD(first,ave_1);
std_2=STD(second,ave_2);
for i=1: Ndecoys
    C(i,1)=((first(i)-ave_1)/std_1).*((second(i)-ave_2)/std_2);
end
Corr = sum(C) ;
Corr=(1/(Ndecoys-1)).*Corr;
end