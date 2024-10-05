load('G:\optimization_A1_con.mat') ;
E = cell(1,1) ;
M = 1 ;
N = zeros ;
num = 1680 ;
% *************** fisa *****************
cd ('G:\elmira\equation\Update Data\titan_hrd')
load('titan_hrd.mat') ;
load('Ndecoys.mat') ;
for i = 1 :1356
    cd(titan_hrd{i,1}) ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,2}{1,1}*optimization{1,1}(1:num,1) ;
    E{1,2}(i,1) = PpdN{1,2}{1,1}*optimization{2,1}(1:num,1) ;
    E{1,3}(i,1) = PpdN{1,2}{1,1}*optimization{3,1}(1:num,1) ;
    E{2,1}(i,1) = PpeN{1,2}{1,1}*optimization{1,2}(1:num,1) ;
    E{2,2}(i,1) = PpeN{1,2}{1,1}*optimization{2,2}(1:num,1) ;
    E{2,3}(i,1) = PpeN{1,2}{1,1}*optimization{3,2}(1:num,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,2}{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(i,j+1) = PpdD{1,2}{1,j}*optimization{2,1}(1:num,1) ;
        E{1,3}(i,j+1) = PpdD{1,2}{1,j}*optimization{3,1}(1:num,1) ;
        E{2,1}(i,j+1) = PpeD{1,2}{1,j}*optimization{1,2}(1:num,1) ;
        E{2,2}(i,j+1) = PpeD{1,2}{1,j}*optimization{2,2}(1:num,1) ;
        E{2,3}(i,j+1) = PpeD{1,2}{1,j}*optimization{3,2}(1:num,1) ;
    end
    N(M) = Ndecoys(i) + 1 ;
    M = M + 1 ;
    cd ('G:\elmira\equation\Update Data\titan_hrd')
end
% cd ('G:\elmira\Update Data')
% % *********************** hires
% cd ('G:\elmira\Update Data\ig_structal_hires')
% load('ig_structal_hires.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% for i = 1 :Nprot
%     cd(ig_structal_hires{i,1}) ;
%     load('PpdN.mat') ;
%     load('PpeN.mat') ;
%     E{1,1}(M,1) = PpdN{1,1}*optimization{1,1}(1:num,1) ;
%     E{1,2}(M,1) = PpdN{1,1}*optimization{1,2}(1:num,1) ;
%     E{1,3}(M,1) = PpdN{1,1}*optimization{1,3}(1:num,1) ;
%     E{2,1}(M,1) = PpeN{1,1}*optimization{2,1}(1:num,1) ;
%     E{2,2}(M,1) = PpeN{1,1}*optimization{2,2}(1:num,1) ;
%     E{2,3}(M,1) = PpeN{1,1}*optimization{2,3}(1:num,1) ;
%     load('PpdD.mat') ;
%     load('PpeD.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(M,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
%         E{1,2}(M,j+1) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
%         E{1,3}(M,j+1) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
%         E{2,1}(M,j+1) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
%         E{2,2}(M,j+1) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
%         E{2,3}(M,j+1) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
%     end
%     N(M) = Ndecoys(i) + 1 ;
%     M = M + 1 ;
%     cd ('G:\elmira\Update Data\ig_structal_hires')
% end
% cd ('G:\elmira\Update Data')
% % % *********************** lmds
% cd ('G:\elmira\Update Data\lmds')
% load('lmds.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% for i = 1 :Nprot
%     cd(lmds{i,1}) ;
%     load('PpdN.mat') ;
%     load('PpeN.mat') ;
%     E{1,1}(M,1) = PpdN{1,1}*optimization{1,1}(1:num,1) ;
%     E{1,2}(M,1) = PpdN{1,1}*optimization{1,2}(1:num,1) ;
%     E{1,3}(M,1) = PpdN{1,1}*optimization{1,3}(1:num,1) ;
%     E{2,1}(M,1) = PpeN{1,1}*optimization{2,1}(1:num,1) ;
%     E{2,2}(M,1) = PpeN{1,1}*optimization{2,2}(1:num,1) ;
%     E{2,3}(M,1) = PpeN{1,1}*optimization{2,3}(1:num,1) ;
%     load('PpdD.mat') ;
%     load('PpeD.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(M,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
%         E{1,2}(M,j+1) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
%         E{1,3}(M,j+1) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
%         E{2,1}(M,j+1) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
%         E{2,2}(M,j+1) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
%         E{2,3}(M,j+1) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
%     end
%     N(M) = Ndecoys(i) + 1 ;
%     M = M + 1 ;
%     cd ('G:\elmira\Update Data\lmds')
% end
% cd ('G:\elmira\Update Data')
% % % *********************** hg_structal
% cd ('G:\elmira\Update Data\hg_structal')
% load('hg_structal.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% for i = 1 :Nprot
%     cd(hg_structal{i,1}) ;
%     load('PpdN.mat') ;
%     load('PpeN.mat') ;
%     E{1,1}(M,1) = PpdN{1,1}*optimization{1,1}(1:num,1) ;
%     E{1,2}(M,1) = PpdN{1,1}*optimization{1,2}(1:num,1) ;
%     E{1,3}(M,1) = PpdN{1,1}*optimization{1,3}(1:num,1) ;
%     E{2,1}(M,1) = PpeN{1,1}*optimization{2,1}(1:num,1) ;
%     E{2,2}(M,1) = PpeN{1,1}*optimization{2,2}(1:num,1) ;
%     E{2,3}(M,1) = PpeN{1,1}*optimization{2,3}(1:num,1) ;
%     load('PpdD.mat') ;
%     load('PpeD.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(M,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
%         E{1,2}(M,j+1) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
%         E{1,3}(M,j+1) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
%         E{2,1}(M,j+1) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
%         E{2,2}(M,j+1) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
%         E{2,3}(M,j+1) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
%     end
%     N(M) = Ndecoys(i) + 1 ;
%     M = M + 1 ;
%     cd ('G:\elmira\Update Data\hg_structal')
% end
% cd ('G:\elmira\Update Data')
% % % *********************** 4state_reduced
% cd ('G:\elmira\Update Data\4state_reduced')
% load('4state_reduced.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% for i = 1 :Nprot
%     cd(state_reduced{i,1}) ;
%     load('PpdN.mat') ;
%     load('PpeN.mat') ;
%     E{1,1}(M,1) = PpdN{1,1}*optimization{1,1}(1:num,1) ;
%     E{1,2}(M,1) = PpdN{1,1}*optimization{1,2}(1:num,1) ;
%     E{1,3}(M,1) = PpdN{1,1}*optimization{1,3}(1:num,1) ;
%     E{2,1}(M,1) = PpeN{1,1}*optimization{2,1}(1:num,1) ;
%     E{2,2}(M,1) = PpeN{1,1}*optimization{2,2}(1:num,1) ;
%     E{2,3}(M,1) = PpeN{1,1}*optimization{2,3}(1:num,1) ;
%     load('PpdD.mat') ;
%     load('PpeD.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(M,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
%         E{1,2}(M,j+1) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
%         E{1,3}(M,j+1) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
%         E{2,1}(M,j+1) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
%         E{2,2}(M,j+1) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
%         E{2,3}(M,j+1) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
%     end
%     N(M) = Ndecoys(i) + 1 ;
%     M = M + 1 ;
%     cd ('G:\elmira\Update Data\4state_reduced')
% end
% cd ('G:\elmira\Update Data')
% % % *********************** moulder
% cd ('G:\elmira\Update Data\moulder')
% load('moulder.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% for i = 1 :Nprot
%     cd(moulder{i,1}) ;
%     load('PpdN.mat') ;
%     load('PpeN.mat') ;
%     E{1,1}(M,1) = PpdN{1,1}*optimization{1,1}(1:num,1) ;
%     E{1,2}(M,1) = PpdN{1,1}*optimization{1,2}(1:num,1) ;
%     E{1,3}(M,1) = PpdN{1,1}*optimization{1,3}(1:num,1) ;
%     E{2,1}(M,1) = PpeN{1,1}*optimization{2,1}(1:num,1) ;
%     E{2,2}(M,1) = PpeN{1,1}*optimization{2,2}(1:num,1) ;
%     E{2,3}(M,1) = PpeN{1,1}*optimization{2,3}(1:num,1) ;
%     load('PpdD.mat') ;
%     load('PpeD.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(M,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
%         E{1,2}(M,j+1) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
%         E{1,3}(M,j+1) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
%         E{2,1}(M,j+1) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
%         E{2,2}(M,j+1) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
%         E{2,3}(M,j+1) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
%     end
%     N(M) = Ndecoys(i) + 1 ;
%     M = M + 1 ;
%     cd ('G:\elmira\Update Data\moulder')
% end
% cd ('G:\elmira\Update Data')
% % % *********************** fisa_casp3
% cd ('G:\elmira\Update Data\fisa_casp3')
% load('fisa_casp3.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% for i = 1 :Nprot
%     cd(fisa_casp3{i,1}) ;
%     load('PpdN.mat') ;
%     load('PpeN.mat') ;
%     E{1,1}(M,1) = PpdN{1,1}*optimization{1,1}(1:num,1) ;
%     E{1,2}(M,1) = PpdN{1,1}*optimization{1,2}(1:num,1) ;
%     E{1,3}(M,1) = PpdN{1,1}*optimization{1,3}(1:num,1) ;
%     E{2,1}(M,1) = PpeN{1,1}*optimization{2,1}(1:num,1) ;
%     E{2,2}(M,1) = PpeN{1,1}*optimization{2,2}(1:num,1) ;
%     E{2,3}(M,1) = PpeN{1,1}*optimization{2,3}(1:num,1) ;
%     load('PpdD.mat') ;
%     load('PpeD.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(M,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
%         E{1,2}(M,j+1) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
%         E{1,3}(M,j+1) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
%         E{2,1}(M,j+1) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
%         E{2,2}(M,j+1) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
%         E{2,3}(M,j+1) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
%     end
%     N(M) = Ndecoys(i) + 1 ;
%     M = M + 1 ;
%     cd ('G:\elmira\Update Data\fisa_casp3')
% end
% cd ('G:\elmira\Update Data')
% % % *********************** lattice_ssfit
% cd ('G:\elmira\Update Data\lattice_ssfit')
% load('lattice_ssfit.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% for i = 1 :Nprot
%     cd(lattice_ssfit{i,1}) ;
%     load('PpdN.mat') ;
%     load('PpeN.mat') ;
%     E{1,1}(M,1) = PpdN{1,1}*optimization{1,1}(1:num,1) ;
%     E{1,2}(M,1) = PpdN{1,1}*optimization{1,2}(1:num,1) ;
%     E{1,3}(M,1) = PpdN{1,1}*optimization{1,3}(1:num,1) ;
%     E{2,1}(M,1) = PpeN{1,1}*optimization{2,1}(1:num,1) ;
%     E{2,2}(M,1) = PpeN{1,1}*optimization{2,2}(1:num,1) ;
%     E{2,3}(M,1) = PpeN{1,1}*optimization{2,3}(1:num,1) ;
%     load('PpdD.mat') ;
%     load('PpeD.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(M,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
%         E{1,2}(M,j+1) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
%         E{1,3}(M,j+1) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
%         E{2,1}(M,j+1) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
%         E{2,2}(M,j+1) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
%         E{2,3}(M,j+1) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
%     end
%     N(M) = Ndecoys(i) + 1 ;
%     M = M + 1 ;
%     cd ('G:\elmira\Update Data\lattice_ssfit')
% end
% cd ('G:\elmira\Update Data')
% % % *********************** ig_structal
% cd ('G:\elmira\Update Data\ig_structal')
% load('ig_structal.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% for i = 1 :Nprot
%     cd(ig_structal{i,1}) ;
%     load('PpdN.mat') ;
%     load('PpeN.mat') ;
%     E{1,1}(M,1) = PpdN{1,1}*optimization{1,1}(1:num,1) ;
%     E{1,2}(M,1) = PpdN{1,1}*optimization{1,2}(1:num,1) ;
%     E{1,3}(M,1) = PpdN{1,1}*optimization{1,3}(1:num,1) ;
%     E{2,1}(M,1) = PpeN{1,1}*optimization{2,1}(1:num,1) ;
%     E{2,2}(M,1) = PpeN{1,1}*optimization{2,2}(1:num,1) ;
%     E{2,3}(M,1) = PpeN{1,1}*optimization{2,3}(1:num,1) ;
%     load('PpdD.mat') ;
%     load('PpeD.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(M,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
%         E{1,2}(M,j+1) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
%         E{1,3}(M,j+1) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
%         E{2,1}(M,j+1) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
%         E{2,2}(M,j+1) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
%         E{2,3}(M,j+1) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
%     end
%     N(M) = Ndecoys(i) + 1 ;
%     M = M + 1 ;
%     cd ('G:\elmira\Update Data\ig_structal')
% end
%%
cd ('G:\elmira')
Energy_Native = cell(2,3) ;
R = cell(2,3) ;
RANK = cell(2,3) ;
for i = 1:2
    for j = 1:3
        for k = 1:(M-1)
            Energy_Native{i,j} = E{i,j}(:,1) ;
            R{i,j}(k,1:N(k)) = sort(E{i,j}(k,1:N(k)),2) ;
            for h = 1:N(k)
                if R{i,j}(k,h)==Energy_Native{i,j}(k,1)
                   RANK{i,j}(k,1) = Energy_Native{i,j}(k,1) ;
                   RANK{i,j}(k,2) = h ;
                end
            end
        end
    end
end