function [kernel] = rbf(str)
switch (str)
    case 'GA'
        kernel  = @(ep,r) exp(-(ep.*r).^2) ;
    case 'MQ'
        kernel = @(ep,r) sqrt(ep^2 + r.^2) ;
    case 'IMQ'
        kernel = @(ep,r) (ep^2 + r.^2).^(-1/2) ;
    case 'TPS'
        kernel = @(e,r) ((e*r).^2).*log(e*r)  ;
end
end
