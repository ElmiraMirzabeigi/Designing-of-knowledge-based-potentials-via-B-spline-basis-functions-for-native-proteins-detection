function trbf= tps(e,r)

trbf = zeros(size(r)) ;
nz = find(r~=0) ;
trbf(nz) =((e*r(nz)).^2).*log(e*r(nz))  ; 

end
