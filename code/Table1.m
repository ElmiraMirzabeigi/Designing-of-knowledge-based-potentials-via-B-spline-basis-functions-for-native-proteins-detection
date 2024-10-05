RESULT1 = zeros(9,6) ;
RESULT2 = zeros(9,6) ;
A = zeros ;
B = zeros ;
C = zeros ;
% *************** fisa *****************
cd ('G:\elmira\Update Data\fisa')
load('fisa.mat') ;
load('Nprot.mat') ;
RESULT1(1,1) = Nprot ;
load('Ndecoys.mat') ;
RESULT1(1,2) = mean(Ndecoys) ;
load('Nres.mat') ;
RESULT1(1,3) = mean(Nres) ;
cd ('G:\elmira\Update Data')
RESULT2(1,2) = MAD(Ndecoys) ;
RESULT2(1,3) = MAD(Nres) ;
cd ('G:\elmira\Update Data\fisa')
a = 0 ;
for i = 1 : Nprot
    cd(fisa{i,1}) ;
    load('rmsd.mat') ;
    A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
    load('mt.mat') ;
    B(1,1+a:Ndecoys(i)+a) = mt(1,1:Ndecoys(i)) ;
    load('q.mat') ;
    C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
    cd ('G:\elmira\Update Data\fisa')
    a = a + Ndecoys(i) ;
end
cd ('G:\elmira\Update Data')
C = 1 - C ;
RESULT1(1,4) = mean(A) ;
RESULT1(1,5) = mean(B) ;
RESULT1(1,6) = mean(C) ;
RESULT2(1,4) = MAD(A) ;
RESULT2(1,5) = MAD(B) ;
RESULT2(1,6) = MAD(C) ;
% % *********************** hires
A = zeros ;
B = zeros ;
C = zeros ;
cd ('G:\elmira\Update Data\ig_structal_hires')
load('ig_structal_hires.mat') ;
load('Nprot.mat') ;
RESULT1(2,1) = Nprot ;
load('Ndecoys.mat') ;
RESULT1(2,2) = mean(Ndecoys) ;
load('Nres.mat') ;
RESULT1(2,3) = mean(Nres) ;
cd ('G:\elmira\Update Data')
RESULT2(2,2) = MAD(Ndecoys) ;
RESULT2(2,3) = MAD(Nres) ;
cd ('G:\elmira\Update Data\ig_structal_hires')
a = 0 ;
for i = 1 : Nprot
    cd(ig_structal_hires{i,1}) ;
    load('rmsd.mat') ;
    A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
    load('mt.mat') ;
    B(1,1+a:Ndecoys(i)+a) = mt(1,1:Ndecoys(i)) ;
    load('q.mat') ;
    C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
    cd ('G:\elmira\Update Data\ig_structal_hires')
    a = a + Ndecoys(i) ;
end
cd ('G:\elmira\Update Data')
C = 1 - C ;
RESULT1(2,4) = mean(A) ;
RESULT1(2,5) = mean(B) ;
RESULT1(2,6) = mean(C) ;
RESULT2(2,4) = MAD(A) ;
RESULT2(2,5) = MAD(B) ;
RESULT2(2,6) = MAD(C) ;
% % *********************** lmds
A = zeros ;
B = zeros ;
C = zeros ;
cd ('G:\elmira\Update Data\lmds')
load('lmds.mat') ;
load('Nprot.mat') ;
RESULT1(3,1) = Nprot ;
load('Ndecoys.mat') ;
RESULT1(3,2) = mean(Ndecoys) ;
load('Nres.mat') ;
RESULT1(3,3) = mean(Nres) ;
cd ('G:\elmira\Update Data')
RESULT2(3,2) = MAD(Ndecoys) ;
RESULT2(3,3) = MAD(Nres) ;
cd ('G:\elmira\Update Data\lmds')
a = 0 ;
for i = 1 : Nprot
    cd(lmds{i,1}) ;
    load('rmsd.mat') ;
    A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
    load('mt.mat') ;
    B(1,1+a:Ndecoys(i)+a) = mt(1,1:Ndecoys(i)) ;
    load('q.mat') ;
    C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
    cd ('G:\elmira\Update Data\lmds')
    a = a + Ndecoys(i) ;
