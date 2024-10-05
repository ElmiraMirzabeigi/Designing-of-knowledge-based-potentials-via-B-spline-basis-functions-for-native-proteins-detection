function[Dis]=DisStructurefunction(Nres,Ca)
D=cell(Nres);
Dis=zeros(Nres);
for i=1:Nres
  for j=i+1:Nres
      D{i,j}=Ca(i,:)-Ca(j,:);
      Dis(i,j)=sqrt(D{i,j}(1,1).^2+D{i,j}(1,2).^2+D{i,j}(1,3).^2);
  end
end
end