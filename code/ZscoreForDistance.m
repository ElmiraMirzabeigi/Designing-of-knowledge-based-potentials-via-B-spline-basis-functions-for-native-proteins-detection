function[Z]=ZscoreForDistance(Sd)
N=size(Sd,2);
minDecoyDistance=min(Sd);
for i=1:N
    if Sd(i)==minDecoyDistance
        Xd=i;
    end
end
averageSd=mean(Sd);
standarddeviationSd=std(Sd);
Z=(Sd(Xd)-averageSd)/(standarddeviationSd);
end
