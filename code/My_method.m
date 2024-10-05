clc
%% Matrix & Vector
% num = 2900 ;
% num_Decoy = 20 ;
% % metric = zeros(num_Decoy*1220,1) ;
% A = zeros(num_Decoy*1220,num) ;
% % AA = zeros(2*num_Decoy*1220,num) ;
% %% load protein files
% cd ('H:\elmira\equation\Update Data\titan_hrd')
% load('titan_hrd.mat') ;
% load('Ndecoys.mat') ;
% load('rand_Train.mat') ;
% h = 1 ;
% k = 0 ;
% for i = 1:1220
%     E_N = cell(1,1) ;
%     E_D = cell(1,1) ;
%     cd(titan_hrd{rand_Train(i),1}) ;
%     load('lowestRMSD_fifty.mat') ;
%     load('rmsd.mat') ;
%     load('PpdN.mat') ;
%     load('PpdD.mat') ;
%     kk = 0 ;
%     hh = 0 ;
%     for j = 1:210
%         E_N{1,1}(1,1+kk:8+kk) = PpdN{1, 3}{1, 1}(1,3+hh:10+hh) ;
%         kk = kk + 8 ;
%         hh = hh + 10 ;
%     end
%     for j = 1 : num_Decoy
%         kk = 0 ;
%         hh = 0 ;
%         for jj = 1 : 210
%             E_D{1,j}(1,1+kk:8+kk) = PpdD{1,3}{1, lowestRMSD_fifty(j)}(1,3+hh:10+hh) ;
%             kk = kk + 8 ;
%             hh = hh + 10 ;
%         end
%     end
% %     metric(1+k:num_Decoy+k,1) = rmsd(lowestRMSD_fifty(1:num_Decoy)) ;
% %     k = k + num_Decoy ;
%     for j = 1: num_Decoy
%         A(h,1:1680) = E_D{1,j} - E_N{1,1} ;
%         A(h,1680+i) = -1 ; 
%         h = h + 1 ;
%     end
%    cd ('H:\elmira\equation\Update Data\titan_hrd')
% end
% cd ('H:\elmira\equation\Update Data')
%% first optimization My_Method
f(1,1681:num) = ones(1,1220) ;
epsilon = 1 ;
b = epsilon * ones(1,num_Decoy*1220) ;
lb(1,1:1680) =  -4 * ones(1,1680) ;
lb(1,1681:num) =  zeros(1,1220) ;
ub(1,1:1680) =  4 * ones(1,1680) ;
ub(1,1681:num) =  ones(1,1220) ;
optimization = linprog(f,- A,- b,[],[],lb,ub);
%% second optimization My_Method
% AA(1:size(A,1),1:size(A,2)) = - A ;
% AA(size(A,1)+1:2*size(A,1),1:1680) = A(:,1:1680) ;
% bb(1,1:num_Decoy*1220) = - b ;
% bb(1,1+num_Decoy*1220:2*num_Decoy*1220) = metric' ;
% optimization = linprog(f, AA, bb,[],[],lb,ub);
