function [Dfmu,DfL] = partialBDBar(mur,L,wh,muh,Sigmah)

N = numel(wh);
d = size(muh(:,1),1);
Dfmu = zeros(d,1);
DfL = zeros(d,d);
Sigmar = L*L';
Sigmarinv = inv(Sigmar);
for i=1:N
    diff = (mur - muh(:,i) );
    Sigmahetainv = inv(Sigmah(:,:,i) + Sigmar);
    Dfmu = Dfmu + 0.5*wh(i)*Sigmahetainv*diff;
    DfL = DfL + wh(i)*(Sigmahetainv - 0.5*Sigmarinv - 0.5*Sigmahetainv*diff*(diff'*Sigmahetainv))*L;
end



end