end
cd ('G:\elmira\Update Data')
C = 1 - C ;
RESULT1(3,4) = mean(A) ;
RESULT1(3,5) = mean(B) ;
RESULT1(3,6) = mean(C) ;
RESULT2(3,4) = MAD(A) ;
RESULT2(3,5) = MAD(B) ;
RESULT2(3,6) = MAD(C) ;
% % *********************** hg_structal
A = zeros ;
B = zeros ;
C = zeros ;
cd ('G:\elmira\Update Data\hg_structal')
load('hg_structal.mat') ;
load('Nprot.mat') ;
RESULT1(4,1) = Nprot ;
load('Ndecoys.mat') ;
RESULT1(4,2) = mean(Ndecoys) ;
load('Nres.mat') ;
RESULT1(4,3) = mean(Nres) ;
cd ('G:\elmira\Update Data')
RESULT2(4,2) = MAD(Ndecoys) ;
RESULT2(4,3) = MAD(Nres) ;
cd ('G:\elmira\Update Data\hg_structal')
a = 0 ;
for i = 1 : Nprot
    cd(hg_structal{i,1}) ;
    load('rmsd.mat') ;
    A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
    load('mt.mat') ;
    B(1,1+a:Ndecoys(i)+a) = mt(1,1:Ndecoys(i)) ;
    load('q.mat') ;
    C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
    cd ('G:\elmira\Update Data\hg_structal')
    a = a + Ndecoys(i) ;
end
cd ('G:\elmira\Update Data')
C = 1 - C ;
RESULT1(4,4) = mean(A) ;
RESULT1(4,5) = mean(B) ;
RESULT1(4,6) = mean(C) ;
RESULT2(4,4) = MAD(A) ;
RESULT2(4,5) = MAD(B) ;
RESULT2(4,6) = MAD(C) ;
% % *********************** 4state_reduced
A = zeros ;
B = zeros ;
C = zeros ;
cd ('G:\elmira\Update Data\4state_reduced')
load('4state_reduced.mat') ;
load('Nprot.mat') ;
RESULT1(5,1) = Nprot ;
load('Ndecoys.mat') ;
RESULT1(5,2) = mean(Ndecoys) ;
load('Nres.mat') ;
RESULT1(5,3) = mean(Nres) ;
cd ('G:\elmira\Update Data')
RESULT2(5,2) = MAD(Ndecoys) ;
RESULT2(5,3) = MAD(Nres) ;
cd ('G:\elmira\Update Data\4state_reduced')
a = 0 ;
for i = 1 : Nprot
    cd(state_reduced{i,1}) ;
    load('rmsd.mat') ;
    A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
    load('mt.mat') ;
    B(1,1+a:Ndecoys(i)+a) = mt(1,1:Ndecoys(i)) ;
    load('q.mat') ;
    C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
    cd ('G:\elmira\Update Data\4state_reduced')
    a = a + Ndecoys(i) ;
end
cd ('G:\elmira\Update Data')
C = 1 - C ;
RESULT1(5,4) = mean(A) ;
RESULT1(5,5) = mean(B) ;
RESULT1(5,6) = mean(C) ;
RESULT2(5,4) = MAD(A) ;
RESULT2(5,5) = MAD(B) ;
RESULT2(5,6) = MAD(C) ;
% % % *********************** moulder
% A = zeros ;
% B = zeros ;
% C = zeros ;
% cd ('G:\elmira\Update Data\moulder')
% load('moulder.mat') ;
% load('Nprot.mat') ;
% RESULT1(6,1) = Nprot ;
% load('Ndecoys.mat') ;
% RESULT1(6,2) = mean(Ndecoys) ;
% load('Nres.mat') ;
% RESULT1(6,3) = mean(Nres) ;
% cd ('G:\elmira\Update Data')
% RESULT2(6,2) = MAD(Ndecoys) ;
% RESULT2(6,3) = MAD(Nres) ;
% cd ('G:\elmira\Update Data\moulder')
% a = 0 ;
% for i = 1 : Nprot
%     cd(moulder{i,1}) ;
%     load('rmsd.mat') ;
%     A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
%     load('mt.mat') ;
%     B(1,1+a:Ndecoys(i)+a) = mt(1,1:Ndecoys(i)) ;
%     load('q.mat') ;
%     C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
%     cd ('G:\elmira\Update Data\moulder')
%     a = a + Ndecoys(i) ;
% end
% cd ('G:\elmira\Update Data')
% C = 1 - C ;
% RESULT1(6,4) = mean(A) ;
% RESULT1(6,5) = mean(B) ;
% RESULT1(6,6) = mean(C) ;
% RESULT2(6,4) = MAD(A) ;
% RESULT2(6,5) = MAD(B) ;
% RESULT2(6,6) = MAD(C) ;
% % *********************** fisa_casp3
A = zeros ;
B = zeros ;
C = zeros ;
cd ('G:\elmira\Update Data\fisa_casp3')
load('fisa_casp3.mat') ;
load('Nprot.mat') ;
RESULT1(7,1) = Nprot ;
load('Ndecoys.mat') ;
RESULT1(7,2) = mean(Ndecoys) ;
load('Nres.mat') ;
RESULT1(7,3) = mean(Nres) ;
cd ('G:\elmira\Update Data')
RESULT2(7,2) = MAD(Ndecoys) ;
RESULT2(7,3) = MAD(Nres) ;
cd ('G:\elmira\Update Data\fisa_casp3')
a = 0 ;
for i = 1 : Nprot
    cd(fisa_casp3{i,1}) ;
    load('rmsd.mat') ;
    A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
    load('mt.mat') ;
    B(1,1+a:Ndecoys(i)+a) = mt(1,1:Ndecoys(i)) ;
    load('q.mat') ;
    C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
    cd ('G:\elmira\Update Data\fisa_casp3')
    a = a + Ndecoys(i) ;
