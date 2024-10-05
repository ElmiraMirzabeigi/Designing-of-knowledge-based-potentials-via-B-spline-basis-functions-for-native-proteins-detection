close all
clc
%% load protein files
k = 1 ;
h = 1 ;
cd ('C:\Users\Computer Science\Desktop\mirzabeigi\fisa')
load('fisa.mat') ;
load('Ndecoys.mat') ;
for i = 1:length(fisa)
    cd(fisa{i,1}) ;
    load('PpdN.mat') ;
    load('PpdD.mat') ;
    load('PpeN.mat') ;
    load('PpeD.mat') ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(k,1:1848) = (PpdD{1,j}-PpdN{1,1}) ;
        E{2,1}(k,1:1848) = (PpeD{1,j}-PpeN{1,1}) ;
        E{1,1}(k,1848+h) = rmsd(1,j) ;
        E{1,2}(k,1848+h) = q(1,j) ;
        E{1,3}(k,1848+h) = mt(1,j) ;
        E{2,1}(k,1848+h) = rmsd(1,j) ;
        E{2,2}(k,1848+h) = q(1,j) ;
        E{2,3}(k,1848+h) = mt(1,j) ;
        k = k + 1 ;
    end
    h = h + 1 ;
    cd ('C:\Users\Computer Science\Desktop\mirzabeigi\fisa')
end
cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
cd ('C:\Users\Computer Science\Desktop\mirzabeigi\ig_structal_hires')
load('ig_structal_hires.mat') ;
load('Ndecoys.mat') ;
for i=1:length(ig_structal_hires)
    cd(ig_structal_hires{i,1}) ;
    load('PpdN.mat') ;
    load('PpdD.mat') ;
    load('PpeN.mat') ;
    load('PpeD.mat') ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(k,1:1848) = (PpdD{1,j}-PpdN{1,1}) ;
        E{2,1}(k,1:1848) = (PpeD{1,j}-PpeN{1,1}) ;
        E{1,1}(k,1848+h) = rmsd(1,j) ;
        E{1,2}(k,1848+h) = q(1,j) ;
        E{1,3}(k,1848+h) = mt(1,j) ;
        E{2,1}(k,1848+h) = rmsd(1,j) ;
        E{2,2}(k,1848+h) = q(1,j) ;
        E{2,3}(k,1848+h) = mt(1,j) ;
        k = k + 1 ;
    end
    h = h + 1 ;
    cd ('C:\Users\Computer Science\Desktop\mirzabeigi\ig_structal_hires')
end
cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
cd ('C:\Users\Computer Science\Desktop\mirzabeigi\4state_reduced')
load('4state_reduced.mat') ;
load('Ndecoys.mat') ;
for i=1:length(state_reduced)
    cd(state_reduced{i,1}) ;
    load('PpdN.mat') ;
    load('PpdD.mat') ;
    load('PpeN.mat') ;
    load('PpeD.mat') ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(k,1:1848) = (PpdD{1,j}-PpdN{1,1}) ;
        E{2,1}(k,1:1848) = (PpeD{1,j}-PpeN{1,1}) ;
        E{1,1}(k,1848+h) = rmsd(1,j) ;
        E{1,2}(k,1848+h) = q(1,j) ;
        E{1,3}(k,1848+h) = mt(1,j) ;
        E{2,1}(k,1848+h) = rmsd(1,j) ;
        E{2,2}(k,1848+h) = q(1,j) ;
        E{2,3}(k,1848+h) = mt(1,j) ;
        k = k + 1 ;
    end
    h = h + 1 ;
    cd ('C:\Users\Computer Science\Desktop\mirzabeigi\4state_reduced')
end
cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
cd ('C:\Users\Computer Science\Desktop\mirzabeigi\moulder')
load('moulder.mat') ;
load('Ndecoys.mat') ;
for i=1:length(moulder)
    cd(moulder{i,1}) ;
    load('PpdN.mat') ;
    load('PpdD.mat') ;
    load('PpeN.mat') ;
    load('PpeD.mat') ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(k,1:1848) = (PpdD{1,j}-PpdN{1,1}) ;
        E{2,1}(k,1:1848) = (PpeD{1,j}-PpeN{1,1}) ;
        E{1,1}(k,1848+h) = rmsd(1,j) ;
        E{1,2}(k,1848+h) = q(1,j) ;
        E{1,3}(k,1848+h) = mt(1,j) ;
        E{2,1}(k,1848+h) = rmsd(1,j) ;
        E{2,2}(k,1848+h) = q(1,j) ;
        E{2,3}(k,1848+h) = mt(1,j) ;
        k = k + 1 ;
    end
    h = h + 1 ;
    cd ('C:\Users\Computer Science\Desktop\mirzabeigi\moulder')
end
cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
E{1,2}(:,1:1848) = E{1,1}(:,1:1848) ;
E{1,3}(:,1:1848) = E{1,1}(:,1:1848) ;
E{2,2}(:,1:1848) = E{2,1}(:,1:1848) ;
E{2,3}(:,1:1848) = E{2,1}(:,1:1848) ;
%% optimization
optimization = cell(2,3);
numE = 1848 + (h-1) ;
for i=1:2
    for j=1:3
        x0=(1).*ones(numE,1);
        optimization{i,j}=fminunc(@(x)Ffunction(x,E{i,j},0.5),x0);
    end
end