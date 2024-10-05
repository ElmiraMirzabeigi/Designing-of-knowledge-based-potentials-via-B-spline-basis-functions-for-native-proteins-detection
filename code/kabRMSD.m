function[rmsd]=kabRMSD(x,y)
n=size(x,1);
y=y+1e-8*max(min(randn(size(y)),10),-10);
cx=mean(x); cy=mean(y);
x=x-cx(ones(n,1),:); y=y-cy(ones(n,1),:);
if n==1
    A=eye(3);
elseif n==2
    w=sum(cross(x,y,2))/sum(sqrt(sum(x.^2,2).*sum(y.^2,2)));
    a=asin(norm(w));
    A=makehgtform('axisrotate',w,a); A=A(1:3,1:3)';
    B=makehgtform('axisrotate',w,pi-a); B=B(1:3,1:3)';
    if mean(sum((x*A-y).^2,2)) > mean(sum((x*B-y).^2,2))
        A=B;
    end
elseif n==3
    u=cross(x(1,:)-x(2,:),x(3,:)-x(2,:)); u=u/norm(u);
    v=cross(y(1,:)-y(2,:),y(3,:)-y(2,:)); v=v/norm(v);
    T=makehgtform('axisrotate',cross(u,v),acos(u*v'));
    T=T(1:3,1:3)';
    x1=x*T;
    w=sum(cross(x1,y,2))/sum(sqrt(sum(x1.^2,2).*sum(y.^2,2)));
    a=asin(norm(w));
    A=makehgtform('axisrotate',w,a); A=A(1:3,1:3)';
    B=makehgtform('axisrotate',w,pi-a); B=B(1:3,1:3)';
    if mean(sum((x1*A-y).^2,2)) > mean(sum((x1*B-y).^2,2))
        A=B;
    end
    A=T*A;
else
    A=y'*x;
    A=inv(A)*sqrtm(A*A');
end
x=x*A;
rmsd=sqrt(mean(sum((x-y).^2,2)));
