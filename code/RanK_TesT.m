clc
% load('G:\elmira\optimization_A1.mat') ;
%% **********************  Article 1 
E = cell(1,1) ;
NUM = 1680 ;
cd ('H:\elmira\equation\Update Data\lattice_ssfit')
load('lattice_ssfit.mat') ;
load('Ndecoys.mat') ;
load('Nprot.mat') ;
% load('rand_Test.mat') ;
k = 0 ;
HRD = zeros ;
for i = 1:Nprot %150
    E_N = cell(1,1) ;
    E_D = cell(1,1) ;
%     cd(titan_hrd{rand_Test(i),1}) ;
    cd(lattice_ssfit{i,1});
%     load('lowestRMSD_fifty.mat') ;
    load('rmsd.mat') ;
%     load('rand_Decoys.mat') ;
    load('PpdN.mat') ;
    kk = 0 ;
    hh = 0 ;
    for j = 1:210
        E_N{1,1}(1,1+kk:8+kk) = PpdN{1, 3}{1, 1}(1,3+hh:10+hh) ;
        kk = kk + 8 ;
        hh = hh + 10 ;
    end
    E{1,1}(i,1) = E_N{1,1}*optimization(1:1680,1) ;
    load('PpdD.mat') ;
    for j = 1 : Ndecoys(i) %45
        kk = 0 ;
        hh = 0 ;
        for jj = 1 : 210
%             E_D{1,j}(1,1+kk:8+kk) = PpdD{1,3}{1, lowestRMSD_fifty(j)}(1,3+hh:10+hh) ;
            E_D{1,j}(1,1+kk:8+kk) = PpdD{1,3}{1, j}(1,3+hh:10+hh) ;
            kk = kk + 8 ;
            hh = hh + 10 ;
        end
        E{1,1}(i,j+1) = E_D{1,j}*optimization(1:1680,1) ;
    end
    cd ('H:\elmira\equation\Update Data\lattice_ssfit')
end
cd ('H:\elmira\equation\Update Data')
%% NAME protein files
%fisa
%fisa_casp3
%moulder
%ig_structal_hires
%ig_structal
%hg_structal
%titan_hrd
%lmds
%4state_reduced
%lattice_ssfit
%% RANK
% R = cell(1,1) ;
% RANK = zeros ;
% Energy_Native = E{1,1}(:,1) ;
% for k = 1:Nprot   %150 Ndecoys(i) & 45
%     R{1,1}(k,1:Ndecoys(i)) = sort(E{1,1}(k,1:Ndecoys(i)),2) ;
%     for h = 1:Ndecoys(i)
%         if R{1,1}(k,h)==Energy_Native(k,1)
%             RANK(k,1) = Energy_Native(k,1) ;
%             RANK(k,2) = h ;
%         end
%     end
% end
%% Best RMSD & Energy
cd ('H:\elmira\equation\Update Data\lattice_ssfit')
Best = zeros ;
Eee = zeros ;
    num = zeros ;
    Num = zeros ;
for i = 1 : Nprot
    cd(lattice_ssfit{i,1});
    load('rmsd.mat') ;
    [Best(i,1) , num(i)] = min(rmsd) ;
   Best(i,2) = E{1,1}(i,num(i)+1) ;
    for j = 1 : Ndecoys(i)
        Eee(i,j) = abs(E{1,1}(i,1) - E{1,1}(i,j+1));
    end
    [H , Num(i)] = min(Eee(i,1:Ndecoys(i))) ;
    Best(i,3) = rmsd(Num(i)) ;
   Best(i,4) = E{1,1}(i,Num(i)+1) ;
    cd ('H:\elmira\equation\Update Data\lattice_ssfit')
end
