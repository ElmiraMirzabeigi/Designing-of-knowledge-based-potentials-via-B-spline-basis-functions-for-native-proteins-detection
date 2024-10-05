clc
%% load database and result
load('C:\Users\HP\Desktop\mirzabeigi1\.mat') ;
Energy_function = zeros ;
Dis=0.75:0.05:14.75 ;
%% b-spline basis
Bs = cell(1,8) ;
k = 0 ;
for r = 1:8
       t = 0+k:1.5:4.5+k ;
       Bs{1,r} = spmak(t,1) ;
       k = k + 1.5 ; 
end
%% ************************** for RBF *******************************************
str = '' ;
ep = 0.5 ;
Dis_rbf = zeros ;
for i=1:length(Dis)
    Dis_rbf(i,:)=Distance_Matrix(Dis(1,i),Xp,1);
end
if strcmp(str,'TPS')
    RBF_Dis=tps(ep,Dis_rbf);
else
    kernel=rbf(str) ;
    RBF_Dis=kernel(ep,Dis_rbf);
end
rbf_result=cell(21);
n=0;
Test_RBF_fig = cell(21) ;
for i=1:21
    for j=i:21
        Test_RBF_fig{i,j} = figure ;
        rbf_result{1,1}{i,j}=RBF_Dis*optimization{1,1}(1+n:29+n,1);
        rbf_result{1,2}{i,j}=RBF_Dis*optimization{1,2}(1+n:29+n,1);
        rbf_result{1,3}{i,j}=RBF_Dis*optimization{1,3}(1+n:29+n,1);
        rbf_result{2,1}{i,j}=RBF_Dis*optimization{2,1}(1+n:29+n,1);
        rbf_result{2,2}{i,j}=RBF_Dis*optimization{2,2}(1+n:29+n,1);
        rbf_result{2,3}{i,j}=RBF_Dis*optimization{2,3}(1+n:29+n,1);
        plot(Dis,rbf_result{1,1}{i,j}) ;
        hold on ;
        plot(Dis,rbf_result{1,2}{i,j}) ;
        hold on ;
        plot(Dis,rbf_result{1,3}{i,j}) ;
        hold on ;
        plot(Dis,rbf_result{2,1}{i,j}) ;
        hold on ;
        plot(Dis,rbf_result{2,2}{i,j}) ;
        hold on ;
        plot(Dis,rbf_result{2,3}{i,j}) ;
        n=n+29;
    end
end
%% ************************** for B-Spline *******************************************
Bs_Dis=zeros;
for i=1:length(Dis)
    for t=1:8
        Bs_Dis(i,t)=fnval(Dis(1,i),Bs{1,t});
    end
end
bspline_result=cell(2,3);
Test_Bspline_fig = cell(21) ;
n = 0 ;
for i=1:21
    for j=i:21
        Test_Bspline_fig{i,j} = figure ;
        bspline_result{1,1}{i,j}=Bs_Dis*optimization{1,1}(1+n:8+n,1);
        bspline_result{1,2}{i,j}=Bs_Dis*optimization{1,2}(1+n:8+n,1);
        bspline_result{1,3}{i,j}=Bs_Dis*optimization{1,3}(1+n:8+n,1);
        bspline_result{2,1}{i,j}=Bs_Dis*optimization{2,1}(1+n:8+n,1);
        bspline_result{2,2}{i,j}=Bs_Dis*optimization{2,2}(1+n:8+n,1);
        bspline_result{2,3}{i,j}=Bs_Dis*optimization{2,3}(1+n:8+n,1);
        plot(Dis,bspline_result{1,1}{i,j}) ;
        hold on ;
        plot(Dis,bspline_result{1,2}{i,j}) ;
        hold on ;
        plot(Dis,bspline_result{1,3}{i,j}) ;
        hold on ;
        plot(Dis,bspline_result{2,1}{i,j}) ;
        hold on ;
        plot(Dis,bspline_result{2,2}{i,j}) ;
        hold on ;
        plot(Dis,bspline_result{2,3}{i,j}) ;
        n=n+8;
    end
end
