load('titan_hrd\titan_hrd.mat') ;
% dir(titan_hrd{900:1400,1})
% path = 'titan_hrd';
    cd('New folder')
for i = 901%:1400
    movefile(titan_hrd{i,1},'titan_hrd')
end