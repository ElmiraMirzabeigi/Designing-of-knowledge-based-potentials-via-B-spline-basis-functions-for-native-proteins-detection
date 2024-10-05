function [E] = Energyfunction_Database2(pdb_file,DistanceMatrix,database)
A = length(DistanceMatrix) ;
E = zeros ;
for i = 1 : A
    for j = i+1 : A
        v1 = atomtype2num167(pdb_file.Model.Atom(i).AtomName,...
            pdb_file.Model.Atom(i).resName) ;
        v2 = atomtype2num167(pdb_file.Model.Atom(j).AtomName,...
            pdb_file.Model.Atom(j).resName) ;
        if v1>v2
            c = v1 ;
            v1 = v2 ;
            v2 = c ;
        end 
        if DistanceMatrix(i,j)>=0 && DistanceMatrix(i,j)<0.75
            E(i,j) = database{v1,v2}(1,1);
        elseif DistanceMatrix(i,j)>=0.75 && DistanceMatrix(i,j)<1.25
            E(i,j) = database{v1,v2}(1,2);
        elseif DistanceMatrix(i,j)>=1.25 && DistanceMatrix(i,j)<1.75
            E(i,j) = database{v1,v2}(1,3);
        elseif DistanceMatrix(i,j)>=1.75 && DistanceMatrix(i,j)<2.25
            E(i,j) = database{v1,v2}(1,4);
        elseif DistanceMatrix(i,j)>=2.25 && DistanceMatrix(i,j)<2.75
            E(i,j) = database{v1,v2}(1,5);
        elseif DistanceMatrix(i,j)>=2.75 && DistanceMatrix(i,j)<3.25
            E(i,j) = database{v1,v2}(1,6);
        elseif DistanceMatrix(i,j)>=3.25 && DistanceMatrix(i,j)<3.75
            E(i,j) = database{v1,v2}(1,7);
        elseif DistanceMatrix(i,j)>=3.75 && DistanceMatrix(i,j)<4.25
            E(i,j) = database{v1,v2}(1,8);
        elseif DistanceMatrix(i,j)>=4.25 && DistanceMatrix(i,j)<4.75
            E(i,j) = database{v1,v2}(1,9);
        elseif DistanceMatrix(i,j)>=4.75 && DistanceMatrix(i,j)<5.25
            E(i,j) = database{v1,v2}(1,10);
        elseif DistanceMatrix(i,j)>=5.25 && DistanceMatrix(i,j)<5.75
            E(i,j) = database{v1,v2}(1,11);
        elseif DistanceMatrix(i,j)>=5.75 && DistanceMatrix(i,j)<6.25
            E(i,j) = database{v1,v2}(1,12);
        elseif DistanceMatrix(i,j)>=6.25 && DistanceMatrix(i,j)<6.75
            E(i,j) = database{v1,v2}(1,13);
        elseif DistanceMatrix(i,j)>=6.75 && DistanceMatrix(i,j)<7.25
            E(i,j) = database{v1,v2}(1,14);
        elseif DistanceMatrix(i,j)>=7.25 && DistanceMatrix(i,j)<7.75
            E(i,j) = database{v1,v2}(1,15);
        elseif DistanceMatrix(i,j)>=7.75 && DistanceMatrix(i,j)<8.25
            E(i,j) = database{v1,v2}(1,16);
        elseif DistanceMatrix(i,j)>=8.25 && DistanceMatrix(i,j)<8.75
            E(i,j) = database{v1,v2}(1,17);
        elseif DistanceMatrix(i,j)>=8.75 && DistanceMatrix(i,j)<9.25
            E(i,j) = database{v1,v2}(1,18);
        elseif DistanceMatrix(i,j)>=9.25 && DistanceMatrix(i,j)<9.75
            E(i,j) = database{v1,v2}(1,19);
        elseif DistanceMatrix(i,j)>=9.75 && DistanceMatrix(i,j)<10.25
            E(i,j) = database{v1,v2}(1,20);
        elseif DistanceMatrix(i,j)>=10.25 && DistanceMatrix(i,j)<10.75
            E(i,j) = database{v1,v2}(1,21);
        elseif DistanceMatrix(i,j)>=10.75 && DistanceMatrix(i,j)<11.25
            E(i,j) = database{v1,v2}(1,22);
        elseif DistanceMatrix(i,j)>=11.25 && DistanceMatrix(i,j)<11.75
            E(i,j) = database{v1,v2}(1,23);
        elseif DistanceMatrix(i,j)>=11.75 && DistanceMatrix(i,j)<12.25
            E(i,j) = database{v1,v2}(1,24);
        elseif DistanceMatrix(i,j)>=12.25 && DistanceMatrix(i,j)<12.75
            E(i,j) = database{v1,v2}(1,25);
        elseif DistanceMatrix(i,j)>=12.75 && DistanceMatrix(i,j)<13.25
            E(i,j) = database{v1,v2}(1,26);
        elseif DistanceMatrix(i,j)>=13.25 && DistanceMatrix(i,j)<13.75
            E(i,j) = database{v1,v2}(1,27);
        elseif DistanceMatrix(i,j)>=13.75 && DistanceMatrix(i,j)<14.25
            E(i,j) = database{v1,v2}(1,28);
        elseif DistanceMatrix(i,j)>=14.25 && DistanceMatrix(i,j)<=14.75
            E(i,j) = database{v1,v2}(1,29);
        end
    end
end
E = sum(sum(E)) ;
end