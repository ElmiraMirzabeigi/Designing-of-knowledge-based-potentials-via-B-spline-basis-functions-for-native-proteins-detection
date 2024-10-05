function[Corr]=Correlation_metric_energy(first,second,ave_2,std_2,Ndecoys)
ave_1 = mean(first(1:Ndecoys)) ;
std_1 = STD(first,ave_1,Ndecoys) ;
C = (first - ave_1)/std_1 ;
D = (second - ave_2)/std_2 ;
Corr = C .* D ;
Corr = (1/(Ndecoys-1)).*sum(Corr) ;
end