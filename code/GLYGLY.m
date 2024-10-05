close all;
clc;
%% B-spline basic functions
Bs=BsplineBasicFunctionfrom0to15;
% k=0;
% for r=1:8
%        t=0+k:1.5:4.5+k;
%        Bs{1,r}=spmak(t,1);
% %        fnplt(Bs{1,r})
% %        hold on;
%        k=k+1.5;
% end
%% Read native structure
Nativedata = pdbread('1dvf.pdb'); % read in data from PDB file
Nres=Nativedata.Model.Atom(end).resSeq;
End=size(Nativedata.Model.Atom,2);
aa=AminoAcidfunction(Nativedata,End,Nres);
CaNative=CaAlphaCoordinatefunction(Nativedata,End,Nres);
A=zeros(1,21);
for i=1:Nres
    for j=1:21
        if aa(i)==j
            A(1,j)=A(1,j)+1;
        end
    end
end
B=A;
Ca=cell(1,21);
for i=Nres:-1:1
    for j=1:21
        if aa(i)==j
            Ca{1,j}(B(1,j),1)=CaNative(i,1);
            Ca{1,j}(B(1,j),2)=CaNative(i,2);
            Ca{1,j}(B(1,j),3)=CaNative(i,3);
            B(1,j)=B(1,j)-1;
        end
    end
end
%% Distance
Dis=cell(21);
D=cell(21);
L=zeros(1,231);
x=1;
for i=1:21
  for j=i:21
      r=1;
      for k=1:A(1,i)
          for h=k+1:A(1,j)
              Dis{i,j}(k,h)=sqrt((Ca{1,i}(k,1)-Ca{1,j}(h,1)).^2+(Ca{1,i}(k,2)-Ca{1,j}(h,2)).^2+(Ca{1,i}(k,3)-Ca{1,j}(h,3)).^2);
              if Dis{i,j}(k,h)>0 && Dis{i,j}(k,h)<=14.75
                 D{i,j}(r,1)=Dis{i,j}(k,h);
                 r=r+1;
              end
          end
      end
      L(1,x)=r-1;
      x=x+1;
      D{i,j}=DownToUpfunction(D{i,j});
  end
end

B=cell(21);
x=1;
for i=1:21
    for j=i:21
        a=1;
        for k=1:L(1,x)
            b=1;
            for t=1:8
                B{i,j}(a,b)=fnval(D{i,j}(k,1),Bs{1,t});
                b=b+1;
            end
            a=a+1;
        end
        x=x+1;
    end
end

% % % %% Read Decoys structure
% % %     Decoydata(1)=pdbread('1dvf_FV__on_1fgv_FV__r.pdb');
% % %     Decoydata(2)=pdbread('1dvf_FV__on_1flr_FV__r.pdb');
% % %     Decoydata(3)=pdbread('1dvf_FV__on_1fvc_FV__r.pdb');
% % %     Decoydata(4)=pdbread('1dvf_FV__on_1gaf_FV__r.pdb');
% % %     Decoydata(5)=pdbread('1dvf_FV__on_1hil_FV__r.pdb');
% % %     Decoydata(6)=pdbread('1dvf_FV__on_1ind_FV__r.pdb');
% % %     Decoydata(7)=pdbread('1dvf_FV__on_1kem_FV__r.pdb');
% % %     Decoydata(8)=pdbread('1dvf_FV__on_1mfa_FV__r.pdb');
% % %     Decoydata(9)=pdbread('1dvf_FV__on_1mlb_FV__r.pdb');
% % %     Decoydata(10)=pdbread('1dvf_FV__on_1nbv_FV__r.pdb');
% % %     Decoydata(11)=pdbread('1dvf_FV__on_1opg_FV__r.pdb');
% % %     Decoydata(12)=pdbread('1dvf_FV__on_1vfa_FV__r.pdb');
% % %     Decoydata(13)=pdbread('1dvf_FV__on_1vge_FV__r.pdb');
% % %     Decoydata(14)=pdbread('1dvf_FV__on_2cgr_FV__r.pdb');
% % %     Decoydata(15)=pdbread('1dvf_FV__on_2fb4_FV__r.pdb');
% % %     Decoydata(16)=pdbread('1dvf_FV__on_2fbj_FV__r.pdb');
% % %     Decoydata(17)=pdbread('1dvf_FV__on_6fab_FV__r.pdb');
% % %     Decoydata(18)=pdbread('1dvf_FV__on_7fab_FV__r.pdb');
% % %     Decoydata(19)=pdbread('1dvf_FV__on_8fab_FV__r.pdb');
% % %     Decoydata(20)=pdbread('1dvf_B.pdb');
% % % %% Distance in Decoys
% % % DisD=cell(20,1);
% % % DecoysPA=cell(20,1);
% % % CaDecoy=cell(20,1);
% % % for r=1:20
% % %     CaDecoy{r,1}=CaAlphaCoordinatefunction(Decoydata(r),End,Nres);
% % %     for k=1:Nres
% % %         if aa(k)~=7
% % %            CaDecoy{r,1}(k,1)=0;
% % %         end
% % %     end
% % %     k=1;
% % %     for i=1:Nres
% % %         for j=1:Nres
% % %             DisD{r,1}(i,j)=sqrt((CaDecoy{r,1}(i,1)-CaDecoy{r,1}(j,1)).^2+(CaDecoy{r,1}(i,2)-CaDecoy{r,1}(j,2)).^2+(CaDecoy{r,1}(i,3)-CaDecoy{r,1}(j,3)).^2);
% % %             if DisD{r,1}(i,j)>0 && DisD{r,1}(i,j)<=12
% % %                D{r+1,1}(k,1)=DisD{r,1}(i,j);
% % %                k=k+1;
% % %             end
% % %         end
% % %     end
% % % end
%% Validation Energy function
ReferenceEnergy=load('logodd_d.mat');
Energyfunction=load('result.mat');
E=cell(21);
Energy=cell(21);
Error=cell(21);
referenceEN=cell(21);
h=2209;
x=1;
for i=1:21
    for j=i:21
        for k=1:8
            E{i,j}(k,1)=Energyfunction.result{1,1}(h,1);
            h=h+1;
        end
        if B{i,j}>=0
           Energy{i,j}=B{i,j}*E{i,j};
