load('G:\elmira\optimizationBs51.mat') ;
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
load('Nres.mat') ;
for i = 1 :Nprot
    cd(fisa{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1680,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1680,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1680,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1680,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1680,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1680,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1680,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1680,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1680,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1680,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1680,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1680,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = Correlation(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = Correlation(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = Correlation(q,E{j,k}(i,:)) ;
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
load('Nres.mat') ;
for i = 1 :Nprot
    cd(ig_structal_hires{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1680,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1680,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1680,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1680,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1680,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1680,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1680,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1680,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1680,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1680,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1680,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1680,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = Correlation(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = Correlation(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = Correlation(q,E{j,k}(i,:)) ;
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
load('Nres.mat') ;
for i = 1 :Nprot
    cd(lmds{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1680,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1680,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1680,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1680,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1680,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1680,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1680,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1680,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1680,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1680,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1680,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1680,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = Correlation(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = Correlation(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = Correlation(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\lmds')
end
cd ('G:\elmira\Update Data')
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
load('Nres.mat') ;
for i = 1 :Nprot
    cd(hg_structal{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1680,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1680,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1680,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1680,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1680,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1680,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1680,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1680,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1680,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1680,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1680,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1680,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = Correlation(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = Correlation(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = Correlation(q,E{j,k}(i,:)) ;
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
load('Nres.mat') ;
for i = 1 :Nprot
    cd(state_reduced{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1680,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1680,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1680,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1680,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1680,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1680,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1680,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1680,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1680,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1680,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1680,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1680,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = Correlation(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = Correlation(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = Correlation(q,E{j,k}(i,:)) ;
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
% % *********************** moulder
A = cell(1,1) ;
E = cell(1,1) ;
cd ('G:\elmira\Update Data\moulder')
load('moulder.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
load('Nres.mat') ;
for i = 1 :Nprot
    cd(moulder{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1680,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1680,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1680,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1680,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1680,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1680,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1680,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1680,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1680,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1680,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1680,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1680,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = Correlation(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = Correlation(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = Correlation(q,E{j,k}(i,:)) ;
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
% % *********************** fisa_casp3
A = cell(1,1) ;
E = cell(1,1) ;
cd ('G:\elmira\Update Data\fisa_casp3')
load('fisa_casp3.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
load('Nres.mat') ;
for i = 1 :Nprot
    cd(fisa_casp3{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1680,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1680,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1680,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1680,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1680,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1680,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1680,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1680,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1680,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1680,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1680,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1680,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = Correlation(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = Correlation(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = Correlation(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\fisa_casp3')
end
cd ('G:\elmira\Update Data')
for i = 1:3
    for j =1:6
        RESULT1(M,j) = mean(A{i,j}) ;
        RESULT2(M,j) = MAD(A{i,j}) ;
    end
    M = M + 1 ;
end
% % *********************** lattice_ssfit
A = cell(1,1) ;
E = cell(1,1) ;
cd ('G:\elmira\Update Data\lattice_ssfit')
load('lattice_ssfit.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
load('Nres.mat') ;
for i = 1 :Nprot
    cd(lattice_ssfit{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1680,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1680,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1680,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1680,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1680,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1680,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1680,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1680,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1680,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1680,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1680,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1680,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = Correlation(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = Correlation(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = Correlation(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\lattice_ssfit')
end
cd ('G:\elmira\Update Data')
for i = 1:3
    for j =1:6
        RESULT1(M,j) = mean(A{i,j}) ;
        RESULT2(M,j) = MAD(A{i,j}) ;
    end
    M = M + 1 ;
end
% % *********************** ig_structal
A = cell(1,1) ;
E = cell(1,1) ;
cd ('G:\elmira\Update Data\ig_structal')
load('ig_structal.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
load('Nres.mat') ;
for i = 1 :Nprot
    cd(ig_structal{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    load('PpdN.mat') ;
    load('PpeN.mat') ;
    E{1,1}(i,1) = PpdN{1,1}*optimization{1,1}(1:1680,1) ;
    E{1,2}(i,1) = PpdN{1,1}*optimization{1,2}(1:1680,1) ;
    E{1,3}(i,1) = PpdN{1,1}*optimization{1,3}(1:1680,1) ;
    E{2,1}(i,1) = PpeN{1,1}*optimization{2,1}(1:1680,1) ;
    E{2,2}(i,1) = PpeN{1,1}*optimization{2,2}(1:1680,1) ;
    E{2,3}(i,1) = PpeN{1,1}*optimization{2,3}(1:1680,1) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:1680,1) ;
        E{1,2}(i,j+1) = PpdD{1,j}*optimization{1,2}(1:1680,1) ;
        E{1,3}(i,j+1) = PpdD{1,j}*optimization{1,3}(1:1680,1) ;
        E{2,1}(i,j+1) = PpeD{1,j}*optimization{2,1}(1:1680,1) ;
        E{2,2}(i,j+1) = PpeD{1,j}*optimization{2,2}(1:1680,1) ;
        E{2,3}(i,j+1) = PpeD{1,j}*optimization{2,3}(1:1680,1) ;
    end
    cd ('G:\elmira\Update Data')
    h = 1 ;
    for j = 1:2
        for k = 1:3
            A{1,h}(i,1) = Correlation(rmsd,E{j,k}(i,:)) ;
            A{2,h}(i,1) = Correlation(mt,E{j,k}(i,:)) ;
            A{3,h}(i,1) = Correlation(q,E{j,k}(i,:)) ;
            h = h + 1 ;
        end
    end
    cd ('G:\elmira\Update Data\ig_structal')
end
cd ('G:\elmira\Update Data')
for i = 1:3
    for j =1:6
        RESULT1(M,j) = mean(A{i,j}) ;
        RESULT2(M,j) = MAD(A{i,j}) ;
    end
    M = M + 1 ;
end
