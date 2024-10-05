clc
%% load protein files
% cd ('E:\titan_hrd')
% load('titan_hrd.mat') ;
% load('Ndecoys.mat') ;
% D = cell(3,1095) ;
% E = cell(3,2) ;
% for i = 1031:1060 % number of proteins
%     cd(titan_hrd{i,1}) ;
%     load('rmsd.mat') ;
%     load('mt.mat') ;
%     load('q.mat') ;
%     load('PpdN.mat') ;
%     load('PpdD.mat') ;
%     load('PpeN.mat') ;
%     load('PpeD.mat') ;
%     D{1,i} = rmsd ;
%     D{2,i} = mt ;
%     D{3,i} = q ;
%     for r = 1:3 % number of methods
%         E{r,1}{i,1} = PpdN{1,r} ;
%         E{r,1}{i,2} = PpdD{1,r} ;
%         E{r,2}{i,1} = PpeN{1,r} ;
%         E{r,2}{i,2} = PpeD{1,r} ;
%     end
%     cd ('E:\titan_hrd')
% end
% cd ('E:\')
% num = [1680 , 1680 , 2100] ; % number of variable
% M = cell(1,3) ;
% r = 2 ;
% M{r,1} = cell(3,2) ;
% for j = 1:2
%     m = 1 ;
%     for k = 1031:1060
%         for h = 1:Ndecoys(k)
%             M{r,1}{1,j}(m,1:num(r)) = E{r,j}{k,2}{1,h}- ...
%                 E{r,j}{k,1}{1,1} ;
%             m = m + 1 ;
%         end
%         M{r,1}{1,j}(m-Ndecoys(k):m-1,num(r) + k) = - D{1,k} ;
%         M{r,1}{2,j}(m-Ndecoys(k):m-1,num(r) + k) = - D{2,k} ;
%         M{r,1}{3,j}(m-Ndecoys(k):m-1,num(r) + k) = - D{3,k} ;
%         k
%     end
%     M{r,1}{2,j}(:,1:num(r)) = M{r,1}{1,j}(:,1:num(r)) ;
%     M{r,1}{3,j}(:,1:num(r)) = M{r,1}{1,j}(:,1:num(r)) ;
% end
% cd ('E:\')
load('Matrix_A1_PPE_MT_.mat') ;
%% optimization Method 1 (unconstrained)
% optimization_A1_unc = cell(2,3);
% numE = num + 1095 ;
% x0 = ones(numE,1);
% for i = 1%:2
%     for j = 1%:3
%        % fun = @(x)Ffunction(x,E{1,i},D{1,j},Ndecoys,num);
%         options = optimoptions(@fminunc,'Display','iter','MaxFunctionEvaluations',1e+8, ...
%             'MaxIterations',1000,'Algorithm','quasi-newton');%,'UseParallel',true
%         optimization_A1_unc{1,r}{i,j} = fminunc(@(x)Ffunction(x,E{1,i},D{1,j},Ndecoys,num),x0,options);
%     end
% end
% save('optimization_A1_unc.mat','optimization_A1_unc')
%% optimization Method 2 (constrained with 2 constrains)
% optimization_A1_con = cell(2,3);
Aeq = zeros ;
num = 1680 ;
numE = num + 1095 ;
x0 = zeros(numE,1) ;   
A = [] ;
b = [] ;
Aeq(1,num+1:numE) = 1 ;
beq = 1095 ;
lb = [] ;
ub = [] ;
nonlcon = [] ;
options=optimoptions('fmincon','Display','iter', ...
    'MaxFunctionEvaluations',1e+8,'MaxIterations',1000);
optimization_A1_con{2,1} = fmincon(@(x)Ffunction(x,Matrix_A1_PPE_MT,num),...
    x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
% save('optimization_A1_con.mat','optimization_A1_con')
%% Method 3
% optimization_A1_M3 = cell(2,3);
% numE = 10*210 + (h-1) ;
% for i=1:2
%     for j=1:3
%         x0=(1).*ones(numE,1);
%         optimization_A1_M3{i,j}=fminunc(@(x)Ffunction(x,E{1,3}{i,j},0.01,10*210),x0);
%     end
% end
% save('optimization_A1_M3.mat','optimization_A1_M3')
