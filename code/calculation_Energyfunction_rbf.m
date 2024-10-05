clc
%% Matrix & cell
End = zeros(1,2) ;
aa = cell(1,1) ;
Ca_Decoy = cell(1,1) ;
Ca_Native = cell(1,1) ;
Dis_Native = cell(1,1) ;
Dis_Decoy = cell(1,1) ;
Dis = zeros(1,1) ;
s = cell(1,1) ;
Ss = cell(1,1) ;
M = cell(1,1) ;
%% RBF
str = 'GA' ;
ep = 1 ;
Xp = 2.2 : 0.5 : 8.8 ;
X = 2.2 : 0.5 : 8.8 ;
for i = 1 : length(Xp)
    Dis(i,1:length(X)) = X - Xp(i) ;
end
if strcmp(str,'TPS') 
    IM = tps(ep,Dis) ;   
else
    kernel = rbf( str) ;
    IM = kernel(ep,Dis) ; 
end
%% Read protein files
cd ('G:\elmira\equation\Update Data\titan_hrd')
load('titan_hrd.mat') ;
load('Ndecoys.mat') ;
load('Nprot.mat') ;
load('Nres.mat') ;
for i = 1%:10%Nprot
    cd(titan_hrd{i,1}) ;
    load('Decoy');
    load('Native');
    PpdN = cell(1,1) ;
    PpdD = cell(1,1) ;
    cd ('G:\elmira\equation\Update Data')
    End(i,1) = size(Native{1,1}.Model.Atom,2);
    [aa{i,1},Ca_Native{i,1}] = AminoAcid_CaAlpha(Native{1,1},End(i,1)) ;
    Dis_Native{i,1} = Distance_Matrix(Ca_Native{i,1},Ca_Native{i,1},'Ca') ;
    PpdN{1,1} = Energyfunction_RBF(Nres(i),Dis_Native{i,1},aa{i,1},Xp,str,ep) ;
    for j= 1 : 10% Ndecoys(i)
        End(i,j+1) = size(Decoy{1,j},1) ;
        Ca_Decoy{i,j} = Decoy{1,j} ;
        Dis_Decoy{i,j} = Distance_Matrix(Ca_Decoy{i,j},Ca_Decoy{i,j},'Ca') ;
        PpdD{1,j} = Energyfunction_RBF(Nres(i),Dis_Decoy{i,j},aa{i,1},Xp,str,ep) ;
    end
    cd ('G:\elmira\equation\Update Data\titan_hrd')
    cd(titan_hrd{i,1}) ;
    save('En_rbf_IMQ.mat','PpdN')
    save('Ed_rbf_IMQ.mat','PpdD')
%     cd ('G:\elmira\equation')
    cd ('G:\elmira\equation\Update Data\titan_hrd')
end
