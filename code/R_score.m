function[Rscore] = R_score(first,second)
min_1 = min(first) ;
min_2 = min(second) ;
ave_1 = mean(min_1) ;
if abs(min_2 - ave_1) == abs(min_1 - ave_1) || abs(min_2 - ave_1) < abs(min_1 - ave_1)
    Rscore = (min_2-ave_1)/(min_1-ave-1) ;
else
    Rscore = -1 ;
end
