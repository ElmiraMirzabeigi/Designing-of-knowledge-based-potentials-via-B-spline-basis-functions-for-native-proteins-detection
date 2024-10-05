function[R]=Rscore(Sd,Ed)
minDecoyDistance=min(Sd);
minDecoyEnergy=min(Ed);
for i=1:20
    if Sd(i)==minDecoyDistance
        Xd=i;
    end
    if Ed(i)==minDecoyEnergy
        Xe=i;
    end
end
averageSd=mean(Sd);
if abs(Sd(Xe)-averageSd)<=abs(Sd(Xd)-averageSd)
    R=(Sd(Xe)-averageSd)/(Sd(Xd)-averageSd);
else
    R=-1;
end
end
