function [Ca]=breaking_Ca_aminoacid(Native,End)
 j=zeros(21,1);
 Ca=cell(21,1);
 for k=1:End
     M=Native.Model.Atom(k).resName;
     N=Native.Model.Atom(k).AtomName;
     if length(N)==2
         if N=='CA'
             if M=='GLY'
                 j(1)=j(1)+1;
                 Ca{1,1}(j(1),1)=Native.Model.Atom(k).X;
                 Ca{1,1}(j(1),2)=Native.Model.Atom(k).Y;
                 Ca{1,1}(j(1),3)=Native.Model.Atom(k).Z;
             elseif M=='ALA'
                 j(2)=j(2)+1;
                 Ca{2,1}(j(2),1)=Native.Model.Atom(k).X;
                 Ca{2,1}(j(2),2)=Native.Model.Atom(k).Y;
                 Ca{2,1}(j(2),3)=Native.Model.Atom(k).Z;
             elseif M=='VAL'
                 j(3)=j(3)+1;
                 Ca{3,1}(j(3),1)=Native.Model.Atom(k).X;
                 Ca{3,1}(j(3),2)=Native.Model.Atom(k).Y;
                 Ca{3,1}(j(3),3)=Native.Model.Atom(k).Z;
             elseif M=='LEU'
                 j(4)=j(4)+1;
                 Ca{4,1}(j(4),1)=Native.Model.Atom(k).X;
                 Ca{4,1}(j(4),2)=Native.Model.Atom(k).Y;
                 Ca{4,1}(j(4),3)=Native.Model.Atom(k).Z;
             elseif M=='ILE'
                 j(5)=j(5)+1;
                 Ca{5,1}(j(5),1)=Native.Model.Atom(k).X;
                 Ca{5,1}(j(5),2)=Native.Model.Atom(k).Y;
                 Ca{5,1}(j(5),3)=Native.Model.Atom(k).Z;
             elseif M=='MET'
                 j(6)=j(6)+1;
                 Ca{6,1}(j(6),1)=Native.Model.Atom(k).X;
                 Ca{6,1}(j(6),2)=Native.Model.Atom(k).Y;
                 Ca{6,1}(j(6),3)=Native.Model.Atom(k).Z;
             elseif M=='PRO'
                 j(7)=j(7)+1;
                 Ca{7,1}(j(7),1)=Native.Model.Atom(k).X;
                 Ca{7,1}(j(7),2)=Native.Model.Atom(k).Y;
                 Ca{7,1}(j(7),3)=Native.Model.Atom(k).Z;
             elseif M=='HIS'
                 j(8)=j(8)+1;
                 Ca{8,1}(j(8),1)=Native.Model.Atom(k).X;
                 Ca{8,1}(j(8),2)=Native.Model.Atom(k).Y;
                 Ca{8,1}(j(8),3)=Native.Model.Atom(k).Z;
             elseif M=='PHE'
                 j(9)=j(9)+1;
                 Ca{9,1}(j(9),1)=Native.Model.Atom(k).X;
                 Ca{9,1}(j(9),2)=Native.Model.Atom(k).Y;
                 Ca{9,1}(j(9),3)=Native.Model.Atom(k).Z;
             elseif M=='TYR'
                 j(10)=j(10)+1;
                 Ca{10,1}(j(10),1)=Native.Model.Atom(k).X;
                 Ca{10,1}(j(10),2)=Native.Model.Atom(k).Y;
                 Ca{10,1}(j(10),3)=Native.Model.Atom(k).Z;
             elseif M=='TRP'
                 j(11)=j(11)+1;
                 Ca{11,1}(j(11),1)=Native.Model.Atom(k).X;
                 Ca{11,1}(j(11),2)=Native.Model.Atom(k).Y;
                 Ca{11,1}(j(11),3)=Native.Model.Atom(k).Z;
             elseif M=='CYH'
                 j(12)=j(12)+1;
                 Ca{12,1}(j(12),1)=Native.Model.Atom(k).X;
                 Ca{12,1}(j(12),2)=Native.Model.Atom(k).Y;
                 Ca{12,1}(j(12),3)=Native.Model.Atom(k).Z;
             elseif M=='CYS'
                 j(13)=j(13)+1;
                 Ca{13,1}(j(13),1)=Native.Model.Atom(k).X;
                 Ca{13,1}(j(13),2)=Native.Model.Atom(k).Y;
                 Ca{13,1}(j(13),3)=Native.Model.Atom(k).Z;
             elseif M=='SER'
                 j(14)=j(14)+1;
                 Ca{14,1}(j(14),1)=Native.Model.Atom(k).X;
                 Ca{14,1}(j(14),2)=Native.Model.Atom(k).Y;
                 Ca{14,1}(j(14),3)=Native.Model.Atom(k).Z;
             elseif M=='THR'
                 j(15)=j(15)+1;
                 Ca{15,1}(j(15),1)=Native.Model.Atom(k).X;
                 Ca{15,1}(j(15),2)=Native.Model.Atom(k).Y;
                 Ca{15,1}(j(15),3)=Native.Model.Atom(k).Z;
             elseif M=='ASN'
                 j(16)=j(16)+1;
                 Ca{16,1}(j(16),1)=Native.Model.Atom(k).X;
                 Ca{16,1}(j(16),2)=Native.Model.Atom(k).Y;
                 Ca{16,1}(j(16),3)=Native.Model.Atom(k).Z;
             elseif M=='GLN'
                 j(17)=j(17)+1;
                 Ca{17,1}(j(17),1)=Native.Model.Atom(k).X;
                 Ca{17,1}(j(17),2)=Native.Model.Atom(k).Y;
                 Ca{17,1}(j(17),3)=Native.Model.Atom(k).Z;
             elseif M=='ASP'
                 j(18)=j(18)+1;
                 Ca{18,1}(j(18),1)=Native.Model.Atom(k).X;
                 Ca{18,1}(j(18),2)=Native.Model.Atom(k).Y;
                 Ca{18,1}(j(18),3)=Native.Model.Atom(k).Z;
             elseif M=='GLU'
                 j(19)=j(19)+1;
                 Ca{19,1}(j(19),1)=Native.Model.Atom(k).X;
                 Ca{19,1}(j(19),2)=Native.Model.Atom(k).Y;
                 Ca{19,1}(j(19),3)=Native.Model.Atom(k).Z;
             elseif M=='LYS'
                 j(20)=j(20)+1;
                 Ca{20,1}(j(20),1)=Native.Model.Atom(k).X;
                 Ca{20,1}(j(20),2)=Native.Model.Atom(k).Y;
                 Ca{20,1}(j(20),3)=Native.Model.Atom(k).Z;
             elseif M=='ARG'
                 j(21)=j(21)+1;
                 Ca{21,1}(j(21),1)=Native.Model.Atom(k).X;
                 Ca{21,1}(j(21),2)=Native.Model.Atom(k).Y;
                 Ca{21,1}(j(21),3)=Native.Model.Atom(k).Z;
             end
         end
     end
 end
end