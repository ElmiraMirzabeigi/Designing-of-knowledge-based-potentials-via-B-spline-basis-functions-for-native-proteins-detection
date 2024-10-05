function[Xd,Xe_1] = sixTabel(first,second,Ndecoys)
for i=1:Ndecoys
    if first(i)==min(first(1:Ndecoys))
        min_1 = i ;
    end
    if second(i)==min(second(1:Ndecoys))
        min_2 = i ;
    end
end
Xd = first(min_1) ;
Xe_1 = first(min_2) ;
end
