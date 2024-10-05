function [DM] = DistanceMatrix(dsites,ctrs)

[M,~] = size(dsites) ;  [N,s] = size(ctrs) ;
DM = zeros(M,N) ;

for d = 1 : s
    [dr,cc] = ndgrid(dsites(:,d),ctrs(:,d)) ;
    DM = DM + (dr-cc).^2 ;
end
DM = sqrt(DM) ;
%%%%%%%% Vectorize %%%%%%%%%%

% DMv = zeros(M,N) ;
% for i = 1 : s
%   XC = bsxfun(@minus,dsites(:,i),ctrs(:,i)') ;
%   %YC = bsxfun(@minus,dsites(:,2),ctrs(:,2)') ;
%   DMv = DMv + XC.^2 ;
% end
% DMv = sqrt(DMv) ;
% 
% isequal(DM,DMv)
end