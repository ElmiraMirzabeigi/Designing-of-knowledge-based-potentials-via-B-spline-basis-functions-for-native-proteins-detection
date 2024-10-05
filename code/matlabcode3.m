clear all;
clc;
load('logodd_d.mat');
X=1:1:29;
knot=aptknt(X,3); % This function returns a knot sequence suitable for interpolation

% Calculate Piecewise polynomial structure form bspline function
PP=zeros(1,32);
t=zeros(8,4);
f=1;
for k=1:8
    for j=1:4
        t(k,j)=knot(1,f);
        f=f+1;
    end
end
c=1;
for k=1:8
    T=t(k,:);
    B=bspline(T);
        for j=1:3
            PP(1,c)=B.coefs(1,j);% Piecewise polynomial structure
            c=c+1;
        end
end

i=1;
j=1;
for i=1:167
    for j=i:167
        Bsp1=spline(X,logodd_d{i,j},knot);
%          Bsp2=spaps(X,logodd_d{i,j},knot);
 %       Bsp3=fit(X,logodd_d{i,j},'spline');
       
    end
end

input('Which pair of atoms? [a, b] is a pair of atoms');
a=input('please type a number from 1 until 167 for first atom: ');
b=input('please type a number from number(a) until 167 for second atom: ');
while b<a
   b=input('ATTENTION...please type a number from number(a) until 167 for second atom: ');     
end
plot(X,logodd_d{a,b},'DisplayName','polyfit')
hold on
plot(XX,Bsp1{a,b},'DisplayName','interpolation - spline function')
% hold on
% plot(XX,Bsp2{a,b},'DisplayName','smothing - spaps function')
% hold on
% plot(X,Bsp3{a,b},'DisplayName','fit function')


