load('H:\optimizationBs50.mat') ;
RESULT1 = zeros ;
RESULT2 = zeros ;
A = cell(1,1) ;
E = cell(1,1) ;
M = 1 ;
% *************** fisa *****************
cd ('G:\elmira\Update Data\fisa')
load('fisa.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
    cd(fisa{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1848,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1848,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1848,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1848,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1848,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1848,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1848,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1848,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1848,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1848,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1848,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1848,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = R_score(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = R_score(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = R_score(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\fisa')
end
cd ('G:\elmira\Update Data')
for i = 1:3
    for j =1:6
        RESULT1(M,j) = mean(A{i,j}) ;
        RESULT2(M,j) = MAD(A{i,j}) ;
    end
    M = M + 1 ;
end
% % *********************** hires
A = cell(1,1) ;
E = cell(1,1) ;
cd ('G:\elmira\Update Data\ig_structal_hires')
load('ig_structal_hires.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
    cd(ig_structal_hires{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1848,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1848,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1848,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1848,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1848,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1848,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1848,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1848,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1848,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1848,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1848,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1848,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = R_score(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = R_score(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = R_score(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\ig_structal_hires')
end
cd ('G:\elmira\Update Data')
for i = 1:3
    for j =1:6
        RESULT1(M,j) = mean(A{i,j}) ;
        RESULT2(M,j) = MAD(A{i,j}) ;
    end
    M = M + 1 ;
end
% % *********************** lmds
A = cell(1,1) ;
E = cell(1,1) ;
cd ('G:\elmira\Update Data\lmds')
load('lmds.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
    cd(lmds{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1848,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1848,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1848,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1848,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1848,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1848,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1848,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1848,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1848,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1848,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1848,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1848,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = R_score(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = R_score(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = R_score(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\lmds')
end
cd ('D:\Matlab')
for i = 1:3
    for j =1:6
        RESULT1(M,j) = mean(A{i,j}) ;
        RESULT2(M,j) = MAD(A{i,j}) ;
    end
    M = M + 1 ;
end
% % *********************** hg_structal
A = cell(1,1) ;
E = cell(1,1) ;
cd ('G:\elmira\Update Data\hg_structal')
load('hg_structal.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
    cd(hg_structal{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1848,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1848,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1848,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1848,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1848,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1848,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1848,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1848,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1848,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1848,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1848,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1848,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = R_score(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = R_score(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = R_score(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\hg_structal')
end
cd ('G:\elmira\Update Data')
for i = 1:3
    for j =1:6
        RESULT1(M,j) = mean(A{i,j}) ;
        RESULT2(M,j) = MAD(A{i,j}) ;
    end
    M = M + 1 ;
end
% % *********************** 4state_reduced
A = cell(1,1) ;
E = cell(1,1) ;
cd ('G:\elmira\Update Data\4state_reduced')
load('4state_reduced.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
    cd(state_reduced{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1848,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1848,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1848,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1848,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1848,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1848,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1848,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1848,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1848,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1848,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1848,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1848,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = R_score(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = R_score(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = R_score(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\4state_reduced')
end
cd ('G:\elmira\Update Data')
for i = 1:3
    for j =1:6
        RESULT1(M,j) = mean(A{i,j}) ;
        RESULT2(M,j) = MAD(A{i,j}) ;
    end
    M = M + 1 ;
end
% % % *********************** moulder
A = cell(1,1) ;
E = cell(1,1) ;
cd ('G:\elmira\Update Data\moulder')
load('moulder.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
    cd(moulder{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1848,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1848,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1848,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1848,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1848,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1848,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1848,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1848,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1848,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1848,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1848,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1848,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = R_score(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = R_score(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = R_score(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\moulder')
end
cd ('G:\elmira\Update Data')
for i = 1:3
    for j =1:6
        RESULT1(M,j) = mean(A{i,j}) ;
        RESULT2(M,j) = MAD(A{i,j}) ;
    end
    M = M + 1 ;
end
% % % *********************** fisa_casp3
% % A = zeros ;
% % B = zeros ;
% % C = zeros ;
% % cd ('D:\Matlab\update data\Energy function\fisa_casp3')
% % load('fisa_casp3.mat') ;
% % load('Nprot.mat') ;
% % RESULT1(7,1) = Nprot ;
% % load('Ndecoys.mat') ;
% % RESULT1(7,2) = mean(Ndecoys) ;
% % load('Nres.mat') ;
% % RESULT1(7,3) = mean(Nres) ;
% % cd ('D:\Matlab\update data\Energy function')
% % RESULT2(7,2) = MAD(Ndecoys,mean(Ndecoys)) ;
% % RESULT2(7,3) = MAD(Nres,mean(Nres)) ;
% % cd ('D:\Matlab\update data\Energy function\fisa_casp3')
% % a = 0 ;
% % for i = 1 : Nprot
% %     cd(fisa_casp3{i,1}) ;
% %     load('rmsd.mat') ;
% %     A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
% %     load('mt.mat') ;
% %     B(1,1+a:Ndecoys(i)+a) = 2*mt(1,1:Ndecoys(i)) ;
% %     load('q.mat') ;
% %     C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
% %     cd ('D:\Matlab\update data\Energy function\fisa_casp3')
% %     a = a + Ndecoys(i) ;
% % end
% % cd ('D:\Matlab\update data\Energy function')
% % C = 1 - C ;
% % RESULT1(7,4) = mean(A) ;
% % RESULT1(7,5) = mean(B) ;
% % RESULT1(7,6) = mean(C) ;
% % RESULT2(7,4) = MAD(A,RESULT1(7,4)) ;
% % RESULT2(7,5) = MAD(B,RESULT1(7,5)) ;
% % RESULT2(7,6) = MAD(C,RESULT1(7,6)) ;
% % % *********************** lattice_ssfit
% A = zeros ;
% B = zeros ;
% C = zeros ;
% cd ('D:\Matlab\lattice_ssfit')
% load('lattice_ssfit.mat') ;
% load('Nprot.mat') ;
% RESULT1(8,1) = Nprot ;
% load('Ndecoys.mat') ;
% RESULT1(8,2) = mean(Ndecoys) ;
% load('Nres.mat') ;
% RESULT1(8,3) = mean(Nres) ;
% cd ('D:\Matlab')
% RESULT2(8,2) = MAD(Ndecoys,mean(Ndecoys)) ;
% RESULT2(8,3) = MAD(Nres,mean(Nres)) ;
% cd ('D:\Matlab\lattice_ssfit')
% a = 0 ;
% for i = 1 : Nprot
%     cd(lattice_ssfit{i,1}) ;
%     load('rmsd.mat') ;
%     A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
%     load('mt.mat') ;
%     B(1,1+a:Ndecoys(i)+a) = 2*mt(1,1:Ndecoys(i)) ;
%     load('q.mat') ;
%     C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
%     cd ('D:\Matlab\lattice_ssfit')
%     a = a + Ndecoys(i) ;
% end
% cd ('D:\Matlab')
% C = 1 - C ;
% RESULT1(8,4) = mean(A) ;
% RESULT1(8,5) = mean(B) ;
% RESULT1(8,6) = mean(C) ;
% RESULT2(8,4) = MAD(A,RESULT1(8,4)) ;
% RESULT2(8,5) = MAD(B,RESULT1(8,5)) ;
% RESULT2(8,6) = MAD(C,RESULT1(8,6)) ;
% % % *********************** ig_structal
% A = zeros ;
% B = zeros ;
% C = zeros ;
% cd ('D:\Matlab\ig_structal')
% load('ig_structal.mat') ;
% load('Nprot.mat') ;
% RESULT1(9,1) = Nprot ;
% load('Ndecoys.mat') ;
% RESULT1(9,2) = mean(Ndecoys) ;
% load('Nres.mat') ;
% RESULT1(9,3) = mean(Nres) ;
% cd ('D:\Matlab')
% RESULT2(9,2) = MAD(Ndecoys,mean(Ndecoys)) ;
% RESULT2(9,3) = MAD(Nres,mean(Nres)) ;
% cd ('D:\Matlab\ig_structal')
% a = 0 ;
% for i = 1 : Nprot
%     cd(ig_structal{i,1}) ;
%     load('rmsd.mat') ;
%     A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
%     load('mt.mat') ;
%     B(1,1+a:Ndecoys(i)+a) = 2*mt(1,1:Ndecoys(i)) ;
%     load('q.mat') ;
%     C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
%     cd ('D:\Matlab\ig_structal')
%     a = a + Ndecoys(i) ;
% end
% cd ('D:\Matlab')
% C = 1 - C ;
% RESULT1(9,4) = mean(A) ;
% RESULT1(9,5) = mean(B) ;
% RESULT1(9,6) = mean(C) ;
% RESULT2(9,4) = MAD(A,RESULT1(9,4)) ;
% RESULT2(9,5) = MAD(B,RESULT1(9,5)) ;
% RESULT2(9,6) = MAD(C,RESULT1(9,6)) ;
