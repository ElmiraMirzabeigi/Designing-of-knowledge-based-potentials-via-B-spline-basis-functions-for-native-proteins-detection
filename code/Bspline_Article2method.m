clc
%% b-spline basis
Bs = cell(1,8) ;
k = 0 ;
for r = 1:10
    t = 1+k:0.6:3.4+k ;
    Bs{1,r} = spmak(t,1) ;
    fnplt(Bs{1,r})
    hold on;
    k = k + 0.6 ;
end
X = 0 : 0.01 : 10 ;
f1 = zeros(1,length(X)) ;
f2 = zeros(1,length(X)) ;
f3 = zeros(1,length(X)) ;
for i = 1: length(X)
    if X(i)<=3
       f1(i) = 1 ;
    elseif X(i)>3 && X(i)<=4.5
        for j=1:3
            f1(i) = f1(i) + fnval(X(i),Bs{1,j});
        end
    elseif X(i)>4.5
       f1(i) = 0 ;
    end
    if X(i)<=4
       f2(i) = 1 ;
    elseif X(i)>4 && X(i)<=5.8
        for j=1:5
            f2(i) = f2(i) + fnval(X(i),Bs{1,j});
        end
    elseif X(i)>5.8
       f2(i) = 0 ;
    end
    if X(i)<=7
       f3(i) = 1 ;
    elseif X(i)>7 && X(i)<=9
        for j=1:10
            f3(i) = f3(i) + fnval(X(i),Bs{1,j});
        end
    elseif X(i)>9
       f3(i) = 0 ;
    end
end
plot(X,f1,'LineWidth',2)
hold on
plot(X,f2,'LineWidth',2)
hold on
plot(X,f3,'LineWidth',2)
%% Calculate number of neighbors
