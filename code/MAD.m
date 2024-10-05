function[std] = MAD(X)
% Y = [mean(X),median(X),mode(X)] ;
% if Y(1)==Y(2)&& Y(2)==Y(3)
%     m = Y(1) ;
% else
%     for i = 1:3
%         if Y(i)~=max(Y) && Y(i)~=min(Y)
%             m = Y(i) ;
%             break ;
%         end
%     end
% end
n = length(X);
m = mean(X) ;
Y = sum(abs(X - m));
std = Y/n ;
end