end
cd ('G:\elmira\Update Data')
C = 1 - C ;
RESULT1(7,4) = mean(A) ;
RESULT1(7,5) = mean(B) ;
RESULT1(7,6) = mean(C) ;
RESULT2(7,4) = MAD(A) ;
RESULT2(7,5) = MAD(B) ;
RESULT2(7,6) = MAD(C) ;
% % *********************** lattice_ssfit
A = zeros ;
B = zeros ;
C = zeros ;
cd ('G:\elmira\Update Data\lattice_ssfit')
load('lattice_ssfit.mat') ;
load('Nprot.mat') ;
RESULT1(8,1) = Nprot ;
load('Ndecoys.mat') ;
RESULT1(8,2) = mean(Ndecoys) ;
load('Nres.mat') ;
RESULT1(8,3) = mean(Nres) ;
cd ('G:\elmira\Update Data')
RESULT2(8,2) = MAD(Ndecoys) ;
RESULT2(8,3) = MAD(Nres) ;
cd ('G:\elmira\Update Data\lattice_ssfit')
a = 0 ;
for i = 1 : Nprot
    cd(lattice_ssfit{i,1}) ;
    load('rmsd.mat') ;
    A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
    load('mt.mat') ;
    B(1,1+a:Ndecoys(i)+a) = mt(1,1:Ndecoys(i)) ;
    load('q.mat') ;
    C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
    cd ('G:\elmira\Update Data\lattice_ssfit')
    a = a + Ndecoys(i) ;
end
cd ('G:\elmira\Update Data')
C = 1 - C ;
RESULT1(8,4) = mean(A) ;
RESULT1(8,5) = mean(B) ;
RESULT1(8,6) = mean(C) ;
RESULT2(8,4) = MAD(A) ;
RESULT2(8,5) = MAD(B) ;
RESULT2(8,6) = MAD(C) ;
% % *********************** ig_structal
A = zeros ;
B = zeros ;
C = zeros ;
cd ('G:\elmira\Update Data\ig_structal')
load('ig_structal.mat') ;
load('Nprot.mat') ;
RESULT1(9,1) = Nprot ;
load('Ndecoys.mat') ;
RESULT1(9,2) = mean(Ndecoys) ;
load('Nres.mat') ;
RESULT1(9,3) = mean(Nres) ;
cd ('G:\elmira\Update Data')
RESULT2(9,2) = MAD(Ndecoys) ;
RESULT2(9,3) = MAD(Nres) ;
cd ('G:\elmira\Update Data\ig_structal')
a = 0 ;
for i = 1 : Nprot
    cd(ig_structal{i,1}) ;
    load('rmsd.mat') ;
    A(1,1+a:Ndecoys(i)+a) = rmsd(1,1:Ndecoys(i)) ;
    load('mt.mat') ;
    B(1,1+a:Ndecoys(i)+a) = mt(1,1:Ndecoys(i)) ;
    load('q.mat') ;
    C(1,1+a:Ndecoys(i)+a) = q(1,1:Ndecoys(i)) ;
    cd ('G:\elmira\Update Data\ig_structal')
    a = a + Ndecoys(i) ;
end
cd ('G:\elmira\Update Data')
C = 1 - C ;
RESULT1(9,4) = mean(A) ;
RESULT1(9,5) = mean(B) ;
RESULT1(9,6) = mean(C) ;
RESULT2(9,4) = MAD(A) ;
RESULT2(9,5) = MAD(B) ;
RESULT2(9,6) = MAD(C) ;
