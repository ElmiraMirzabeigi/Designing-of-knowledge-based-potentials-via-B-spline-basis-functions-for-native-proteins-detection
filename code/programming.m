close all
clc
%% load protein files
num=24;
S=zeros(num,1);
Deta=cell(num,1);
Native=cell(num,1);
Nres=zeros(24,1);
End=zeros(24,1);
aa=cell(24,1);
Decoy=cell(num,500);
%cd C:\Users\elmira\Desktop\Matlab\Deta\fisa
cd C:\Users\HP\Desktop\mirzabeigi\fisa
load('fisa.mat');
load('fisalist.mat');
numfisa=size(fisa,1);
for i=1:numfisa
    cd(fisa{i,1});
    Deta{i,1}=load('name_crmsd_scores.mat');
    S(i)=size(Deta{i,1}.name_crmsd_scores{1,1},1);
    k=1;
    for j=1:S(i)
        if Deta{i,1}.name_crmsd_scores{1,1}{j,1}==fisalist{i,1}
          Native{i,1}=pdbread(Deta{i,1}.name_crmsd_scores{1,1}{j,1}); 
          K=j;
          break;
        end
        break;
    end
    for j=1:S(i)
        if j~=K
           Decoy{i,k}=pdbread(Deta{i,1}.name_crmsd_scores{1,1}{j,1}); 
           k=k+1;
        end
    end
%     cd C:\Users\elmira\Desktop\Matlab\Deta\fisa
    cd C:\Users\HP\Desktop\mirzabeigi\fisa
end
% cd C:\Users\elmira\Desktop\Matlab\Deta
% cd C:\Users\elmira\Desktop\Matlab\Deta\ig_str
cd C:\Users\HP\Desktop\mirzabeigi
cd C:\Users\HP\Desktop\mirzabeigi\ig_structal_hires
load('ig_structal_hires.mat');
load('ig_structal_hireslist.mat');
numig_structal_hires=size(ig_structal_hires,1);
L=1;
for i=numfisa+1:numig_structal_hires+numfisa
    cd(ig_structal_hires{L,1});
    Deta{i,1}=load('name_crmsd_scores.mat');
    S(i)=size(Deta{i,1}.name_crmsd_scores{1,1},1);
    k=1;
    for j=1:S(i)
        if Deta{i,1}.name_crmsd_scores{1,1}{j,1}==ig_structal_hireslist{L,1}
          Native{i,1}=pdbread(Deta{i,1}.name_crmsd_scores{1,1}{j,1}); 
          K(i)=j;
          break;
        end
        break;
    end
    for j=1:S(i)
        if j~=K
           Decoy{i,k}=pdbread(Deta{i,1}.name_crmsd_scores{1,1}{j,1}); 
           k=k+1;
        end
    end
%     cd C:\Users\elmira\Desktop\Matlab\Deta\ig_structal_hires
    cd C:\Users\HP\Desktop\mirzabeigi\ig_structal_hires
    L=L+1;
end
% cd C:\Users\elmira\Desktop\Matlab
% cd C:\Users\elmira\Desktop\Matlab\Programming
cd C:\Users\HP\Desktop\mirzabeigi
%% calculation PARAMETER
Bs=BsplineBasicFunction8;
NumberOfBspline=size(Bs,2);
NumberOfAminoAcid=21;
NumberPair=(((NumberOfAminoAcid.*NumberOfAminoAcid)-NumberOfAminoAcid)/2)+NumberOfAminoAcid;
Parameter=NumberPair.*NumberOfBspline;
%% Calculate Ca-Alpha in natives & Decoys structure
CaNative=cell(24,1);
DisN=cell(24,1);
CaDecoy=cell(24,500);
DisD=cell(24,500);
for i=1:24
    Nres(i,1)=Native{i,1}.Model.Atom(end).resSeq;
    End(i,1)=size(Native{i,1}.Model.Atom,2);
    aa{i,1}=AminoAcidfunction(Native{i,1},End(i),Nres(i));
    CaNative{i,1}=CaAlphaCoordinatefunction(Native{i,1},End(i),Nres(i));
    DisN{i,1}=DisStructurefunction(Nres(i),CaNative{i,1});
    for j=1:S(i)-1
        CaDecoy{i,j}=CaAlphaCoordinatefunction(Decoy{i,j},End(i),Nres(i));  
        DisD{i,j}=DisStructurefunction(Nres(i),CaDecoy{i,j});
    end
end
%% Calculate metrics
rmsd=cell(24,1);
q=cell(24,1);
mt=cell(24,1);
for i=1:24
    for j=1:S(i)-1
        rmsd{i,1}(1,j)=kabRMSD(CaNative{i,1},CaDecoy{i,j});
        q{i,1}(1,j)=Qfunction(Nres(i),DisN{i,1},DisD{i,j});
        mt{i,1}(1,j)=MTfunction(Nres(i),DisN{i,1},DisD{i,j});
    end

