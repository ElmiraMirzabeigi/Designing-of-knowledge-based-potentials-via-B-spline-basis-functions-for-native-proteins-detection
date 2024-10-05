function[f1,f2,f3] = Count_function(Bs,Dis,Nres)
f1 = zeros(Nres,Nres) ;
f2 = zeros(Nres,Nres) ;
f3 = zeros(Nres,Nres) ;
for i = 1: Nres
    for j = 1:Nres
        if Dis(i,j)<=3
            f1(i,j) = 1 ;
        elseif Dis(i,j)>3 && Dis(i,j)<=4.5
            for k=1:3
                f1(i,j) = f1(i,j) + fnval(Dis(i,j),Bs{1,k});
            end
        elseif Dis(i,j)>4.5
            f1(i,j) = 0 ;
        end
        if Dis(i,j)<=4
            f2(i,j) = 1 ;
        elseif Dis(i,j)>4 && Dis(i,j)<=5.8
            for k=1:5
                f2(i,j) = f2(i,j) + fnval(Dis(i,j),Bs{1,k});
            end
        elseif Dis(i,j)>5.8
            f2(i,j) = 0 ;
        end
        if Dis(i,j)<=7
            f3(i,j) = 1 ;
        elseif Dis(i,j)>7 && Dis(i,j)<=9
            for k=1:10
                f3(i,j) = f3(i,j) + fnval(Dis(i,j),Bs{1,k});
            end
        elseif Dis(i,j)>9
            f3(i,j) = 0 ;
        end
    end
end
end