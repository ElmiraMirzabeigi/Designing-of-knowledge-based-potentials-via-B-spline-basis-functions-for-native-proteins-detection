function[Corr]=CorrelationFunction(Sd,Ed)
averageSd=mean(Sd);
averageE=mean(Ed);
standarddeviationSd=std(Sd);
standarddeviationE=std(Ed);
Corr=0;
for i=1:20
    Corr=Corr+(((Sd(i)-averageSd)/standarddeviationSd).*((Ed(i)-averageE)/standarddeviationE));
end
Corr=(1/19).*Corr;
end