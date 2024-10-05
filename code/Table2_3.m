RESULT1 = zeros ;
RESULT2 = zeros ;
RESULT3 = zeros ;
RESULT4 = zeros ;
k = 1 ;
h = 1 ;
% % *********************** lmds
A = cell(3,3) ;
B = cell(3,3) ;
cd ('G:\elmira\Update Data\lmds')
load('lmds.mat') ;
load('Nprot.mat') ;
for i = 1 : Nprot
    cd(lmds{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    cd ('G:\elmira\Update Data')
    A{1,1}(i,1) = Correlation(rmsd,rmsd) ;
    A{1,2}(i,1) = Correlation(rmsd,mt) ;
    A{1,3}(i,1) = Correlation(rmsd,q) ;
    A{2,1}(i,1) = Correlation(mt,rmsd) ;
    A{2,2}(i,1) = Correlation(mt,mt) ;
    A{2,3}(i,1) = Correlation(mt,q) ;
    A{3,1}(i,1) = Correlation(q,rmsd) ;
    A{3,2}(i,1) = Correlation(q,mt) ;
    A{3,3}(i,1) = Correlation(q,q) ;
    B{1,1}(i,1) = R_score(rmsd,rmsd) ;
    B{1,2}(i,1) = R_score(rmsd,mt) ;
    B{1,3}(i,1) = R_score(rmsd,q) ;
    B{2,1}(i,1) = R_score(mt,rmsd) ;
    B{2,2}(i,1) = R_score(mt,mt) ;
    B{2,3}(i,1) = R_score(mt,q) ;
    B{3,1}(i,1) = R_score(q,rmsd) ;
    B{3,2}(i,1) = R_score(q,mt) ;
    B{3,3}(i,1) = R_score(q,q) ;
    cd ('G:\elmira\Update Data\lmds')
end
cd ('G:\elmira\Update Data')
for i =1:3
    for j = 1:3
        RESULT1(k,j) = mean(A{i,j}) ;
        RESULT2(k,j) = MAD(A{i,j}) ;
        RESULT3(k,j) = mean(B{i,j}) ;
        RESULT4(k,j) = MAD(B{i,j}) ;
    end
    k = k + 1 ;
end
% % *********************** hg_structal
A = cell(3,3) ;
B = cell(3,3) ;
cd ('G:\elmira\Update Data\hg_structal')
load('hg_structal.mat') ;
load('Nprot.mat') ;
for i = 1 : Nprot
    cd(hg_structal{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    cd ('G:\elmira\Update Data')
    A{1,1}(i,1) = Correlation(rmsd,rmsd) ;
    A{1,2}(i,1) = Correlation(rmsd,mt) ;
    A{1,3}(i,1) = Correlation(rmsd,q) ;
    A{2,1}(i,1) = Correlation(mt,rmsd) ;
    A{2,2}(i,1) = Correlation(mt,mt) ;
    A{2,3}(i,1) = Correlation(mt,q) ;
    A{3,1}(i,1) = Correlation(q,rmsd) ;
    A{3,2}(i,1) = Correlation(q,mt) ;
    A{3,3}(i,1) = Correlation(q,q) ;
    B{1,1}(i,1) = R_score(rmsd,rmsd) ;
    B{1,2}(i,1) = R_score(rmsd,mt) ;
    B{1,3}(i,1) = R_score(rmsd,q) ;
    B{2,1}(i,1) = R_score(mt,rmsd) ;
    B{2,2}(i,1) = R_score(mt,mt) ;
    B{2,3}(i,1) = R_score(mt,q) ;
    B{3,1}(i,1) = R_score(q,rmsd) ;
    B{3,2}(i,1) = R_score(q,mt) ;
    B{3,3}(i,1) = R_score(q,q) ;
    cd ('G:\elmira\Update Data\hg_structal')
end
cd ('G:\elmira\Update Data')
for i =1:3
    for j = 1:3
        RESULT1(k,j) = mean(A{i,j}) ;
        RESULT2(k,j) = MAD(A{i,j}) ;
        RESULT3(k,j) = mean(B{i,j}) ;
        RESULT4(k,j) = MAD(B{i,j}) ;
    end
    k = k + 1 ;
end
% % *********************** fisa_casp3
A = cell(3,3) ;
B = cell(3,3) ;
cd ('G:\elmira\Update Data\fisa_casp3')
load('fisa_casp3.mat') ;
load('Nprot.mat') ;
for i = 1 : Nprot
    cd(fisa_casp3{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    cd ('G:\elmira\Update Data')
    A{1,1}(i,1) = Correlation(rmsd,rmsd) ;
    A{1,2}(i,1) = Correlation(rmsd,mt) ;
    A{1,3}(i,1) = Correlation(rmsd,q) ;
    A{2,1}(i,1) = Correlation(mt,rmsd) ;
    A{2,2}(i,1) = Correlation(mt,mt) ;
    A{2,3}(i,1) = Correlation(mt,q) ;
    A{3,1}(i,1) = Correlation(q,rmsd) ;
    A{3,2}(i,1) = Correlation(q,mt) ;
    A{3,3}(i,1) = Correlation(q,q) ;
    B{1,1}(i,1) = R_score(rmsd,rmsd) ;
    B{1,2}(i,1) = R_score(rmsd,mt) ;
    B{1,3}(i,1) = R_score(rmsd,q) ;
    B{2,1}(i,1) = R_score(mt,rmsd) ;
    B{2,2}(i,1) = R_score(mt,mt) ;
    B{2,3}(i,1) = R_score(mt,q) ;
    B{3,1}(i,1) = R_score(q,rmsd) ;
    B{3,2}(i,1) = R_score(q,mt) ;
    B{3,3}(i,1) = R_score(q,q) ;
    cd ('G:\elmira\Update Data\fisa_casp3')
end
cd ('G:\elmira\Update Data')
for i =1:3
    for j = 1:3
        RESULT1(k,j) = mean(A{i,j}) ;
        RESULT2(k,j) = MAD(A{i,j}) ;
        RESULT3(k,j) = mean(B{i,j}) ;
        RESULT4(k,j) = MAD(B{i,j}) ;
    end
    k = k + 1 ;
end
% % *********************** lattice_ssfit
A = cell(3,3) ;
B = cell(3,3) ;
cd ('G:\elmira\Update Data\lattice_ssfit')
load('lattice_ssfit.mat') ;
load('Nprot.mat') ;
for i = 1 : Nprot
    cd(lattice_ssfit{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    cd ('G:\elmira\Update Data')
    A{1,1}(i,1) = Correlation(rmsd,rmsd) ;
    A{1,2}(i,1) = Correlation(rmsd,mt) ;
    A{1,3}(i,1) = Correlation(rmsd,q) ;
    A{2,1}(i,1) = Correlation(mt,rmsd) ;
    A{2,2}(i,1) = Correlation(mt,mt) ;
    A{2,3}(i,1) = Correlation(mt,q) ;
    A{3,1}(i,1) = Correlation(q,rmsd) ;
    A{3,2}(i,1) = Correlation(q,mt) ;
    A{3,3}(i,1) = Correlation(q,q) ;
    B{1,1}(i,1) = R_score(rmsd,rmsd) ;
    B{1,2}(i,1) = R_score(rmsd,mt) ;
    B{1,3}(i,1) = R_score(rmsd,q) ;
    B{2,1}(i,1) = R_score(mt,rmsd) ;
    B{2,2}(i,1) = R_score(mt,mt) ;
    B{2,3}(i,1) = R_score(mt,q) ;
    B{3,1}(i,1) = R_score(q,rmsd) ;
    B{3,2}(i,1) = R_score(q,mt) ;
    B{3,3}(i,1) = R_score(q,q) ;
    cd ('G:\elmira\Update Data\lattice_ssfit')
end
cd ('G:\elmira\Update Data')
for i =1:3
    for j = 1:3
        RESULT1(k,j) = mean(A{i,j}) ;
        RESULT2(k,j) = MAD(A{i,j}) ;
        RESULT3(k,j) = mean(B{i,j}) ;
        RESULT4(k,j) = MAD(B{i,j}) ;
    end
    k = k + 1 ;
end
% % *********************** ig_structal
A = cell(3,3) ;
B = cell(3,3) ;
cd ('G:\elmira\Update Data\ig_structal')
load('ig_structal.mat') ;
load('Nprot.mat') ;
for i = 1 : Nprot
    cd(ig_structal{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    cd ('G:\elmira\Update Data')
    A{1,1}(i,1) = Correlation(rmsd,rmsd) ;
    A{1,2}(i,1) = Correlation(rmsd,mt) ;
    A{1,3}(i,1) = Correlation(rmsd,q) ;
    A{2,1}(i,1) = Correlation(mt,rmsd) ;
    A{2,2}(i,1) = Correlation(mt,mt) ;
    A{2,3}(i,1) = Correlation(mt,q) ;
    A{3,1}(i,1) = Correlation(q,rmsd) ;
    A{3,2}(i,1) = Correlation(q,mt) ;
    A{3,3}(i,1) = Correlation(q,q) ;
    B{1,1}(i,1) = R_score(rmsd,rmsd) ;
    B{1,2}(i,1) = R_score(rmsd,mt) ;
    B{1,3}(i,1) = R_score(rmsd,q) ;
    B{2,1}(i,1) = R_score(mt,rmsd) ;
    B{2,2}(i,1) = R_score(mt,mt) ;
    B{2,3}(i,1) = R_score(mt,q) ;
    B{3,1}(i,1) = R_score(q,rmsd) ;
    B{3,2}(i,1) = R_score(q,mt) ;
    B{3,3}(i,1) = R_score(q,q) ;
    cd ('G:\elmira\Update Data\ig_structal')
end
cd ('G:\elmira\Update Data')
for i =1:3
    for j = 1:3
        RESULT1(k,j) = mean(A{i,j}) ;
        RESULT2(k,j) = MAD(A{i,j}) ;
        RESULT3(k,j) = mean(B{i,j}) ;
        RESULT4(k,j) = MAD(B{i,j}) ;
    end
    k = k + 1 ;
end
