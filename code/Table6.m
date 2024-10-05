load('G:\elmira\optimizationBs51.mat') ;
result1 = zeros ;
result2 = zeros ;
num = 1680 ;
% *************** fisa *****************
min_metrics = zeros ;
Xe_rmsd_PPD = zeros ;
Xe_mt_PPD = zeros ;
Xe_q_PPD = zeros ;
Xe_rmsd_PPE = zeros ;
Xe_mt_PPE = zeros ;
Xe_q_PPE = zeros ;
min_energy = cell(2,3) ;
cd ('G:\elmira\Update Data\fisa')
load('fisa.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 : Nprot
    E = cell(1,1) ;
    cd(fisa{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    min_metrics(i,1) = min(rmsd(1:Ndecoys(i))) ;
    min_metrics(i,2) = min(mt(1:Ndecoys(i))) ;
    min_metrics(i,3) = 1 - min(q(1:Ndecoys(i))) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(1,j) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(1,j) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
        E{1,3}(1,j) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
        E{2,1}(1,j) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
        E{2,2}(1,j) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
        E{2,3}(1,j) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
    end
    for h = 1 : Ndecoys(i)
        if E{1,1}(1,h)==min(E{1,1}(1,:))
            Xe_rmsd_PPD(i) = h ;
            min_energy{1,1}(i,1) = rmsd(h) ;
        end
        if E{1,2}(1,h)==min(E{1,2}(1,:))
            Xe_mt_PPD(i) = h ;
            min_energy{1,2}(i,1) = mt(h) ;
        end
        if E{1,3}(1,h)==min(E{1,3}(1,:))
            Xe_q_PPD(i) = h ;
            min_energy{1,3}(i,1) = 1 - q(h) ;
        end
        if E{2,1}(1,h)==min(E{2,1}(1,:))
            Xe_rmsd_PPE(i) = h ;
            min_energy{2,1}(i,1) = rmsd(h) ;
        end
        if E{2,2}(1,h)==min(E{2,2}(1,:))
            Xe_mt_PPE(i) = h ;
            min_energy{2,2}(i,1) = mt(h) ;
        end
        if E{2,3}(1,h)==min(E{2,3}(1,:))
            Xe_q_PPE(i) = h ;
            min_energy{2,3}(i,1) = 1 - q(h) ;
        end
    end
    cd ('G:\elmira\Update Data\fisa')
end
cd ('G:\elmira\Update Data')
for i = 1 : 2
    for j = 1 : 3
        result1(j,1) = mean(min_metrics(:,j)) ;
        result2(j,1) = MAD(min_metrics(:,j)) ;
        result1(j,i+1) = mean(min_energy{i,j}(:,1)) ;
        result2(j,i+1) = MAD(min_energy{i,j}(:,1)) ; 
    end
end
% % *********************** hires
min_metrics = zeros ;
Xe_rmsd_PPD = zeros ;
Xe_mt_PPD = zeros ;
Xe_q_PPD = zeros ;
Xe_rmsd_PPE = zeros ;
Xe_mt_PPE = zeros ;
Xe_q_PPE = zeros ;
min_energy = cell(2,3) ;
cd ('G:\elmira\Update Data\ig_structal_hires')
load('ig_structal_hires.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
E = cell(1,1) ;
    cd(ig_structal_hires{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    min_metrics(i,1) = min(rmsd(1:Ndecoys(i))) ;
    min_metrics(i,2) = min(mt(1:Ndecoys(i))) ;
    min_metrics(i,3) = 1 - min(q(1:Ndecoys(i))) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(1,j) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(1,j) = PpdD{1,j}*optimization{1,2}(1:num,1) ;
        E{1,3}(1,j) = PpdD{1,j}*optimization{1,3}(1:num,1) ;
        E{2,1}(1,j) = PpeD{1,j}*optimization{2,1}(1:num,1) ;
        E{2,2}(1,j) = PpeD{1,j}*optimization{2,2}(1:num,1) ;
        E{2,3}(1,j) = PpeD{1,j}*optimization{2,3}(1:num,1) ;
    end
    for h = 1 : Ndecoys(i)
        if E{1,1}(1,h)==min(E{1,1}(1,:))
            Xe_rmsd_PPD(i) = h ;
            min_energy{1,1}(i,1) = rmsd(h) ;
        end
        if E{1,2}(1,h)==min(E{1,2}(1,:))
            Xe_mt_PPD(i) = h ;
            min_energy{1,2}(i,1) = mt(h) ;
        end
        if E{1,3}(1,h)==min(E{1,3}(1,:))
            Xe_q_PPD(i) = h ;
            min_energy{1,3}(i,1) = 1 - q(h) ;
        end
        if E{2,1}(1,h)==min(E{2,1}(1,:))
            Xe_rmsd_PPE(i) = h ;
            min_energy{2,1}(i,1) = rmsd(h) ;
        end
        if E{2,2}(1,h)==min(E{2,2}(1,:))
            Xe_mt_PPE(i) = h ;
            min_energy{2,2}(i,1) = mt(h) ;
        end
        if E{2,3}(1,h)==min(E{2,3}(1,:))
            Xe_q_PPE(i) = h ;
            min_energy{2,3}(i,1) = 1 - q(h) ;
        end
    end
    cd ('G:\elmira\Update Data\ig_structal_hires')
end
cd ('G:\elmira\Update Data')
a = 3 ;
for i = 1 : 2
    for j = 1 : 3
        result1(j+a,1) = mean(min_metrics(:,j)) ;
        result2(j+a,1) = MAD(min_metrics(:,j)) ;
        result1(j+a,i+1) = mean(min_energy{i,j}(:,1)) ;
        result2(j+a,i+1) = MAD(min_energy{i,j}(:,1)) ; 
    end
end
a = a + 3 ;
% % *********************** 4state_reduced
min_metrics = zeros ;
Xe_rmsd_PPD = zeros ;
Xe_mt_PPD = zeros ;
Xe_q_PPD = zeros ;
Xe_rmsd_PPE = zeros ;
Xe_mt_PPE = zeros ;
Xe_q_PPE = zeros ;
min_energy = cell(2,3) ;
cd ('G:\elmira\Update Data\4state_reduced')
load('4state_reduced.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
E = cell(1,1) ;
    cd(state_reduced{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    min_metrics(i,1) = min(rmsd(1:Ndecoys(i))) ;
    min_metrics(i,2) = min(mt(1:Ndecoys(i))) ;
    min_metrics(i,3) = 1 - min(q(1:Ndecoys(i))) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(i,j+1) = PpdD{1,1}*optimization{1,2}(1:num,1) ;
        E{1,3}(i,j+1) = PpdD{1,1}*optimization{1,3}(1:num,1) ;
        E{2,1}(i,j+1) = PpeD{1,1}*optimization{2,1}(1:num,1) ;
        E{2,2}(i,j+1) = PpeD{1,1}*optimization{2,2}(1:num,1) ;
        E{2,3}(i,j+1) = PpeD{1,1}*optimization{2,3}(1:num,1) ;
    end
    for h = 1 : Ndecoys(i)
        if E{1,1}(1,h)==min(E{1,1}(1,:))
            Xe_rmsd_PPD(i) = h ;
            min_energy{1,1}(i,1) = rmsd(h) ;
        end
        if E{1,2}(1,h)==min(E{1,2}(1,:))
            Xe_mt_PPD(i) = h ;
            min_energy{1,2}(i,1) = mt(h) ;
        end
        if E{1,3}(1,h)==min(E{1,3}(1,:))
            Xe_q_PPD(i) = h ;
            min_energy{1,3}(i,1) = 1 - q(h) ;
        end
        if E{2,1}(1,h)==min(E{2,1}(1,:))
            Xe_rmsd_PPE(i) = h ;
            min_energy{2,1}(i,1) = rmsd(h) ;
        end
        if E{2,2}(1,h)==min(E{2,2}(1,:))
            Xe_mt_PPE(i) = h ;
            min_energy{2,2}(i,1) = mt(h) ;
        end
        if E{2,3}(1,h)==min(E{2,3}(1,:))
            Xe_q_PPE(i) = h ;
            min_energy{2,3}(i,1) = 1 - q(h) ;
        end
    end
    cd ('G:\elmira\Update Data\4state_reduced')
end
cd ('G:\elmira\Update Data')
for i = 1 : 2
    for j = 1 : 3
        result1(j+a,1) = mean(min_metrics(:,j)) ;
        result2(j+a,1) = MAD(min_metrics(:,j)) ;
        result1(j+a,i+1) = mean(min_energy{i,j}(:,1)) ;
        result2(j+a,i+1) = MAD(min_energy{i,j}(:,1)) ;
    end
end
a = a + 3 ;
% % % *********************** lmds
min_metrics = zeros ;
Xe_rmsd_PPD = zeros ;
Xe_mt_PPD = zeros ;
Xe_q_PPD = zeros ;
Xe_rmsd_PPE = zeros ;
Xe_mt_PPE = zeros ;
Xe_q_PPE = zeros ;
min_energy = cell(2,3) ;
cd ('G:\elmira\Update Data\lmds')
load('lmds.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
E = cell(1,1) ;
    cd(lmds{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    min_metrics(i,1) = min(rmsd(1:Ndecoys(i))) ;
    min_metrics(i,2) = min(mt(1:Ndecoys(i))) ;
    min_metrics(i,3) = 1 - min(q(1:Ndecoys(i))) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(i,j+1) = PpdD{1,1}*optimization{1,2}(1:num,1) ;
        E{1,3}(i,j+1) = PpdD{1,1}*optimization{1,3}(1:num,1) ;
        E{2,1}(i,j+1) = PpeD{1,1}*optimization{2,1}(1:num,1) ;
        E{2,2}(i,j+1) = PpeD{1,1}*optimization{2,2}(1:num,1) ;
        E{2,3}(i,j+1) = PpeD{1,1}*optimization{2,3}(1:num,1) ;
    end
    for h = 1 : Ndecoys(i)
        if E{1,1}(1,h)==min(E{1,1}(1,:))
            Xe_rmsd_PPD(i) = h ;
            min_energy{1,1}(i,1) = rmsd(h) ;
        end
        if E{1,2}(1,h)==min(E{1,2}(1,:))
            Xe_mt_PPD(i) = h ;
            min_energy{1,2}(i,1) = mt(h) ;
        end
        if E{1,3}(1,h)==min(E{1,3}(1,:))
            Xe_q_PPD(i) = h ;
            min_energy{1,3}(i,1) = 1 - q(h) ;
        end
        if E{2,1}(1,h)==min(E{2,1}(1,:))
            Xe_rmsd_PPE(i) = h ;
            min_energy{2,1}(i,1) = rmsd(h) ;
        end
        if E{2,2}(1,h)==min(E{2,2}(1,:))
            Xe_mt_PPE(i) = h ;
            min_energy{2,2}(i,1) = mt(h) ;
        end
        if E{2,3}(1,h)==min(E{2,3}(1,:))
            Xe_q_PPE(i) = h ;
            min_energy{2,3}(i,1) = 1 - q(h) ;
        end
    end
    cd ('G:\elmira\Update Data\lmds')
end
cd ('G:\elmira\Update Data')
for i = 1 : 2
    for j = 1 : 3
        result1(j+a,1) = mean(min_metrics(:,j)) ;
        result2(j+a,1) = MAD(min_metrics(:,j)) ;
        result1(j+a,i+1) = mean(min_energy{i,j}(:,1)) ;
        result2(j+a,i+1) = MAD(min_energy{i,j}(:,1)) ; 
    end
end
a = a + 3 ;
% % *********************** hg_structal
min_metrics = zeros ;
Xe_rmsd_PPD = zeros ;
Xe_mt_PPD = zeros ;
Xe_q_PPD = zeros ;
Xe_rmsd_PPE = zeros ;
Xe_mt_PPE = zeros ;
Xe_q_PPE = zeros ;
min_energy = cell(2,3) ;
cd ('G:\elmira\Update Data\hg_structal')
load('hg_structal.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
E = cell(1,1) ;
    cd(hg_structal{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    min_metrics(i,1) = min(rmsd(1:Ndecoys(i))) ;
    min_metrics(i,2) = min(mt(1:Ndecoys(i))) ;
    min_metrics(i,3) = 1 - min(q(1:Ndecoys(i))) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(i,j+1) = PpdD{1,1}*optimization{1,2}(1:num,1) ;
        E{1,3}(i,j+1) = PpdD{1,1}*optimization{1,3}(1:num,1) ;
        E{2,1}(i,j+1) = PpeD{1,1}*optimization{2,1}(1:num,1) ;
        E{2,2}(i,j+1) = PpeD{1,1}*optimization{2,2}(1:num,1) ;
        E{2,3}(i,j+1) = PpeD{1,1}*optimization{2,3}(1:num,1) ;
    end
    for h = 1 : Ndecoys(i)
        if E{1,1}(1,h)==min(E{1,1}(1,:))
            Xe_rmsd_PPD(i) = h ;
            min_energy{1,1}(i,1) = rmsd(h) ;
        end
        if E{1,2}(1,h)==min(E{1,2}(1,:))
            Xe_mt_PPD(i) = h ;
            min_energy{1,2}(i,1) = mt(h) ;
        end
        if E{1,3}(1,h)==min(E{1,3}(1,:))
            Xe_q_PPD(i) = h ;
            min_energy{1,3}(i,1) = 1 - q(h) ;
        end
        if E{2,1}(1,h)==min(E{2,1}(1,:))
            Xe_rmsd_PPE(i) = h ;
            min_energy{2,1}(i,1) = rmsd(h) ;
        end
        if E{2,2}(1,h)==min(E{2,2}(1,:))
            Xe_mt_PPE(i) = h ;
            min_energy{2,2}(i,1) = mt(h) ;
        end
        if E{2,3}(1,h)==min(E{2,3}(1,:))
            Xe_q_PPE(i) = h ;
            min_energy{2,3}(i,1) = 1 - q(h) ;
        end
    end
    cd ('G:\elmira\Update Data\hg_structal')
end
cd ('G:\elmira\Update Data')
for i = 1 : 2
    for j = 1 : 3
        result1(j+a,1) = mean(min_metrics(:,j)) ;
        result2(j+a,1) = MAD(min_metrics(:,j)) ;
        result1(j+a,i+1) = mean(min_energy{i,j}(:,1)) ;
        result2(j+a,i+1) = MAD(min_energy{i,j}(:,1)) ; 
    end
end
a = a + 3 ;
% % *********************** moulder
min_metrics = zeros ;
Xe_rmsd_PPD = zeros ;
Xe_mt_PPD = zeros ;
Xe_q_PPD = zeros ;
Xe_rmsd_PPE = zeros ;
Xe_mt_PPE = zeros ;
Xe_q_PPE = zeros ;
min_energy = cell(2,3) ;
cd ('G:\elmira\Update Data\moulder')
load('moulder.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
E = cell(1,1) ;
    cd(moulder{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    min_metrics(i,1) = min(rmsd(1:Ndecoys(i))) ;
    min_metrics(i,2) = min(mt(1:Ndecoys(i))) ;
    min_metrics(i,3) = 1 - min(q(1:Ndecoys(i))) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(i,j+1) = PpdD{1,1}*optimization{1,2}(1:num,1) ;
        E{1,3}(i,j+1) = PpdD{1,1}*optimization{1,3}(1:num,1) ;
        E{2,1}(i,j+1) = PpeD{1,1}*optimization{2,1}(1:num,1) ;
        E{2,2}(i,j+1) = PpeD{1,1}*optimization{2,2}(1:num,1) ;
        E{2,3}(i,j+1) = PpeD{1,1}*optimization{2,3}(1:num,1) ;
    end
    for h = 1 : Ndecoys(i)
        if E{1,1}(1,h)==min(E{1,1}(1,:))
            Xe_rmsd_PPD(i) = h ;
            min_energy{1,1}(i,1) = rmsd(h) ;
        end
        if E{1,2}(1,h)==min(E{1,2}(1,:))
            Xe_mt_PPD(i) = h ;
            min_energy{1,2}(i,1) = mt(h) ;
        end
        if E{1,3}(1,h)==min(E{1,3}(1,:))
            Xe_q_PPD(i) = h ;
            min_energy{1,3}(i,1) = 1 - q(h) ;
        end
        if E{2,1}(1,h)==min(E{2,1}(1,:))
            Xe_rmsd_PPE(i) = h ;
            min_energy{2,1}(i,1) = rmsd(h) ;
        end
        if E{2,2}(1,h)==min(E{2,2}(1,:))
            Xe_mt_PPE(i) = h ;
            min_energy{2,2}(i,1) = mt(h) ;
        end
        if E{2,3}(1,h)==min(E{2,3}(1,:))
            Xe_q_PPE(i) = h ;
            min_energy{2,3}(i,1) = 1 - q(h) ;
        end
    end
    cd ('G:\elmira\Update Data\moulder')
end
cd ('G:\elmira\Update Data')
for i = 1 : 2
    for j = 1 : 3
        result1(j+a,1) = mean(min_metrics(:,j)) ;
        result2(j+a,1) = MAD(min_metrics(:,j)) ;
        result1(j+a,i+1) = mean(min_energy{i,j}(:,1)) ;
        result2(j+a,i+1) = MAD(min_energy{i,j}(:,1)) ; 
    end
end
a = a + 3 ;
% % % *********************** fisa_casp3
min_metrics = zeros ;
Xe_rmsd_PPD = zeros ;
Xe_mt_PPD = zeros ;
Xe_q_PPD = zeros ;
Xe_rmsd_PPE = zeros ;
Xe_mt_PPE = zeros ;
Xe_q_PPE = zeros ;
min_energy = cell(2,3) ;
cd ('G:\elmira\Update Data\fisa_casp3')
load('fisa_casp3.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
E = cell(1,1) ;
    cd(fisa_casp3{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    min_metrics(i,1) = min(rmsd(1:Ndecoys(i))) ;
    min_metrics(i,2) = min(mt(1:Ndecoys(i))) ;
    min_metrics(i,3) = 1 - min(q(1:Ndecoys(i))) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(i,j+1) = PpdD{1,1}*optimization{1,2}(1:num,1) ;
        E{1,3}(i,j+1) = PpdD{1,1}*optimization{1,3}(1:num,1) ;
        E{2,1}(i,j+1) = PpeD{1,1}*optimization{2,1}(1:num,1) ;
        E{2,2}(i,j+1) = PpeD{1,1}*optimization{2,2}(1:num,1) ;
        E{2,3}(i,j+1) = PpeD{1,1}*optimization{2,3}(1:num,1) ;
    end
    for h = 1 : Ndecoys(i)
        if E{1,1}(1,h)==min(E{1,1}(1,:))
            Xe_rmsd_PPD(i) = h ;
            min_energy{1,1}(i,1) = rmsd(h) ;
        end
        if E{1,2}(1,h)==min(E{1,2}(1,:))
            Xe_mt_PPD(i) = h ;
            min_energy{1,2}(i,1) = mt(h) ;
        end
        if E{1,3}(1,h)==min(E{1,3}(1,:))
            Xe_q_PPD(i) = h ;
            min_energy{1,3}(i,1) = 1 - q(h) ;
        end
        if E{2,1}(1,h)==min(E{2,1}(1,:))
            Xe_rmsd_PPE(i) = h ;
            min_energy{2,1}(i,1) = rmsd(h) ;
        end
        if E{2,2}(1,h)==min(E{2,2}(1,:))
            Xe_mt_PPE(i) = h ;
            min_energy{2,2}(i,1) = mt(h) ;
        end
        if E{2,3}(1,h)==min(E{2,3}(1,:))
            Xe_q_PPE(i) = h ;
            min_energy{2,3}(i,1) = 1 - q(h) ;
        end
    end
    cd ('G:\elmira\Update Data\fisa_casp3')
end
cd ('G:\elmira\Update Data')
for i = 1 : 2
    for j = 1 : 3
        result1(j+a,1) = mean(min_metrics(:,j)) ;
        result2(j+a,1) = MAD(min_metrics(:,j)) ;
        result1(j+a,i+1) = mean(min_energy{i,j}(:,1)) ;
        result2(j+a,i+1) = MAD(min_energy{i,j}(:,1)) ; 
    end
end
a = a + 3 ;
% % *********************** lattice_ssfit
min_metrics = zeros ;
Xe_rmsd_PPD = zeros ;
Xe_mt_PPD = zeros ;
Xe_q_PPD = zeros ;
Xe_rmsd_PPE = zeros ;
Xe_mt_PPE = zeros ;
Xe_q_PPE = zeros ;
min_energy = cell(2,3) ;
cd ('G:\elmira\Update Data\lattice_ssfit')
load('lattice_ssfit.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
E = cell(1,1) ;
    cd(lattice_ssfit{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    min_metrics(i,1) = min(rmsd(1:Ndecoys(i))) ;
    min_metrics(i,2) = min(mt(1:Ndecoys(i))) ;
    min_metrics(i,3) = 1 - min(q(1:Ndecoys(i))) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(i,j+1) = PpdD{1,1}*optimization{1,2}(1:num,1) ;
        E{1,3}(i,j+1) = PpdD{1,1}*optimization{1,3}(1:num,1) ;
        E{2,1}(i,j+1) = PpeD{1,1}*optimization{2,1}(1:num,1) ;
        E{2,2}(i,j+1) = PpeD{1,1}*optimization{2,2}(1:num,1) ;
        E{2,3}(i,j+1) = PpeD{1,1}*optimization{2,3}(1:num,1) ;
    end
    for h = 1 : Ndecoys(i)
        if E{1,1}(1,h)==min(E{1,1}(1,:))
            Xe_rmsd_PPD(i) = h ;
            min_energy{1,1}(i,1) = rmsd(h) ;
        end
        if E{1,2}(1,h)==min(E{1,2}(1,:))
            Xe_mt_PPD(i) = h ;
            min_energy{1,2}(i,1) = mt(h) ;
        end
        if E{1,3}(1,h)==min(E{1,3}(1,:))
            Xe_q_PPD(i) = h ;
            min_energy{1,3}(i,1) = 1 - q(h) ;
        end
        if E{2,1}(1,h)==min(E{2,1}(1,:))
            Xe_rmsd_PPE(i) = h ;
            min_energy{2,1}(i,1) = rmsd(h) ;
        end
        if E{2,2}(1,h)==min(E{2,2}(1,:))
            Xe_mt_PPE(i) = h ;
            min_energy{2,2}(i,1) = mt(h) ;
        end
        if E{2,3}(1,h)==min(E{2,3}(1,:))
            Xe_q_PPE(i) = h ;
            min_energy{2,3}(i,1) = 1 - q(h) ;
        end
    end
    cd ('G:\elmira\Update Data\lattice_ssfit')
end
cd ('G:\elmira\Update Data')
for i = 1 : 2
    for j = 1 : 3
        result1(j+a,1) = mean(min_metrics(:,j)) ;
        result2(j+a,1) = MAD(min_metrics(:,j)) ;
        result1(j+a,i+1) = mean(min_energy{i,j}(:,1)) ;
        result2(j+a,i+1) = MAD(min_energy{i,j}(:,1)) ; 
    end
end
a = a + 3 ;
% % *********************** ig_structal
min_metrics = zeros ;
Xe_rmsd_PPD = zeros ;
Xe_mt_PPD = zeros ;
Xe_q_PPD = zeros ;
Xe_rmsd_PPE = zeros ;
Xe_mt_PPE = zeros ;
Xe_q_PPE = zeros ;
min_energy = cell(2,3) ;
cd ('G:\elmira\Update Data\ig_structal')
load('ig_structal.mat') ;
load('Nprot.mat') ;
load('Ndecoys.mat') ;
for i = 1 :Nprot
E = cell(1,1) ;
    cd(ig_structal{i,1}) ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    min_metrics(i,1) = min(rmsd(1:Ndecoys(i))) ;
    min_metrics(i,2) = min(mt(1:Ndecoys(i))) ;
    min_metrics(i,3) = 1 - min(q(1:Ndecoys(i))) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,j+1) = PpdD{1,j}*optimization{1,1}(1:num,1) ;
        E{1,2}(i,j+1) = PpdD{1,1}*optimization{1,2}(1:num,1) ;
        E{1,3}(i,j+1) = PpdD{1,1}*optimization{1,3}(1:num,1) ;
        E{2,1}(i,j+1) = PpeD{1,1}*optimization{2,1}(1:num,1) ;
        E{2,2}(i,j+1) = PpeD{1,1}*optimization{2,2}(1:num,1) ;
        E{2,3}(i,j+1) = PpeD{1,1}*optimization{2,3}(1:num,1) ;
    end
    for h = 1 : Ndecoys(i)
        if E{1,1}(1,h)==min(E{1,1}(1,:))
            Xe_rmsd_PPD(i) = h ;
            min_energy{1,1}(i,1) = rmsd(h) ;
        end
        if E{1,2}(1,h)==min(E{1,2}(1,:))
            Xe_mt_PPD(i) = h ;
            min_energy{1,2}(i,1) = mt(h) ;
        end
        if E{1,3}(1,h)==min(E{1,3}(1,:))
            Xe_q_PPD(i) = h ;
            min_energy{1,3}(i,1) = 1 - q(h) ;
        end
        if E{2,1}(1,h)==min(E{2,1}(1,:))
            Xe_rmsd_PPE(i) = h ;
            min_energy{2,1}(i,1) = rmsd(h) ;
        end
        if E{2,2}(1,h)==min(E{2,2}(1,:))
            Xe_mt_PPE(i) = h ;
            min_energy{2,2}(i,1) = mt(h) ;
        end
        if E{2,3}(1,h)==min(E{2,3}(1,:))
            Xe_q_PPE(i) = h ;
            min_energy{2,3}(i,1) = 1 - q(h) ;
        end
    end
    cd ('G:\elmira\Update Data\ig_structal')
end
cd ('G:\elmira\Update Data')
for i = 1 : 2
    for j = 1 : 3
        result1(j+a,1) = mean(min_metrics(:,j)) ;
        result2(j+a,1) = MAD(min_metrics(:,j)) ;
        result1(j+a,i+1) = mean(min_energy{i,j}(:,1)) ;
        result2(j+a,i+1) = MAD(min_energy{i,j}(:,1)) ; 
    end
end
a = a + 3 ;
