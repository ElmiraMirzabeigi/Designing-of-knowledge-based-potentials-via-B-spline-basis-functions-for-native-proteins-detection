%% load database and result
% load('H:\rbfffff.mat');
%% b-spline basis
% Bs = cell(1,8) ;
% k = 0 ;
% for r = 1:8
%     t = 0+k:1.5:4.5+k ;
%     Bs{1,r} = spmak(t,1) ;
%     k = k + 1.5 ;
% end
%% Pair plot
% Dis=0.75:0.05:14.75 ;
% Bs_Dis=zeros;
% for i=1:length(Dis)
%     for t=1:length(Bs)
%         Bs_Dis(i,t)=fnval(Dis(1,i),Bs{1,t});
%     end
% end
% bspline=cell(2,3);
% n=0;
% Test_fig = cell(21) ;
% for i=1
%     for j=i:21
%         Test_fig{i,j} = figure ;
%         bspline{1,1}{i,j}=Bs_Dis*optimization{1,1}(1+n:8+n,1);
%         bspline{1,2}{i,j}=Bs_Dis*optimization{1,2}(1+n:8+n,1);
%         bspline{1,3}{i,j}=Bs_Dis*optimization{1,3}(1+n:8+n,1);
%         bspline{2,1}{i,j}=Bs_Dis*optimization{2,1}(1+n:8+n,1);
%         bspline{2,2}{i,j}=Bs_Dis*optimization{2,2}(1+n:8+n,1);
%         bspline{2,3}{i,j}=Bs_Dis*optimization{2,3}(1+n:8+n,1);
%         plot(Dis,bspline{1,1}{i,j}) ;
%         hold on ;
%         plot(Dis,bspline{1,2}{i,j}) ;
%         hold on ;
%         plot(Dis,bspline{1,3}{i,j}) ;
%         hold on ;
%         plot(Dis,bspline{2,1}{i,j},'--') ;
%         hold on ;
%         plot(Dis,bspline{2,2}{i,j},'--') ;
%         hold on ;
%         plot(Dis,bspline{2,3}{i,j},'--') ;
%         n=n+ length(Bs);
%     end
% end
IM = zeros(1476,57);
IM2 = zeros(1476,57);
IM1 = zeros(1476,57);
Dis1 = 0 :0.01:3 ;
ep1 = 0.12;
str1 = 'TPS' ;
Xp=0.75:0.25:14.75;
DisXp1 = Distance_Matrix(Dis1,Xp,1);
if strcmp(str1,'TPS')
   IM1(1:301,1:57)=tps(ep1,DisXp1);
else
   kernel=rbf(str1) ;
   IM1(1:301,1:57)=kernel(ep1,DisXp1);
end
Dis2 = 3.01:0.01:14.75 ;
ep2 = 1;
str2 = 'GA' ;
DisXp2 = Distance_Matrix(Dis2,Xp,1);
if strcmp(str2,'TPS')
   IM2(302:1476,1:57)=tps(ep2,DisXp2);
else
   kernel=rbf(str2) ;
   IM2(302:1476,1:57)=kernel(ep2,DisXp2);
end
% n=0;
% Test_fig = cell(21) ;
% for i=1
%     for j=i:21
%         Test_fig{i,j} = figure ;
%         RBF{1,1}{i,j}=IM*optimization{1,1}(1+n:29+n,1);
%         RBF{1,2}{i,j}=IM*optimization{1,2}(1+n:29+n,1);
%         plot(Dis,RBF{1,1}{i,j}) ;
%         hold on ;
%         plot(Dis,RBF{1,2}{i,j}) ;
%         n=n+ 29;
%     end
% end
