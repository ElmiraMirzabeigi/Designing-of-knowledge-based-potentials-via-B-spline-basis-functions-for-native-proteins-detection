clear all;
clc;
load('logodd_d.mat');
X=1:1:29;
knot=1:0.01:29;
r=size(knot,2);
Yspline=cell(167);
Ysmoothing=cell(167);
Diff1=zeros(167);
Diff2=zeros(167);
 for i=1:167
     for j=i:167
         Y=zeros(1,29);
         for k=1:29
             Y(1,k)=logodd_d{i,j}(1,k);
         end
        Bsp1=spline(X,Y,knot);
        Diff1(i,j)=max(abs(Bsp1(X)-Y));
        for k=1:r
           Yspline{i,j}(1,k)=Bsp1(1,k); 
        end
        Bsp2=spaps(X,Y,2);
        p=fnplt(Bsp2);
        h=size(p,2);
        b=1;
        Y2=zeros(1,29);
        for a=1:h
            if p(1,a)==b 
               Y2(1,b)=p(end,a);
               b=b+1;
            else a=a+1;
            end
        end
        Diff2(i,j)=max(abs(Y2-Y));
        Ysmoothing{i,j}=Bsp2;
        
     end
 end
a=input('first atom: '); 
while a~=0

b=input('secend atom: ');
p2=fnplt(Ysmoothing{a,b});
for k=1:29
    x(k,1)=X(1,k);
    y(k,1)=logodd_d{a,b}(1,k);
end
[curve, goodness, output] = fit(x,y,'smoothingspline');
Diff3=max(abs(output.residuals));
[Diff1(a,b) Diff2(a,b) Diff3]
figure;
plot(curve,x,y); 
hold on
plot(knot,Yspline{a,b})
hold on
plot(p2(1,:),p2(2,:))
a=input('first atom: ');
end





