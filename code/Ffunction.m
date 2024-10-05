function[f]=Ffunction(x,E,beta)
b=1848;
f=(norm(E*x)).^2+beta.*(norm(x(1:b)).^2);
end