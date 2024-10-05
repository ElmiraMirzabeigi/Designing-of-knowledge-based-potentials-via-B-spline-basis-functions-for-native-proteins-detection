function[S] = S_function(Nres,Ndecoys,s)
S = zeros(Nres) ;
M = zeros(Nres) ;
for h = 1 : Ndecoys
    M = M + s{1,h} ;
end
m = sort(M(:),'descend') ;
mu = unique(m) ;
L = round(0.25 * length(mu)) ;
B = mu(find(mu,L)) ;
for i = 1:Nres
    for j = i:Nres
        for k = 1:length(B)
            if M(i,j) == B(k)
                S(i,j) = 1 ;
            end
        end
    end
end
end
