clear all
clc;
load('logodd_d.mat');
X=1:1:29;
knot=1:0.01:29;
r=size(knot,2);
Yspline=cell(167,167);
% Ysmoothing=cell(167,167);
 for i=1:167
     for j=i:167
        Bsp1=spline(X,logodd_d{i,j},knot);
        for k=1:r
           Yspline{i,j}(1,k)=Bsp1(1,k); 
        end
%         Bsp2=spaps(X,logodd_d{i,j},2);
%         Ysmoothing{i,j}=Bsp2;
     end
 end

a=input('first atom: ');
b=input('secend atom: ');
% for k=1:29
%     x(k,1)=X(1,k);
%     y(k,1)=logodd_d{a,b}(1,k);
% end
% [curve, goodness, output] = fit(x,y,'smoothingspline');
figure(1);
% plot(curve,x,y); 
hold on
plot(X,logodd_d{a,b})
hold on
plot(knot,Yspline{a,b})
% hold on
% fnplt(Ysmoothing{a,b})
