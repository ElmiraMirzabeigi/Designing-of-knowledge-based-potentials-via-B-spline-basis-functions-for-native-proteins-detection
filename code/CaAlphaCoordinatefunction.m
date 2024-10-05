function[Ca]=CaAlphaCoordinatefunction(data,EndAtom,Nres)
Ca=zeros(Nres,3);
i=1;
for k=1:EndAtom
    D=data.Model.Atom(k).resSeq;
    if D==i
        Ca(i,1)=data.Model.Atom(k+1).X;
        Ca(i,2)=data.Model.Atom(k+1).Y;
        Ca(i,3)=data.Model.Atom(k+1).Z;
        i=i+1;
    end
end

end