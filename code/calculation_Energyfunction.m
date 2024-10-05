clc
%% Matrix & cell
End = zeros ;
Ndecoys= zeros ;
Nres = zeros ;
aa = cell(1,1) ;
Ca_Decoy=cell(1,1);
Ca_Native=cell(1,1);
Dis_Native=cell(1,1);
Dis_Decoy=cell(1,1);
s=cell(1,1);
Ss=cell(1,1);
M=cell(1,1);
%% b-spline basis
Bs = cell(1,8) ;
k = 0 ;
for r = 1:8
    t = 0+k:1.5:4.5+k ;
    Bs{1,r} = spmak(t,1) ;
%     fnplt(Bs{1,r})
%     hold on ;
    k = k + 1.5 ;
end
%% Read protein files
cd ('C:\Users\Computer Science\Desktop\mirzabeigi\4state_reduced')
load('4state_reduced.mat') ;
load('Ndecoys.mat') ;
Nprot = length(state_reduced) ;
for i = 1:Nprot
    cd(state_reduced{i,1}) ;
    load('name_crmsd_scores') ;
%     Ndecoys(1,i) = length(name_crmsd_scores{1,1})-1 ;
    load('Decoy');
    load('Native');
    cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
    rmsd=zeros;
    q=zeros;
    mt=zeros;
    End(i,1)=size(Native{1,1}.Model.Atom,2);
    [aa{i,1},Ca_Native{i,1}] = AminoAcid_CaAlpha(Native{1,1},End(i,1)) ;
    Nres(i,1) = length(aa{i,1}) ;
    Dis_Native{i,1} = Distance_Matrix(Ca_Native{i,1},Ca_Native{i,1},'Ca') ;
    for j= 1 :Ndecoys(i)
        End(i,j)=size(Decoy{1,j}.Model.Atom,2);
        [~,Ca_Decoy{i,j}]=AminoAcid_CaAlpha(Decoy{1,j},End(i,j));
        Dis_Decoy{i,j}=Distance_Matrix(Ca_Decoy{i,j},Ca_Decoy{i,j},'Ca');
%         rmsd(1,j)=kabRMSD(Ca_Native{i,1},Ca_Decoy{i,j});
%         q(1,j)=Qfunction(Nres(i,1),Dis_Native{i,1},Dis_Decoy{i,j});
        mt(1,j)=MTfunction(Nres(i,1),Dis_Native{i,1},Dis_Decoy{i,j});
%         s{i,j}=(Dis_Decoy{i,j}<=9 & Dis_Decoy{i,j}>=3);
    end
        cd ('C:\Users\Computer Science\Desktop\mirzabeigi\4state_reduced')
        cd(state_reduced{i,1}) ;
%         save('rmsd.mat','rmsd')
        save('mt.mat','mt')
%         save('q.mat','q')
    cd ('C:\Users\Computer Science\Desktop\mirzabeigi\4state_reduced')
end
% save('End.mat','End')
% save('Nres.mat','Nres')
% save('Ndecoys.mat','Ndecoys')
% cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
% for i= 1:Nprot
%     b=Ndecoys(i);
%     for j=1:Nres(i)
%         for k=j+1:Nres(i)
%             a=0;
%             for h=1:Ndecoys(i)
%                 if s{i,h}(j,k)==1
%                     a=a+1;
%                 end
%             end
%             M{i,1}(j,k)=a/b;
%             if M{i,1}(j,k)>0.25
%                 Ss{i,1}(j,k)=1;
%             end
%         end
%     end
%     Ss{i,1}(Nres(i),Nres(i))=0;
%     PpdN=cell(1,1);
%     PpeN=cell(1,1);
%     PpdD=cell(1,1);
%     PpeD=cell(1,1);
%     PpdN{1,1}=Energyfunction_Bspline(Nres(i),Dis_Native{i,1},Bs,aa{i,1});
%     R=Dis_Native{i,1}*Ss{i,1} ;
%     PpeN{1,1}=Energyfunction_Bspline(Nres(i),R,Bs,aa{i,1});
%     for j= 1 :Ndecoys(i)
%         PpdD{1,j}=Energyfunction_Bspline(Nres(i),Dis_Decoy{i,j},Bs,aa{i,1});
%         Rr=Dis_Decoy{i,j}*Ss{i,1} ;
%         PpeD{1,j}=Energyfunction_Bspline(Nres(i),Rr,Bs,aa{i,1});
%     end
%     cd ('C:\Users\Computer Science\Desktop\mirzabeigi\ig_structal_hires')
%     cd(ig_structal_hires{i,1}) ;
%     save('PpdN.mat','PpdN')
%     save('PpdD.mat','PpdD')
%     save('PpeN.mat','PpeN')
%     save('PpeD.mat','PpeD')
%     cd ('C:\Users\Computer Science\Desktop\mirzabeigi')
% end
