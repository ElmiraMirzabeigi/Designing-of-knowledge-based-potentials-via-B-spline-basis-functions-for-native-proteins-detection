function[aa]=AminoAcidfunction(Data,EndAtom,Nres)
aa=zeros(Nres,1);
i=1;
for k=1:EndAtom
    D=Data.Model.Atom(k).resSeq;
    if D==i
       M=Data.Model.Atom(k).resName;
       if  M=='GLY'
           aa(i)=1;
       elseif M=='ALA'
           aa(i)=2;
       elseif M=='VAL'
           aa(i)=3;
       elseif M=='LEU'
           aa(i)=4;
       elseif M=='ILE'
           aa(i)=5;
       elseif M=='MET'
           aa(i)=6;
       elseif M=='PRO'
           aa(i)=7;
       elseif M=='HIS'
           aa(i)=8;
       elseif M=='PHE'
           aa(i)=9;
       elseif M=='TYR'
           aa(i)=10;
       elseif M=='TRP'
           aa(i)=11;
       elseif M=='CYH'
           aa(i)=12;
       elseif M=='CYS'
           aa(i)=13;
       elseif M=='SER'
           aa(i)=14;
       elseif M=='THR'
           aa(i)=15;
       elseif M=='ASN'
           aa(i)=16;
       elseif M=='GLN'
           aa(i)=17;
       elseif M=='ASP'
           aa(i)=18;
       elseif M=='GLU'
           aa(i)=19;
       elseif M=='LYS'
           aa(i)=20;
       elseif M=='ARG'
           aa(i)=21;
       elseif M=='PYL'
           aa(i)=22;
       elseif M=='SEC'
           aa(i)=23;
       end
       i=i+1;
    end
end
end