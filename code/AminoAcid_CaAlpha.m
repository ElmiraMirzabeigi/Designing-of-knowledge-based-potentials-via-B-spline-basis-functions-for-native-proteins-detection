function[aa,Ca]=AminoAcid_CaAlpha(Data,EndAtom)
aa=zeros;
Ca=zeros;
i=1;
for k=1:EndAtom
    M=Data.Model.Atom(k).resName;
    N=Data.Model.Atom(k).AtomName;
    if length(N)==2
        if strcmp(N,'CA')
            if strcmp(M,'GLY')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=1;
                i=i+1;
            elseif strcmp(M,'ALA')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=2;
                i=i+1;
            elseif strcmp(M,'VAL')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=3;
                i=i+1;
            elseif strcmp(M,'LEU')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=4;
                i=i+1;
            elseif strcmp(M,'ILE')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=5;
                i=i+1;
            elseif strcmp(M,'MET')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=6;
                i=i+1;
            elseif strcmp(M,'PRO')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=7;
                i=i+1;
            elseif strcmp(M,'HIS')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=8;
                i=i+1;
            elseif strcmp(M,'PHE')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=9;
                i=i+1;
            elseif strcmp(M,'TYR')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=10;
                i=i+1;
            elseif strcmp(M,'TRP')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=11;
                i=i+1;
%             elseif strcmp(M,'CYH')
%                 Ca(i,1)=Data.Model.Atom(k).X;
%                 Ca(i,2)=Data.Model.Atom(k).Y;
%                 Ca(i,3)=Data.Model.Atom(k).Z;
%                 aa(i)=12;
%                 i=i+1;
            elseif strcmp(M,'CYS')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=12;
                i=i+1;
            elseif strcmp(M,'SER')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=13;
                i=i+1;
            elseif strcmp(M,'THR')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=14;
                i=i+1;
            elseif strcmp(M,'ASN')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=15;
                i=i+1;
            elseif strcmp(M,'GLN')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=16;
                i=i+1;
            elseif strcmp(M,'ASP')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=17;
                i=i+1;
            elseif strcmp(M,'GLU')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=18;
                i=i+1;
            elseif strcmp(M,'LYS')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=19;
                i=i+1;
            elseif strcmp(M,'ARG')
                Ca(i,1)=Data.Model.Atom(k).X;
                Ca(i,2)=Data.Model.Atom(k).Y;
                Ca(i,3)=Data.Model.Atom(k).Z;
                aa(i)=20;
                i=i+1;
            end
        end
    end
end