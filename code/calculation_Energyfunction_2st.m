clc
clear
%% Matrix & cell
End = zeros ;
aa = cell(1,1) ;
Ca_Decoy=cell(1,1);
Ca_Native=cell(1,1);
Dis_Native=cell(1,1);
Dis_Decoy=cell(1,1);
B1 = cell(1,1);
count5 = cell(1,1);
count9 = cell(1,1);
non5 = cell(1,1);
non9 = cell(1,1);
s=cell(1,1);
Ss=cell(1,1);
M=cell(1,1);
%% b-spline basis
Bs = cell(1,8) ;
k = 0 ;
for r = 1:10
    t = 1+k:0.6:3.4+k ;
    Bs{1,r} = spmak(t,1) ;
    fnplt(Bs{1,r})
    hold on ;
    k = k + 0.6 ;
end
%% Read protein files
cd ('K:\elmira\Update Data\4state_reduced')
load('4state_reduced.mat') ;
load('Ndecoys.mat') ;
load('Nres.mat') ;
load('Nprot.mat') ;
for i = 1:Nprot
    cd(state_reduced{i,1}) ;
    load('name_crmsd_scores') ;
    load('Decoy');
    load('Native');
    load('MT') ;
    load('PpeN') ;
    cd ('K:\elmira\equation\Update Data')
    End(i,1)=size(Native{1,1}.Model.Atom,2);
    [aa{i,1},Ca_Native{i,1}] = AminoAcid_CaAlpha(Native{1,1},End(i,1)) ;
    Dis_Native{i,1} = Distance_Matrix(Ca_Native{i,1},Ca_Native{i,1},'Ca') ;
    [B1{i,1},count5{i,1},count9{i,1}] = Count_function(Bs,Nres(i,1),Dis_Native{i,1}) ;
    [non5{i,1},non9{i,1}] = number_of_neighbors(Nres(i,1),count5{i,1},count9{i,1}) ;
    for j= 1 :Ndecoys(i)
        End(i,j+1)=size(Decoy{1,j}.Model.Atom,2);
        [~,Ca_Decoy{i,j}]=AminoAcid_CaAlpha(Decoy{1,j},End(i,j+1));
        Dis_Decoy{i,j}=Distance_Matrix(Ca_Decoy{i,j},Ca_Decoy{i,j},'Ca');
        [B1{i,j+1},count5{i,j+1},count9{i,j+1}] = Count_function(Bs,Dis_Decoy{i,j},Nres(i,1),mt(1,i)) ;
        [non5{i,j+1},non9{i,j+1}] = number_of_neighbors(Nres(i,1),count5{i,j+1},count9{i,j+1}) ;
        s{i,j}=(Dis_Decoy{i,j}<=8 & Dis_Decoy{i,j}>0);
    end
    cd ('K:\elmira\equation\Update Data\4state_reduced')
end
cd ('K:\elmira')
for i= 1:Nprot
    b=Ndecoys(i);
    for j=1:Nres(i)
        for k=j+1:Nres(i)
            a=0;
            for h=1:Ndecoys(i)
                if s{i,h}(j,k)==1
                    a=a+1;
                end
            end
            M{i,1}(j,k)=a/b;
            if M{i,1}(j,k)>0.25
                Ss{i,1}(j,k)=1;
            end
        end
    end
    Ss{i,1}(Nres(i),Nres(i))=0;
    Epair_Native=cell(1,1);
    Es9_Native=cell(1,1);
    Es5_Native=cell(1,1);
    Epair_Decoy=cell(1,1);
    Es9_Decoy=cell(1,1);
    Es5_Decoy=cell(1,1);
    Epair_Native{1,1} = Epair_Bspline(Nres(i,1),Dis_Native{i,1},Bs,B1{i,1},Ss{i,1},aa{i,1}) ;
    Es5_Native{1,1} = Esolvent5_Bspline(Nres(i,1),non5{i,1},aa{i,1}) ;
    Es9_Native{1,1} = Esolvent9_Bspline(Nres(i,1),non9{i,1},aa{i,1}) ;
    for j= 1 :Ndecoys(i)
        Epair_Decoy{1,j} = Epair_Bspline(Nres(i,1),Dis_Decoy{i,j},Bs,B1{i,j+1},Ss{i,1},aa{i,1}) ;
        Es5_Decoy{1,j} = Esolvent5_Bspline(Nres(i,1),non5{i,j+1},aa{i,1}) ;
        Es9_Decoy{1,j} = Esolvent9_Bspline(Nres(i,1),non9{i,j+1},aa{i,1}) ;
    end
%     cd ('C:\Users\Computer Science\Desktop\mirzabeigi\hg_structal')
%     cd(hg_structal{i,1}) ;
%     save('PpdN.mat','PpdN')
%     save('PpdD.mat','PpdD')
%     save('PpeN.mat','PpeN')
%     save('PpeD.mat','PpeD')
    cd ('G:\elmira\Update Data')
end