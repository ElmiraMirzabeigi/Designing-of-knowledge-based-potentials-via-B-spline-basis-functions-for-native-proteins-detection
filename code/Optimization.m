clc
%% Read native structure
Nativedata = pdbread('1dvf.pdb'); % read in data from PDB file
Nres=Nativedata.Model.Atom(end).resSeq;
End=size(Nativedata.Model.Atom,2);
aa=AminoAcidfunction(Nativedata,End,Nres);
%% Find the CA coordinates in Nativedata from PDB file
CaNative=CaAlphaCoordinatefunction(Nativedata,End,Nres);
DisN=DisStructurefunction(Nres,CaNative);
%% calculation PARAMETER
Bs=BsplineBasicFunctionfrom0to15;
NumberOfBspline=size(Bs,2);
NumberOfAminoAcid=21;
NumberPair=(((NumberOfAminoAcid.*NumberOfAminoAcid)-NumberOfAminoAcid)/2)+NumberOfAminoAcid;
Parameter=NumberPair.*NumberOfBspline;
%% Read decoy structures
    Decoydata(1)=pdbread('1dvf_FV__on_1fgv_FV__r.pdb');
    Decoydata(2)=pdbread('1dvf_FV__on_1flr_FV__r.pdb');
    Decoydata(3)=pdbread('1dvf_FV__on_1fvc_FV__r.pdb');
    Decoydata(4)=pdbread('1dvf_FV__on_1gaf_FV__r.pdb');
    Decoydata(5)=pdbread('1dvf_FV__on_1hil_FV__r.pdb');
    Decoydata(6)=pdbread('1dvf_FV__on_1ind_FV__r.pdb');
    Decoydata(7)=pdbread('1dvf_FV__on_1kem_FV__r.pdb');
    Decoydata(8)=pdbread('1dvf_FV__on_1mfa_FV__r.pdb');
    Decoydata(9)=pdbread('1dvf_FV__on_1mlb_FV__r.pdb');
    Decoydata(10)=pdbread('1dvf_FV__on_1nbv_FV__r.pdb');
    Decoydata(11)=pdbread('1dvf_FV__on_1opg_FV__r.pdb');
    Decoydata(12)=pdbread('1dvf_FV__on_1vfa_FV__r.pdb');
    Decoydata(13)=pdbread('1dvf_FV__on_1vge_FV__r.pdb');
    Decoydata(14)=pdbread('1dvf_FV__on_2cgr_FV__r.pdb');
    Decoydata(15)=pdbread('1dvf_FV__on_2fb4_FV__r.pdb');
    Decoydata(16)=pdbread('1dvf_FV__on_2fbj_FV__r.pdb');
    Decoydata(17)=pdbread('1dvf_FV__on_6fab_FV__r.pdb');
    Decoydata(18)=pdbread('1dvf_FV__on_7fab_FV__r.pdb');
    Decoydata(19)=pdbread('1dvf_FV__on_8fab_FV__r.pdb');
    Decoydata(20)=pdbread('1dvf_B.pdb');
%% Find the CA coordinates in decoydata(r) from PDB file
CaDecoy=cell(20,1);
DisD=cell(20,1);
rmsd=zeros(20,3);
% q=zeros(20,3);
% mt=zeros(20,3);
for r=1:20
    CaDecoy{r,1}=CaAlphaCoordinatefunction(Decoydata(r),End,Nres);
    DisD{r,1}=DisStructurefunction(Nres,CaDecoy{r,1});
    rmsd(r,1)=kabRMSD(CaNative,CaDecoy{r,1});
%     q(r,1)=Qfunction(Nres,DisN,DisD{r,1});
%     mt(r,1)=MTfunction(Nres,DisN,DisD{r,1});
end
%% Matrix S
M=zeros(Nres);
s=cell(20,1);
S=zeros(Nres);
for r=1:20
s{r,1}=(DisD{r,1}<=14.75 & DisD{r,1}>0);
end
b=20;
for i=1:Nres
    for j=i+1:Nres
        a=0;
        for r=1:20
            if s{r,1}(i,j)==1
               a=a+1;
            end
        end
        M(i,j)=a/b;
        if M(i,j)>0.25
           S(i,j)=1;
        end
    end
end 
%% Optimization with Energy(PPD & PPE)
PpdD=cell(20,1);
PpeD=cell(20,1);
result=cell(20,2);
PpdN=PPDfunction(Nres,DisN,Bs,aa,NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter); 
PpeN=PPEfunction(Nres,DisN,Bs,aa,S,NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter);
for r=1:20
    PpdD{r,1}=PPDfunction(Nres,DisD{r,1},Bs,aa,NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter);
    a=size(PpdD{r,1},2);
    result{r,1}=CalculateEnergyfuction(PpdD{r,1},PpdN,rmsd(r,1),2e-6);
%     result{r,3}=CalculateEnergyfuction(PpdD{r,1},PpdN,q(r,1),1e-4);
%     result{r,5}=CalculateEnergyfuction(PpdD{r,1},PpdN,mt(r,1),1e-4);
    rmsd(r,2)=sum(PpdD{r,1}*result{r,1}(1:a,1));
%     q(r,2)=sum(PpdD{r,1}*result{r,3}(1:a,1));
%     mt(r,2)=sum(PpdD{r,1}*result{r,5}(1:a,1));
    PpeD{r,1}=PPEfunction(Nres,DisD{r,1},Bs,aa,S,NumberOfAminoAcid,NumberOfBspline,NumberPair,Parameter);
    result{r,2}=CalculateEnergyfuction(PpeD{r,1},PpeN,rmsd(r,1),1e-7);
% %     result{r,4}=CalculateEnergyfuction(PpeD{r,1},PpeN,q(r,1),1e-4);
% %     result{r,6}=CalculateEnergyfuction(PpeD{r,1},PpeN,mt(r,1),1e-4);
    rmsd(r,3)=sum(PpeD{r,1}*result{r,2}(1:a,1));
%     q(r,3)=sum(PpeD{r,1}*result{r,4}(1:b,1));
%     mt(r,3)=sum(PpeD{r,1}*result{r,6}(1:b,1));
end
%% R-score & Z-score & Correlation
RscorePPD=Rscore(rmsd(:,1),rmsd(:,2));
RscorePPE=Rscore(rmsd(:,1),rmsd(:,3));
CorrPPD=CorrelationFunction(rmsd(:,1),rmsd(:,2));
CorrPPE=CorrelationFunction(rmsd(:,1),rmsd(:,3));
%% plot
figure('Name','Energy-RMSD');
plot(rmsd(:,1),rmsd(:,2),'*')
hold on
plot(rmsd(:,1),rmsd(:,3),'o')
% %--------------------------------------------------------------
% % figure('Name','Energy-Q');
% % plot(q(:,1),q(:,2),'*')
% % hold on;
% % plot(q(:,1),q(:,3),'o') 
% % %--------------------------------------------------------------
% % figure('Name','Energy-MT');
% % plot(mt(:,1),mt(:,2),'*')
% % hold on;
% % plot(mt(:,1),mt(:,3),'o')
% 
