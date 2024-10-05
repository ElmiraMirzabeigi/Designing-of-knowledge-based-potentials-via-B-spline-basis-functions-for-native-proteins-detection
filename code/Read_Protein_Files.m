clc
%% Matrix & cell
End = zeros ;
Ndecoys= zeros ;
%% Read protein files
cd ('C:\Users\HP\Desktop\mirzabeigi1\fisa_casp3')
load('fisa_casp3.mat') ;
Nprot = length(fisa_casp3) ;
for i = 1: Nprot(1,1)
    Native = cell(1,1) ;
    Decoy = cell(1,1) ;
    cd(fisa_casp3{i,1}) ;
    load('name_crmsd_scores') ;
    for j = 1:length(name_crmsd_scores{1,1})
        if j == 1
            Native{1,1} = pdbread(name_crmsd_scores{1,1}{j,1}) ;
            End(i,1)=size(Native{i,1}.Model.Atom,2);
        else
           Decoy{1,j-1} = pdbread(name_crmsd_scores{1,1}{j,1}) ;
        end
    end
    save('Native.mat','Native')
    save('Decoy.mat','Decoy')
    Ndecoys(i)=length(name_crmsd_scores{1,1})-1;
    cd ('C:\Users\HP\Desktop\mirzabeigi1\fisa_casp3')
end
cd ('C:\Users\HP\Desktop\mirzabeigi1')
