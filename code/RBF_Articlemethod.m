close all
clc
%% load protein files
Enum = 58 * 231 ;
k = 1 ;
h = 1 ;
cd ('C:\Users\Computer Science\Desktop\mirzabeigi\fisa')
load('fisa.mat') ;
load('Ndecoys.mat') ;
for i = 1:length(fisa)
    cd(fisa{i,1}) ;
    load('PpdN_rbf.mat') ;
    load('PpdD_rbf.mat') ;
    load('PpeN_rbf.mat') ;
    load('PpeD_rbf.mat') ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(k,1:Enum) = (PpdD{1,j}-PpdN{1,1}) ;
        E{2,1}(k,1:Enum) = (PpeD{1,j}-PpeN{1,1}) ;
        E{1,1}(k,Enum+h) = rmsd(1,j) ;
        E{1,2}(k,Enum+h) = q(1,j) ;
        E{1,3}(k,Enum+h) = mt(1,j) ;
        E{2,1}(k,Enum+h) = rmsd(1,j) ;
        E{2,2}(k,Enum+h) = q(1,j) ;
        E{2,3}(k,Enum+h) = mt(1,j) ;
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
    load('PpdN_rbf.mat') ;
    load('PpdD_rbf.mat') ;
    load('PpeN_rbf.mat') ;
    load('PpeD_rbf.mat') ;
    load('rmsd.mat') ;
    load('mt.mat') ;
    load('q.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(k,1:Enum) = (PpdD{1,j}-PpdN{1,1}) ;
        E{2,1}(k,1:Enum) = (PpeD{1,j}-PpeN{1,1}) ;
        E{1,1}(k,Enum+h) = rmsd(1,j) ;
        E{1,2}(k,Enum+h) = q(1,j) ;
        E{1,3}(k,Enum+h) = mt(1,j) ;
        E{2,1}(k,Enum+h) = rmsd(1,j) ;
        E{2,2}(k,Enum+h) = q(1,j) ;
        E{2,3}(k,Enum+h) = mt(1,j) ;
        k = k + 1 ;
    end
    h = h + 1 ;
    cd ('C:\Users\Computer Science\Desktop\mirzabeigi\ig_structal_hires')
end
% cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
% cd ('C:\Users\Computer Science\Desktop\mirzabeigi\4state_reduced')
% load('4state_reduced.mat') ;
% load('Ndecoys.mat') ;
% for i=1:length(state_reduced)
%     cd(state_reduced{i,1}) ;
%     load('PpdN_rbf.mat') ;
%     load('PpdD_rbf.mat') ;
%     load('PpeN_rbf.mat') ;
%     load('PpeD_rbf.mat') ;
%     load('rmsd.mat') ;
%     load('mt.mat') ;
%     load('q.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(k,1:Enum) = (PpdD{1,j}-PpdN{1,1}) ;
%         E{2,1}(k,1:Enum) = (PpeD{1,j}-PpeN{1,1}) ;
%         E{1,1}(k,Enum+h) = rmsd(1,j) ;
%         E{1,2}(k,Enum+h) = q(1,j) ;
%         E{1,3}(k,Enum+h) = mt(1,j) ;
%         E{2,1}(k,Enum+h) = rmsd(1,j) ;
%         E{2,2}(k,Enum+h) = q(1,j) ;
%         E{2,3}(k,Enum+h) = mt(1,j) ;
%         k = k + 1 ;
%     end
%     h = h + 1 ;
%     cd ('C:\Users\Computer Science\Desktop\mirzabeigi\4state_reduced')
% end
% cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
% cd ('C:\Users\Computer Science\Desktop\mirzabeigi\moulder')
% load('moulder.mat') ;
% load('Ndecoys.mat') ;
% for i=1:length(moulder)
%     cd(moulder{i,1}) ;
%     load('PpdN_rbf.mat') ;
%     load('PpdD_rbf.mat') ;
%     load('PpeN_rbf.mat') ;
%     load('PpeD_rbf.mat') ;
%     load('rmsd.mat') ;
%     load('mt.mat') ;
%     load('q.mat') ;
%     for j = 1 : Ndecoys(i)
%         E{1,1}(k,1:Enum) = (PpdD{1,j}-PpdN{1,1}) ;
%         E{2,1}(k,1:Enum) = (PpeD{1,j}-PpeN{1,1}) ;
%         E{1,1}(k,Enum+h) = rmsd(1,j) ;
%         E{1,2}(k,Enum+h) = q(1,j) ;
%         E{1,3}(k,Enum+h) = mt(1,j) ;
%         E{2,1}(k,Enum+h) = rmsd(1,j) ;
%         E{2,2}(k,Enum+h) = q(1,j) ;
%         E{2,3}(k,Enum+h) = mt(1,j) ;
%         k = k + 1 ;
%     end
%     h = h + 1 ;
%     cd ('C:\Users\Computer Science\Desktop\mirzabeigi\moulder')
% end
cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
E{1,2}(:,1:Enum) = E{1,1}(:,1:Enum) ;
E{1,3}(:,1:Enum) = E{1,1}(:,1:Enum) ;
E{2,2}(:,1:Enum) = E{2,1}(:,1:Enum) ;
E{2,3}(:,1:Enum) = E{2,1}(:,1:Enum) ;
%% optimization
optimization = cell(2,3);
numE = Enum + (h-1) ;
for i=1:2
    for j=1:3
        x0=(1).*ones(numE,1);
        optimization{i,j}=fminunc(@(x)Ffunction(x,E{i,j},0.5),x0);
    end
end
