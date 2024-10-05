clc
%% select random Protein & Decoys for every protein
% cd ('G:\elmira\equation\Update Data\titan_hrd')
% load('titan_hrd.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% Min_RMSD = zeros ;
% Min_MT = zeros ;
% Min_Q = zeros ;
% for i = 1:Nprot
%     cd(titan_hrd{i,1}) ;
% %     load('rand_Decoys.mat') ;
%     load('rmsd.mat') ; 
%     load('mt.mat') ; 
%     load('q.mat') ; 
%     Min_MT(i) = min(8*mt) ;
%     Min_RMSD(i) = min(rmsd) ;
%     Min_Q(i) = min(q) ;
%     cd ('G:\elmira\equation\Update Data\titan_hrd')
% end
% titan_rmsd = find(Min_RMSD < 2);
% save('titan_rmsd.mat','titan_rmsd')
% rand_Train_rmsd = randperm(length(titan_rmsd),length(titan_rmsd)-150) ;
% save('rand_Train_rmsd.mat','rand_Train_rmsd')
% rand_Test_rmsd = zeros(1,150) ;
% j = 1 ;
% for i = 1:length(titan_rmsd)
%     if find(rand_Train_rmsd == i)
%         continue
%     else
%         rand_Test_rmsd(j) = i ;
%         j = j + 1 ;
%     end
% end
% save('rand_Test_rmsd.mat','rand_Test_rmsd')
% titan_mt = find(Min_MT < 1);
% save('titan_mt.mat','titan_mt')
% rand_Train_mt = randperm(length(titan_mt),length(titan_mt)-150) ;
% save('rand_Train_mt.mat','rand_Train_mt')
% rand_Test_mt = zeros(1,150) ;
% j = 1 ;
% for i = 1:length(titan_mt)
%     if find(rand_Train_mt == i)
%         continue
%     else
%         rand_Test_mt(j) = i ;
%         j = j + 1 ;
%     end
% end
% save('rand_Test_mt.mat','rand_Test_mt')
% titan_q = find(Min_Q < 1);
% save('titan_q.mat','titan_q')
% rand_Train_q = randperm(length(titan_q),length(titan_q)-150) ;
% save('rand_Train_q.mat','rand_Train_q')
% rand_Test_q = zeros(1,150) ;
% j = 1 ;
% for i = 1:length(titan_q )
%     if find(rand_Train_q == i)
%         continue
%     else
%         rand_Test_q(j) = i ;
%         j = j + 1 ;
%     end
% end
% save('rand_Test_q.mat','rand_Test_q')
%% delete file or copy file
cd ('K:\elmira\equation\Update Data\titan_hrd')
load('titan_hrd.mat') ;
load('Nprot.mat') ;
for i = 1:Nprot
    cd(titan_hrd{i,1}) ;
    f = fullfile('D:\titan_hrd\',titan_hrd{i,1}) ;
%     copyfile('rand_Decoys.mat',f) ;
%     copyfile('lowestRMSD_fifty.mat',f) ;
    copyfile('lowestMT_fifty.mat',f) ;
%     delete('rand_Decoys1.mat') ;
%     delete('lowestRMSD_fifty_2A.mat') ;
    cd ('K:\elmira\equation\Update Data\titan_hrd')
end
%% Find 50 lowest rmsd Decoys for every protein
% cd ('K:\elmira\equation\Update Data\titan_hrd')
% load('titan_hrd.mat') ;
% load('Nprot.mat') ;
% for i = 1:Nprot
%     cd(titan_hrd{i,1}) ;
%     load('rand_Decoys.mat') ;
%     load('mt.mat') ; 
%     [Sort(:,2),Sort(:,1)] = sort(8*mt(rand_Decoys)) ;
%     lowestMT_fifty = Sort(1:50,1) ;
%     save('lowestMT_fifty.mat','lowestMT_fifty')
%     cd ('K:\elmira\equation\Update Data\titan_hrd')
% end
%% Tables
% cd ('G:\elmira\equation\Update Data\titan_hrd')
% load('titan_hrd.mat') ;
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% Min_RMSD = zeros ;
% Max_RMSD = zeros ;
% Median_RMSD = zeros ;
% Mean_RMSD = zeros ;
% for i = 1:1370
%     cd(titan_hrd{i,1}) ;
%     load('rand_Decoys.mat') ;
%     load('mt.mat') ; 
%     Min_RMSD(i) = min(8*mt) ;
%     Max_RMSD(i) = max(8*mt) ;
%     Median_RMSD(i) = median(8*mt) ;
%     Mean_RMSD(i) = mean(8*mt) ;
%     cd ('G:\elmira\equation\Update Data\titan_hrd')
% end
%% Table 1
% x = find(Min_RMSD >= 0 & Min_RMSD < 0.5);
% T1_total(1) = length(x) ;
% T1_train = zeros(5,1) ;
% T1_test = zeros(5,1) ;
% for i = 1:T1_total(1)
%     if find(rand_Train == x(i))
%         T1_train(1) = T1_train(1) + 1 ;
%     elseif find(rand_Test == x(i))
%         T1_test(1) = T1_test(1) + 1 ;
%     end
% end
% x = find(Min_RMSD >= 0.5 & Min_RMSD < 1);
% T1_total(2) = length(x) ;
% for i = 1:T1_total(2)
%     if find(rand_Train == x(i))
%         T1_train(2) = T1_train(2) + 1 ;
%     elseif find(rand_Test == x(i))
%         T1_test(2) = T1_test(2) + 1 ;
%     end
% end
% x = find(Min_RMSD >= 1 & Min_RMSD < 1.5);
% T1_total(3) = length(x) ;
% for i = 1:T1_total(3)
%     if find(rand_Train == x(i))
%         T1_train(3) = T1_train(3) + 1 ;
%     elseif find(rand_Test == x(i))
%         T1_test(3) = T1_test(3) + 1 ;
%     end
% end
% x = find(Min_RMSD >= 1.5 & Min_RMSD < 2);
% T1_total(4) = length(x) ;
% for i = 1:T1_total(4)
%     if find(rand_Train == x(i))
%         T1_train(4) = T1_train(4) + 1 ;
%     elseif find(rand_Test == x(i))
%         T1_test(4) = T1_test(4) + 1 ;
%     end
% end
% x = find(Min_RMSD >= 2);
% T1_total(5) = length(x) ;
% for i = 1:T1_total(5)
%     if find(rand_Train == x(i))
%         T1_train(5) = T1_train(5) + 1 ;
%     elseif find(rand_Test == x(i))
%         T1_test(5) = T1_test(5) + 1 ;
%     end
% end
%% Table 2
% x = find(Max_RMSD >= 0 & Max_RMSD < 4);
% T2_total(1) = length(x) ;
% T2_train = zeros(5,1) ;
% T2_test = zeros(5,1) ;
% for i = 1:T2_total(1)
%     if find(rand_Train == x(i))
%         T2_train(1) = T2_train(1) + 1 ;
%     elseif find(rand_Test == x(i))
%         T2_test(1) = T2_test(1) + 1 ;
%     end
% end
% x = find(Max_RMSD >= 4 & Max_RMSD < 5);
% T2_total(2) = length(x) ;
% for i = 1:T2_total(2)
%     if find(rand_Train == x(i))
%         T2_train(2) = T2_train(2) + 1 ;
%     elseif find(rand_Test == x(i))
%         T2_test(2) = T2_test(2) + 1 ;
%     end
% end
% x = find(Max_RMSD >= 5 & Max_RMSD < 6);
% T2_total(3) = length(x) ;
% for i = 1:T2_total(3)
%     if find(rand_Train == x(i))
%         T2_train(3) = T2_train(3) + 1 ;
%     elseif find(rand_Test == x(i))
%         T2_test(3) = T2_test(3) + 1 ;
%     end
% end
% x = find(Max_RMSD >= 6 & Max_RMSD < 7);
% T2_total(4) = length(x) ;
% for i = 1:T2_total(4)
%     if find(rand_Train == x(i))
%         T2_train(4) = T2_train(4) + 1 ;
%     elseif find(rand_Test == x(i))
%         T2_test(4) = T2_test(4) + 1 ;
%     end
% end
% x = find(Max_RMSD >= 7);
% T2_total(5) = length(x) ;
% for i = 1:T2_total(5)
%     if find(rand_Train == x(i))
%         T2_train(5) = T2_train(5) + 1 ;
%     elseif find(rand_Test == x(i))
%         T2_test(5) = T2_test(5) + 1 ;
%     end
% end
%% Table 3
% x = find(Median_RMSD > 0 & Median_RMSD <= 2);
% T3_total(1) = length(x) ;
% T3_train = zeros(5,1) ;
% T3_test = zeros(5,1) ;
% for i = 1:T3_total(1)
%     if find(rand_Train == x(i))
%         T3_train(1) = T3_train(1) + 1 ;
%     elseif find(rand_Test == x(i))
%         T3_test(1) = T3_test(1) + 1 ;
%     end
% end
% x = find(Median_RMSD > 2 & Median_RMSD <= 2.5);
% T3_total(2) = length(x) ;
% for i = 1:T3_total(2)
%     if find(rand_Train == x(i))
%         T3_train(2) = T3_train(2) + 1 ;
%     elseif find(rand_Test == x(i))
%         T3_test(2) = T3_test(2) + 1 ;
%     end
% end
% x = find(Median_RMSD > 2.5 & Median_RMSD <= 3);
% T3_total(3) = length(x) ;
% for i = 1:T3_total(3)
%     if find(rand_Train == x(i))
%         T3_train(3) = T3_train(3) + 1 ;
%     elseif find(rand_Test == x(i))
%         T3_test(3) = T3_test(3) + 1 ;
%     end
% end
% x = find(Median_RMSD > 3 & Median_RMSD <= 4);
% T3_total(4) = length(x) ;
% for i = 1:T3_total(4)
%     if find(rand_Train == x(i))
%         T3_train(4) = T3_train(4) + 1 ;
%     elseif find(rand_Test == x(i))
%         T3_test(4) = T3_test(4) + 1 ;
%     end
% end
% x = find(Median_RMSD > 4);
% T3_total(5) = length(x) ;
% for i = 1:T3_total(5)
%     if find(rand_Train == x(i))
%         T3_train(5) = T3_train(5) + 1 ;
%     elseif find(rand_Test == x(i))
%         T3_test(5) = T3_test(5) + 1 ;
%     end
% end
%% Table 4
% x = find(Mean_RMSD > 0 & Mean_RMSD <= 2);
% T4_total(1) = length(x) ;
% T4_train = zeros(5,1) ;
% T4_test = zeros(5,1) ;
% for i = 1:T4_total(1)
%     if find(rand_Train == x(i))
%         T4_train(1) = T4_train(1) + 1 ;
%     elseif find(rand_Test == x(i))
%         T4_test(1) = T4_test(1) + 1 ;
%     end
% end
% x = find(Mean_RMSD > 2 & Mean_RMSD <= 2.5);
% T4_total(2) = length(x) ;
% for i = 1:T4_total(2)
%     if find(rand_Train == x(i))
%         T4_train(2) = T4_train(2) + 1 ;
%     elseif find(rand_Test == x(i))
%         T4_test(2) = T4_test(2) + 1 ;
%     end
% end
% x = find(Mean_RMSD > 2.5 & Mean_RMSD <= 3);
% T4_total(3) = length(x) ;
% for i = 1:T4_total(3)
%     if find(rand_Train == x(i))
%         T4_train(3) = T4_train(3) + 1 ;
%     elseif find(rand_Test == x(i))
%         T4_test(3) = T4_test(3) + 1 ;
%     end
% end
% x = find(Mean_RMSD > 3 & Mean_RMSD <= 4);
% T4_total(4) = length(x) ;
% for i = 1:T4_total(4)
%     if find(rand_Train == x(i))
%         T4_train(4) = T4_train(4) + 1 ;
%     elseif find(rand_Test == x(i))
%         T4_test(4) = T4_test(4) + 1 ;
%     end
% end
% x = find(Mean_RMSD > 4);
% T4_total(5) = length(x) ;
% for i = 1:T4_total(5)
%     if find(rand_Train == x(i))
%         T4_train(5) = T4_train(5) + 1 ;
%     elseif find(rand_Test == x(i))
%         T4_test(5) = T4_test(5) + 1 ;
%     end
% end
