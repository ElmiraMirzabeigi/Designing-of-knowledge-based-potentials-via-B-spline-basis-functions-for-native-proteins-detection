% function[Nativedata,Decoydata]=ReadPDBfunction(DATAbase)
% if DATAbase=='fisa'
%     A=load('\fisa\list.mat');
%     S=size(A,2);
%     a=cell(S,1);
%     s=zeros(S,1);
%     Nativedata=cell(S,1);
%     Decoydata=cell(S,20);
%     for i=1:S
%         a{i}=load('\A{1,i}\name_crmsd_scores{1,1}');
%         s(i)=size(a{i},2);
%         
%         for j=1:s(i)
%             if j==1
%                 Nativedata{i}=load('name_crmsd_scores{1,1}(1,j)');
%             else
%                 Decoydata{i,j-1}=load('name_crmsd_scores{1,1}(1,j)');
%             end
%         end
%     end
% end 
% end
Decoydata=cell(500,1);
A=load('C:\Users\valieasr\Desktop\Matlab\fisa\1fc2\name_crmsd_scores');
s=size(A.name_crmsd_scores{1,1},1);
for i=1:s
    if i==1
       a=A.name_crmsd_scores{1,1}{i,1}; 
       Nativedata=pdbread(a);
    else
        Decoydata{i-1,1}=pdbread(a.name_crmsd_scores{1,1}{i,1});
    end
end
