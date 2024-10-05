% this programming checked the number of b-spline basic function to get
% down the Error
%this programming checked one protein structures
close all
clc
%% load protein files
load('C:\Users\valieasr\Desktop\Matlab\protein data based\1dvf\1dvf.mat');
S=size(list.name_crmsd_scores{1,1},1);
    Decoy=cell(n,S(i));
    CaDecoy=cell(n,S(i));
    DisD=cell(n,S(i));
    rmsd=cell(n,1);
    q=cell(n,1);
    mt=cell(n,1);
    M=cell(n,1);
    M{i,1}=zeros(Nres(i));
    S=cell(n,1);
    s=cell(n,S(i));
    S=zeros(Nres);
for j=1:S1(i)
    if Data.name_crmsd_scores{1,1}{j,1}=='1dvf'
       Native=pdbread(Data.name_crmsd_scores{1,1}{j,1});
       Nres=Native.Model.Atom(end).resSeq;
       End=size(Native.Model.Atom,2);
       aa=AminoAcidfunction(Native,End,Nres);
    else
       Decoy{1,j-1}=pdbread(Data.name_crmsd_scores{1,1}{j-1,1});
    end
end
%% calculation PARAMETER
Bs=BsplineBasicFunctionfrom0to15;
NumberOfBspline=size(Bs,2);
NumberOfAminoAcid=21;
NumberPair=(((NumberOfAminoAcid.*NumberOfAminoAcid)-NumberOfAminoAcid)/2)+NumberOfAminoAcid;
Parameter=NumberPair.*NumberOfBspline;
%% Calculate Ca-Alpha in natives & Decoys structure
CaNative=CaAlphaCoordinatefunction(Native,End,Nres);
DisN=DisStructurefunction(Nres,CaNative);
for j=1:S-1
    CaDecoy{1,j}=CaAlphaCoordinatefunction(Decoy{1,j},End,Nres);  
    DisD{1,j}=DisStructurefunction(Nres,CaDecoy{1,j});
end
%% Calculate metrics
for i=1
    for j=1:S1(i)-1
        rmsd{i,1}(1,j)=kabRMSD(CaNative{i,1},CaDecoy{i,j});
        q{i,1}(1,j)=Qfunction(Nres(i),DisN{i,1},DisD{i,j});
        mt{i,1}(1,j)=MTfunction(Nres(i),DisN{i,1},DisD{i,j});
    end
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
%% Matrix S
for i=1
    for j=1:S1(i)-1
        s{i,j}=(DisD{i,j}<=6 & DisD{i,j}>0);
    end
end
for i=1
    b=S1(i)-1;
    for j=1:Nres(i)
        for k=j+1:Nres(i)
            a=0;
            for h=1:S1(i)-1
                if s{i,h}(j,k)==1
                   a=a+1;
                end
            end
            M{i,1}(j,k)=a/b;
            if M{i,1}(j,k)>0.25
               S{i,1}(j,k)=1;
            end
        end
    end
    S{i,1}(Nres(i),Nres(i))=0;
end 
%% Optimization with Energy(PPD & PPE)
for i=1
    PpdN=cell(s1,1);
    PpdD=cell(i,S1(i));
    PpeN=cell(s1,1);
    PpeD=cell(i,S1(i));
    result=cell(i,S1(i));
    PpdN{i,1}=PPDfunction(Nres(i),DisN{i,1},Bs,aa{i,1},NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter); 
    PpeN{i,1}=PPEfunction(Nres(i),DisN{i,1},Bs,aa{i,1},S{i,1},NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter);
    for j=2
        result{i,j}=cell(2,3);
        PpdD{i,j}=PPDfunction(Nres(i),DisD{i,j},Bs,aa{i,1},NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter);
        a=size(PpdD{i,j},2);
        result{i,j}{1,1}=CalculateEnergyfuction(PpdD{i,j},PpdN{i,1},rmsd{i,1}(1,j),2e-6);
        result{i,j}{1,2}=CalculateEnergyfuction(PpdD{i,j},PpdN{i,1},q{i,1}(1,j),1e-4);
        result{i,j}{1,3}=CalculateEnergyfuction(PpdD{i,j},PpdN{i,1},mt{i,1}(1,j),1e-4);
        rmsd{i,1}(2,j)=sum(PpdD{i,j}*result{i,j}{1,1}(1:a,1));
        q{i,1}(2,j)=sum(PpdD{i,j}*result{i,j}{1,2}(1:a,1));
        mt{i,1}(2,j)=sum(PpdD{i,j}*result{i,j}{1,3}(1:a,1));
        PpeD{i,j}=PPEfunction(Nres(i),DisD{i,j},Bs,aa{i,1},S{i,1},NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter);
        b=size(PpeD{i,j},2);
        result{i,j}{2,1}=CalculateEnergyfuction(PpeD{i,j},PpeN{i,1},rmsd{i,1}(1,j),1e-7);
        result{i,j}{2,2}=CalculateEnergyfuction(PpeD{i,j},PpeN{i,1},q{i,1}(1,j),1e-4);
        result{i,j}{2,3}=CalculateEnergyfuction(PpeD{i,j},PpeN{i,1},mt{i,1}(1,j),1e-4);
        rmsd{i,1}(3,j)=sum(PpeD{i,j}*result{i,j}{2,1}(1:b,1));
        q{i,1}(3,j)=sum(PpeD{i,j}*result{i,j}{2,2}(1:b,1));
        mt{i,1}(3,j)=sum(PpeD{i,j}*result{i,j}{2,3}(1:b,1));
    end
% %% plot
% figure('Name','Energy-RMSD');
% plot(rmsd{i,1}(1,:),rmsd{i,1}(2,:),'*')
% hold on
% plot(rmsd{i,1}(1,:),rmsd{i,1}(3,:),'o')
% %--------------------------------------------------------------
% figure('Name','Energy-Q');
% plot(q{i,1}(1,:),q{i,1}(2,:),'*')
% hold on;
% plot(q{i,1}(1,:),q{i,1}(3,:),'o') 
% %--------------------------------------------------------------
% figure('Name','Energy-MT');
% plot(mt{i,1}(1,:),mt{i,1}(2,:),'*')
% hold on;
% plot(mt{i,1}(1,:),mt{i,1}(3,:),'o')
end
%% Pair amino Acid
for i=1
    Energy=cell(s1,S1(i));
    referenceEN=cell(s1,S1(i));
    Error=cell(s1,S1(i));
    for j=10
        for k=1:2
            for h=1:3
                [Energy{i,j}{k,h},referenceEN{i,j}{k,h},Error{i,j}{k,h}]=PairAminoAcid(Native{i,1},Bs,result{i,j}{k,h});
            end
        end
    end
end
%% Correlation 
Corr=cell(s1,1);
for i=1
    Corr{i,1}{1,1}=CorrelationFunction(rmsd{i,1}(1,2),rmsd{i,1}(2,2));
    Corr{i,1}{1,2}=CorrelationFunction(rmsd{i,1}(1,2),rmsd{i,1}(3,2));
    Corr{i,1}{2,1}=CorrelationFunction(mt{i,1}(1,2),mt{i,1}(2,2));
    Corr{i,1}{2,2}=CorrelationFunction(mt{i,1}(1,2),mt{i,1}(3,2));
    Corr{i,1}{3,1}=CorrelationFunction(q{i,1}(1,2),q{i,1}(2,2));
    Corr{i,1}{3,2}=CorrelationFunction(q{i,1}(1,2),q{i,1}(3,2));
end