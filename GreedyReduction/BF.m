function gmr = BF(gmh,Nr,seq)
% gmr = BF(gmh,Nr,seq):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture (scalar),
% - seq, param to perform one-shot (0) reduction or sequential (1).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the Brute-force algorithm presented in:
% D. F. Crouse, P. Willett, K. Pattipati, and L. Svensson, "A look at Gaussian
% mixture reduction algorithms", in Proc. 14th Int. Conf. Inf. Fusion, Jul.
% 2011, pp. 1–8.

% For D. F. Crouse github repo from which this code has been readapted
% check the following link:
% https://github.com/USNavalResearchLaboratory/TrackerComponentLibrary/tree/master/Clustering%20and%20Mixture%20Reduction
if nargin < 3
    seq = 1;
end

assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(numel(gmh)>=Nr,'The original number of components has to be greater or equal than the reduced ones.');


gmr = gmh;
if seq==0
    if Nr == numel(gmh) - 1
        gmr=BFGMRBy1(gmr);
    else
        gmr=BFGMRFull(gmr,Nr);
    end
else
    if Nr == numel(gmh)
        return
    else
        for curComp=(numel(gmh)-1):-1:Nr
            gmr=BFGMRBy1(gmr);
        end
    end
    
end


end



function [gmr,setParMin] = BFGMRFull(gmh,Nr)
    Nh = numel(gmh);
    if(Nh==Nr)
        return
    elseif(Nr==1)
        gmr = mpMerge(gmh);
        return
    end

    [curSetPart,recurSetData]=getNextSetMPartition(Nh,Nr);

    ISEMin = Inf;


    gmr(Nr,1) = struct('w',[],'mu',[],'Sigma',[]);
    while(~isempty(curSetPart))
        for ind=1:Nr
            sel=(curSetPart==ind);
            w_sum = sum([gmh(sel).w]);

            pdf_merged = mpMerge([gmh(sel)]);
            gmr(ind).w = w_sum;
            gmr(ind).mu = pdf_merged.mu;
            gmr(ind).Sigma = pdf_merged.Sigma;

        end

        ISECurr = ISE(gmh,gmr);

        if(ISECurr<ISEMin)
            ISEMin=ISECurr;
            setParMin=curSetPart;
        end

        [curSetPart,recurSetData]=getNextSetMPartition(recurSetData);
    end

    %Return the best reduced distribution.
    for ind=1:Nr
        sel=(setParMin==ind);
        w_sum = sum([gmh(sel).w]);

        pdf_merged = mpMerge([gmh(sel)]);

        gmr(ind).w = w_sum;
        gmr(ind).mu = pdf_merged.mu;
        gmr(ind).Sigma = pdf_merged.Sigma;

    end
    
end

function [gmr,setParMin] = BFGMRBy1(gmh)
    
    Nh = numel(gmh);
    hhEval = zeros(Nh,Nh);
    
    for i=1:Nh
        for j=1:Nh
            if j>=i
                hhEval(i,j) = mvnpdf(gmh(i).mu,gmh(j).mu,gmh(i).Sigma + gmh(j).Sigma);
                hhEval(j,i) = hhEval(i,j);
            end
        end
    end
    
    
    ISEMin = Inf;
    hrEval = zeros(Nh,1);
    w_temp = zeros(Nh-1,1);
    for i=1:Nh
        for j=(i+1):Nh
            pdfMerged = mpMerge(gmh([i;j]));

            w_temp(1:Nh-2) = [gmh(setdiff(1:Nh,[i;j])).w];
            w_temp(end) = pdfMerged.w;

            for k=1:Nh
                hrEval(k) = mvnpdf(gmh(k).mu,pdfMerged.mu,gmh(k).Sigma + pdfMerged.Sigma);
            end
            rrEval = mvnpdf(pdfMerged.mu,pdfMerged.mu,2*pdfMerged.Sigma);

            Jhr = 0;

            for k1=1:Nh
                idx=1;
                for k2=1:Nh
                    if(k2==i||k2==j)
                        continue;
                    end 
                    Jhr=Jhr+gmh(k1).w*w_temp(idx)*hhEval(k1,k2);
                    idx=idx+1;
                end
                Jhr=Jhr+gmh(k1).w*w_temp(idx)*hrEval(k1);
            end
            
            Jrr=0;
            idx1=0;
            for k1=1:Nh
                if(k1==i||k1==j)
                    continue;
                end
                idx1=idx1+1;

                Jrr=Jrr+w_temp(idx1)^2*hhEval(k1,k1);

                idx2=idx1;
                for k2=(k1+1):Nh
                    if(k2==i||k2==j)
                        continue;
                    end
                    idx2=idx2+1;

                    Jrr=Jrr+2*w_temp(idx1)*w_temp(idx2)*hhEval(k1,k2);
                end
                %Add in the final term.
                Jrr=Jrr+2*w_temp(idx1)*w_temp(Nh-1)*hrEval(k1);
            end
            %Add in the final term with itself.
            Jrr=Jrr+w_temp(Nh-1)^2*rrEval;

            %The ISE omitting the constant term.
            ISEVal=Jrr-2*Jhr;

            if(ISEVal<ISEMin)
                ISEMin=ISEVal;
                minIdxs = [i;j];
            end
                        
                            
                
        end
    end
                
    pdfMerged = mpMerge(gmh(minIdxs));
    gmr = gmh;
    gmr(minIdxs(1)) = pdfMerged;
    gmr(minIdxs(2)) = [];
    
    if nargout>1
        setParMin = zeros(Nh,1);
        setParMin(minIdxs) = 1;
        
        idx = 2;
        for k=setdiff(1:Nh,minIdxs)
            setParMin(k) = idx;
            idx = idx+1;
        end
    end
            

end