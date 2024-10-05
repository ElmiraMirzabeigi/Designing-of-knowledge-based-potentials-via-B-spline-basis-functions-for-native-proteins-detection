function[std] = STD(X,mean)
a = length(X) ;
Y = sum((X - mean).^2) ;
std = sqrt(Y/a) ;
end
