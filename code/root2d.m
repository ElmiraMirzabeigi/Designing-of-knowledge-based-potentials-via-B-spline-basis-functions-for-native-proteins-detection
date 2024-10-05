function F=root2d(x,EN,num)
% Calculate objective f
F=sum((EN*x(1:num,1)).^2);
% if nargout > 1 % gradient required
%    gradient_F=gradient(F,x);
% end
end
