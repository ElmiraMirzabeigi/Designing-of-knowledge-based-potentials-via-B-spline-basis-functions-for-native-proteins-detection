E = cell(1,1) ;
A = cell(1,1) ;
Metric = cell(1,1) ;
cd ('D:\elmira\equation\Update Data\titan_hrd')
load('titan_hrd.mat') ;
load('Ndecoys.mat') ;
load('rand_Test.mat') ;
for i = 1:150
    cd(titan_hrd{rand_Test(i),1}) ;
    load('rand_Decoys.mat') ;
    load('lowestRMSD_fifty.mat') ;
    load('rmsd.mat') ;
    load('PpdD.mat') ;
    Metric{1,1}(i,1:500) = rmsd(1:500) ;
    for j = 1 : 500
        kk = 0 ;
        hh = 0 ;
        for jj = 1 : 210
            E_D{1,j}(1,1+kk:8+kk) = PpdD{1,3}{1, j}(1,3+hh:10+hh) ;
            kk = kk + 8 ;
            hh = hh + 10 ;
        end
        E{1,1}(i,j) = E_D{1,j}*optimization(1:1680) ;
    end
    cd ('G:\elmira\equation\Update Data\titan_hrd')
end
cd ('G:\elmira\equation\Update Data')
%%
y = zeros(1,11) ;
Mean = zeros ;
for i = 1:150
    Aa = corrcoef(Metric{1,1}(i,1:500),E{1,1}(i,:)) ;
    Mean(i,1) = Aa(1,2) ;
    if Mean(i,1)<=0
        y(1,1) = y(1,1) + 1 ;
    elseif Mean(i,1)<=0.1 && Mean(i,1)>0
        y(1,2) = y(1,2) + 1 ;
    elseif Mean(i,1)<=0.2 && Mean(i,1)>0.1
        y(1,3) = y(1,3) + 1 ;
    elseif Mean(i,1)<=0.3 && Mean(i,1)>0.2
        y(1,4) = y(1,4) + 1 ;
    elseif Mean(i,1)<=0.4 && Mean(i,1)>0.3
        y(1,5) = y(1,5) + 1 ;
    elseif Mean(i,1)<=0.5 && Mean(i,1)>0.4
        y(1,6) = y(1,6) + 1 ;
    elseif Mean(i,1)<=0.6 && Mean(i,1)>0.5
        y(1,7) = y(1,7) + 1 ;
    elseif Mean(i,1)<=0.7 && Mean(i,1)>0.6
        y(1,8) = y(1,8) + 1 ;
    elseif Mean(i,1)<=0.8 && Mean(i,1)>0.7
        y(1,9) = y(1,9) + 1 ;
    elseif Mean(i,1)<=0.9 && Mean(i,1)>0.8
        y(1,10) = y(1,10) + 1 ;
    elseif Mean(i,1)<=1 && Mean(i,1)>0.9
        y(1,11) = y(1,11) + 1 ;
    end
end

% plot(Mean{1,1}(:,1),Mean{1,1}(:,2),'r+')
% hold on
% plot(Mean{1,1}(:,1),Mean{1,1}(:,3),'kx')
% hold on
% a = (max(Mean{1,1}(:,1))- min(Mean{1,1}(:,1)))/20 ;
% b = 0 ;
% y1 = zeros(150,1) ;
% for i = 1:20
% C = Mean{1,1}(:,1)>= min(Mean{1,1}(:,1))+b & Mean{1,1}(:,1)<=...
%     min(Mean{1,1}(:,1))+a+b ;
% coef1 = polyfit(Mean{1,1}(C,1),Mean{1,1}(C,2),1) ;
% y1 = polyval(coef1,Mean{1,1}(C,1));
% plot(Mean{1,1}(C,1),y1,'r','LineWidth',2)
% % title(ax1,'Protein: 1aq3A - rank=165')
% % xlabel(ax1,'RMSD')
% % ylabel(ax1,'E_{G}')
% b = b + a ;
% end