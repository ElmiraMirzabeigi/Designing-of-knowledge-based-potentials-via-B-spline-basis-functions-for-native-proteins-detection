function[non5,non9] = number_of_neighbors(Nres,Count5,Count9)
non5 = zeros(Nres,1) ;
non9 = zeros(Nres,1) ;
for i = 1:Nres
    if i == Nres
        non5(i,1) = sum(Count5(:,i)) ;
        non9(i,1) = sum(Count9(:,i)) ;
    else
        non5(i,1) = sum(Count5(i,:)) ;
        non9(i,1) = sum(Count9(i,:)) ;
    end
end