%            if D{i,j}(:,1)~=0
%               figure;
%               plot(D{i,j},Energy{i,j},'-o');
%               hold on;
%            end
        end
        aminoacid1=InverseAminoAcidfunction(i);
        v1=atomtype2num167('CA',aminoacid1);
        aminoacid2=InverseAminoAcidfunction(j);
        v2=atomtype2num167('CA',aminoacid2);
        referenceEN{i,j}=zeros(L(1,x),1);
        for k=1:L(1,x)
            if D{i,j}(k,1)>=0 && D{i,j}(k,1)<0.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,1);
            elseif D{i,j}(k,1)>=0.75 && D{i,j}(k,1)<1.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,2);
            elseif D{i,j}(k,1)>=1.25 && D{i,j}(k,1)<1.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,3);
            elseif D{i,j}(k,1)>=1.75 && D{i,j}(k,1)<2.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,4);
            elseif D{i,j}(k,1)>=2.25 && D{i,j}(k,1)<2.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,5);
            elseif D{i,j}(k,1)>=2.75 && D{i,j}(k,1)<3.25 
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,6);
            elseif D{i,j}(k,1)>=3.25 && D{i,j}(k,1)<3.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,7);
            elseif D{i,j}(k,1)>=3.75 && D{i,j}(k,1)<4.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,8);
            elseif D{i,j}(k,1)>=4.25 && D{i,j}(k,1)<4.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,9);
            elseif D{i,j}(k,1)>=4.75 && D{i,j}(k,1)<5.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,10);
            elseif D{i,j}(k,1)>=5.25 && D{i,j}(k,1)<5.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,11);
            elseif D{i,j}(k,1)>=5.75 && D{i,j}(k,1)<6.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,12);
            elseif D{i,j}(k,1)>=6.25 && D{i,j}(k,1)<6.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,13);
            elseif D{i,j}(k,1)>=6.75 && D{i,j}(k,1)<7.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,14);
            elseif D{i,j}(k,1)>=7.25 && D{i,j}(k,1)<7.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,15);
            elseif D{i,j}(k,1)>=7.75 && D{i,j}(k,1)<8.25 
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,16);
            elseif D{i,j}(k,1)>=8.25 && D{i,j}(k,1)<8.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,17);
            elseif D{i,j}(k,1)>=8.75 && D{i,j}(k,1)<9.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,18);
            elseif D{i,j}(k,1)>=9.25 && D{i,j}(k,1)<9.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,19);
            elseif D{i,j}(k,1)>=9.75 && D{i,j}(k,1)<10.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,20);
            elseif D{i,j}(k,1)>=10.25 && D{i,j}(k,1)<10.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,21);
            elseif D{i,j}(k,1)>=10.75 && D{i,j}(k,1)<11.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,22);
            elseif D{i,j}(k,1)>=11.25 && D{i,j}(k,1)<11.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,23);
            elseif D{i,j}(k,1)>=11.75 && D{i,j}(k,1)<12.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,24);
            elseif D{i,j}(k,1)>=12.25 && D{i,j}(k,1)<12.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,25);
            elseif D{i,j}(k,1)>=12.75 && D{i,j}(k,1)<13.25 
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,26);
            elseif D{i,j}(k,1)>=13.25 && D{i,j}(k,1)<13.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,27);
            elseif D{i,j}(k,1)>=13.75 && D{i,j}(k,1)<14.25
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,28);
            elseif D{i,j}(k,1)>=14.25 && D{i,j}(k,1)<=14.75
               referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,29); 
            end
        end
        x=x+1;
        Error{i,j}=abs(Energy{i,j}-referenceEN{i,j});
       % plot(D{i,j},referenceEN,'-*')
    end
end