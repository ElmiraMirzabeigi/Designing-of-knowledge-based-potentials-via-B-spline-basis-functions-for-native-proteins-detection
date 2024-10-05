function E=logodd_d_CA(logodd_d)
N='CA';
a=zeros;
for i=1:21
    if i==1
        a(i)=atomtype2num167(N,'GLY');
    elseif i==2
        a(i)=atomtype2num167(N,'ALA');
    elseif i==3
        a(i)=atomtype2num167(N,'VAL');
    elseif i==4
        a(i)=atomtype2num167(N,'LEU');
    elseif i==5
        a(i)=atomtype2num167(N,'ILE');
    elseif i==6
        a(i)=atomtype2num167(N,'MET');
    elseif i==7
        a(i)=atomtype2num167(N,'PRO');
    elseif i==8
        a(i)=atomtype2num167(N,'HIS');
    elseif i==9
        a(i)=atomtype2num167(N,'PHE');
    elseif i==10
        a(i)=atomtype2num167(N,'TYR');
    elseif i==11
        a(i)=atomtype2num167(N,'TRP');
    elseif i==12
        a(i)=atomtype2num167(N,'CYH');
    elseif i==13
        a(i)=atomtype2num167(N,'CYS');
    elseif i==14
        a(i)=atomtype2num167(N,'SER');
    elseif i==15
        a(i)=atomtype2num167(N,'THR');
    elseif i==16
        a(i)=atomtype2num167(N,'ASN');
    elseif i==17
        a(i)=atomtype2num167(N,'GLN');
    elseif i==18
        a(i)=atomtype2num167(N,'ASP');
    elseif i==19
        a(i)=atomtype2num167(N,'GLU');
    elseif i==20
        a(i)=atomtype2num167(N,'LYS');
    elseif i==21
        a(i)=atomtype2num167(N,'ARG');
    end
end
E=cell(21);
for i=1:21
    for j=i:21
        E{i,j}=logodd_d{a(i),a(j)};
    end
end
end