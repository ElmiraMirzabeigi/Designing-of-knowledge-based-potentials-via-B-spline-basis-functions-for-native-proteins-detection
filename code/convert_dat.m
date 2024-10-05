cd ('C:\Users\elmira\Desktop\ig_structal_hires')
% load('Nprot.mat') ;
% load('Ndecoys.mat') ;
% dlmwrite('optimization.dat',Nprot,Ndecoys) ;
Ee = reshape(ans,1,[]) ;
dlmwrite('opt1.dat',Ee,'precision',3) ;
% dlmwrite('opt2.dat',E{1,1}(i,:),'-append','precision',3) ;

% dlmwrite('opt2.dat',E{1,3},'-append','precision',3) ;