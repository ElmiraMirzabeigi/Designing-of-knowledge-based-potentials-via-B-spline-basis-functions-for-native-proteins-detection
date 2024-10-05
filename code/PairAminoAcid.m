function[Energy,referenceEN,Error]=PairAminoAcid(Nativedata,Bs,Energyfunction)
Nres=Nativedata.Model.Atom(end).resSeq;
End=size(Nativedata.Model.Atom,2);
aa=AminoAcidfunction(Nativedata,End,Nres);
CaNative=CaAlphaCoordinatefunction(Nativedata,End,Nres);
A=zeros(1,20);
for i=1:Nres
    for j=1:20
        if aa(i)==j
            A(1,j)=A(1,j)+1;
        end
    end
end
B=A;
Ca=cell(1,20);
for i=Nres:-1:1
    for j=1:20
        if aa(i)==j
            Ca{1,j}(B(1,j),1)=CaNative(i,1);
            Ca{1,j}(B(1,j),2)=CaNative(i,2);
            Ca{1,j}(B(1,j),3)=CaNative(i,3);
            B(1,j)=B(1,j)-1;
        end
    end
end
%% Distance
Dis=cell(20);
D=cell(20);
L=zeros(1,210);
x=1;
for i=1:20
  for j=i:20
      r=1;
      for k=1:A(1,i)
          for h=k+1:A(1,j)
              Dis{i,j}(k,h)=sqrt((Ca{1,i}(k,1)-Ca{1,j}(h,1)).^2+(Ca{1,i}(k,2)-Ca{1,j}(h,2)).^2+(Ca{1,i}(k,3)-Ca{1,j}(h,3)).^2);
              if Dis{i,j}(k,h)>0 && Dis{i,j}(k,h)<=6
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
B=cell(20);
x=1;
for i=1:20
    for j=i:20
        a=1;
        for k=1:L(1,x)
            b=1;
            for t=1:9
                B{i,j}(a,b)=fnval(D{i,j}(k,1),Bs{1,t});
                b=b+1;
            end
            a=a+1;
        end
        x=x+1;
    end
end
ReferenceEnergy=load('logodd_d.mat');
E=cell(20);
Energy=cell(20);
Error=cell(20);
referenceEN=cell(20);
h=1891;
x=1;
for i=1:20
    for j=i:20
        for k=1:9
            E{i,j}(k,1)=Energyfunction(h,1);
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
%             elseif D{i,j}(k,1)>=6.25 && D{i,j}(k,1)<6.75
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,13);
%             elseif D{i,j}(k,1)>=6.75 && D{i,j}(k,1)<7.25
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,14);
%             elseif D{i,j}(k,1)>=7.25 && D{i,j}(k,1)<7.75
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,15);
%             elseif D{i,j}(k,1)>=7.75 && D{i,j}(k,1)<8.25 
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,16);
%             elseif D{i,j}(k,1)>=8.25 && D{i,j}(k,1)<8.75
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,17);
%             elseif D{i,j}(k,1)>=8.75 && D{i,j}(k,1)<9.25
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,18);
%             elseif D{i,j}(k,1)>=9.25 && D{i,j}(k,1)<9.75
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,19);
%             elseif D{i,j}(k,1)>=9.75 && D{i,j}(k,1)<10.25
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,20);
%             elseif D{i,j}(k,1)>=10.25 && D{i,j}(k,1)<10.75
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,21);
%             elseif D{i,j}(k,1)>=10.75 && D{i,j}(k,1)<11.25
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,22);
%             elseif D{i,j}(k,1)>=11.25 && D{i,j}(k,1)<11.75
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,23);
%             elseif D{i,j}(k,1)>=11.75 && D{i,j}(k,1)<12.25
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,24);
%             elseif D{i,j}(k,1)>=12.25 && D{i,j}(k,1)<12.75
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,25);
%             elseif D{i,j}(k,1)>=12.75 && D{i,j}(k,1)<13.25 
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,26);
%             elseif D{i,j}(k,1)>=13.25 && D{i,j}(k,1)<13.75
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,27);
%             elseif D{i,j}(k,1)>=13.75 && D{i,j}(k,1)<14.25
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,28);
%             elseif D{i,j}(k,1)>=14.25 && D{i,j}(k,1)<=14.75
%                referenceEN{i,j}(k)=ReferenceEnergy.logodd_d{v1,v2}(1,29); 
            end
        end
        x=x+1;
        Error{i,j}=abs(Energy{i,j}-referenceEN{i,j});
       % plot(D{i,j},referenceEN,'-*')
    end
end
end