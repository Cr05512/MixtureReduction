function Hhr = matrixUnwCrossLikeness(muh,Sigmah,mur,Sigmar)
% Hhr = matrixUnwCrossLikeness(muh,Sigmah,mur,Sigmar):
% INPUTS:
% - muh, Sigmah, mur, Sigmar, two Gaussian mixture means and covariances.
% OUTPUTS:
% - Hhr, the matrix unweighted cross likeness (Nh x Nh matrix).
% This function computes the matrix self likenesses of a Gaussian mixture. Summing up over all the elements of such matrix
% returns the scalar self likeness of the mixture. 
assert(size(muh,2)>0 && size(muh,2)==size(Sigmah,3) && size(muh,1)==size(Sigmah,1) &&...
       size(mur,2)>0 && size(mur,2)==size(Sigmar,3) && size(mur,1)==size(Sigmar,1)...
       ,'The mixture parameters are inconsistent.');

Nh = size(muh,2);
Nr = size(mur,2);

Hhr = Inf(Nh,Nr);

for i=1:Nh
    for j=1:Nr
         Hhr(i,j) = mvnpdf(muh(:,i),mur(:,j),Sigmah(:,:,i) + Sigmar(:,:,j));
    end
end

end