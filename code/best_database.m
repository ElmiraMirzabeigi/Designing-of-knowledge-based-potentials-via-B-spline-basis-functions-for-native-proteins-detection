%% ******************************** 
cd ('G:\elmira\equation\Update Data\titan_hrd')
load('titan_hrd.mat') ;
load('Ndecoys.mat') ;
load('Nprot.mat') ;
E = cell(1,1) ;
for i = 1 :10%Nprot
    cd(titan_hrd{i,1}) ;
    load('PpdD.mat') ;
    load('PpeD.mat') ;
    for j = 1 : Ndecoys(i)
        E{1,1}(i,1:1680) = PpdD{1,2}{1,j} ;
        E{1,2}(i,1:1680) = PpdD{1,2}{1,j} ;
        E{1,3}(i,1:1680) = PpdD{1,2}{1,j} ;
        E{2,1}(i,1:1680) = PpeD{1,2}{1,j} ;
        E{2,2}(i,1:1680) = PpeD{1,2}{1,j} ;
        E{2,3}(i,1:1680) = PpeD{1,2}{1,j} ;
    end
    cd ('G:\elmira\equation\Update Data\titan_hrd')
end
cd ('G:\elmira\equation\Update Data')