% CorrPPD=CorrelationFunction(rmsd(:,1),rmsd(:,2));
% CorrPPE=CorrelationFunction(rmsd(:,1),rmsd(:,3));
%         %% R-score & Z-score & Correlation
%         TestSet={'RMSD';'MT';'Q'};
%         RMSD=[Rscore(rmsd{i,1}(1,:),rmsd{i,1}(1,:));Rscore(rmsd{i,1}(1,:),mt{i,1}(1,:));Rscore(rmsd{i,1}(1,:),q{i,1}(1,:))];
%         MT=[Rscore(mt{i,1}(1,:),rmsd{i,1}(1,:));Rscore(mt{i,1}(1,:),mt{i,1}(1,:));Rscore(mt{i,1}(1,:),q{i,1}(1,:))];
%         Q=[Rscore(q{i,1}(1,:),rmsd{i,1}(1,:));Rscore(q{i,1}(1,:),mt{i,1}(1,:));Rscore(q{i,1}(1,:),q{i,1}(1,:))];
%         T1=table(RMSD,MT,Q,'RowNames',TestSet);
%         RMSD=[CorrelationFunction(rmsd{i,1}(1,:),rmsd{i,1}(1,:));CorrelationFunction(rmsd{i,1}(1,:),mt{i,1}(1,:));CorrelationFunction(rmsd{i,1}(1,:),q{i,1}(1,:))];
%         MT=[CorrelationFunction(mt{i,1}(1,:),rmsd{i,1}(1,:));CorrelationFunction(mt{i,1}(1,:),mt{i,1}(1,:));CorrelationFunction(mt{i,1}(1,:),q{i,1}(1,:))];
%         Q=[CorrelationFunction(q{i,1}(1,:),rmsd{i,1}(1,:));CorrelationFunction(q{i,1}(1,:),mt{i,1}(1,:));CorrelationFunction(q{i,1}(1,:),q{i,1}(1,:))];
%         T2=table(RMSD,MT,Q,'RowNames',TestSet);
end
%% Matrix S for PPE
s=cell(24,500);
Ss=cell(24,1);
M=cell(24,1);
for i=1:24
    for j=1:S(i)-1
        s{i,j}=(DisD{i,j}<=6 & DisD{i,j}>0);
    end
end
for i=1:24
    b=S(i)-1;
    for j=1:Nres(i)
        for k=j+1:Nres(i)
            a=0;
            for h=1:S(i)-1
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
end
%% Optimization with Energy(PPD & PPE)
PpdN=cell(24,1);
PpeN=cell(24,1);
PpdD=cell(24,500);
PpeD=cell(24,500);
result=cell(24,500);
for i=1:24
    PpdN{i,1}=PPDfunction(Nres(i),DisN{i,1},Bs,aa{i,1},NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter); 
    PpeN{i,1}=PPEfunction(Nres(i),DisN{i,1},Bs,aa{i,1},Ss{i,1},NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter);
    for j=1:S(i)-1
        result{i,j}=cell(2,3);
        PpdD{i,j}=PPDfunction(Nres(i),DisD{i,j},Bs,aa{i,1},NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter);
        a=size(PpdD{i,j},2);
        result{i,j}{1,1}=CalculateEnergyfuction(PpdD{i,j},PpdN{i,1},rmsd{i,1}(1,j),2e-6);
        result{i,j}{1,2}=CalculateEnergyfuction(PpdD{i,j},PpdN{i,1},q{i,1}(1,j),1e-4);
        result{i,j}{1,3}=CalculateEnergyfuction(PpdD{i,j},PpdN{i,1},mt{i,1}(1,j),1e-4);
        rmsd{i,1}(2,j)=sum(PpdD{i,j}*result{i,j}{1,1}(1:a,1));
        q{i,1}(2,j)=sum(PpdD{i,j}*result{i,j}{1,2}(1:a,1));
        mt{i,1}(2,j)=sum(PpdD{i,j}*result{i,j}{1,3}(1:a,1));
        PpeD{i,j}=PPEfunction(Nres(i),DisD{i,j},Bs,aa{i,1},Ss{i,1},NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter);
        b=size(PpeD{i,j},2);
        result{i,j}{2,1}=CalculateEnergyfuction(PpeD{i,j},PpeN{i,1},rmsd{i,1}(1,j),1e-7);
        result{i,j}{2,2}=CalculateEnergyfuction(PpeD{i,j},PpeN{i,1},q{i,1}(1,j),1e-4);
        result{i,j}{2,3}=CalculateEnergyfuction(PpeD{i,j},PpeN{i,1},mt{i,1}(1,j),1e-4);
        rmsd{i,1}(3,j)=sum(PpeD{i,j}*result{i,j}{2,1}(1:b,1));
        q{i,1}(3,j)=sum(PpeD{i,j}*result{i,j}{2,2}(1:b,1));
        mt{i,1}(3,j)=sum(PpeD{i,j}*result{i,j}{2,3}(1:b,1));
    end
end