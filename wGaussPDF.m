classdef wGaussPDF < dynamicprops
%Weighted gaussian PDFs
    properties
        w
        mu
        Sigma
    end
    
    methods
        function obj = wGaussPDF(weight,mean,covariance)
            if nargin > 0
                obj.w = weight;
                obj.mu = mean;
                obj.Sigma = covariance;
            end
        end
        
        function weight = getWeight(obj)
            weight = obj.w;
        end
        
        function mean = getMean(obj)
            mean = obj.mu;
        end
        
        function covariance = getCovariance(obj)
            covariance = obj.Sigma;
        end
        
        function setWeight(obj, weight)
            obj.w = weight;
        end
        
        function setMean(obj, mean)
            obj.mu = mean;
        end
        
        function setCovariance(obj, covariance)
            obj.Sigma = covariance;
        end
        
        function compPDFValues = getPDFValues(obj,X)
            if size(obj.Sigma,1)>1
                compPDFValues = mvnpdf(X,obj.mu',obj.Sigma);
            else
                compPDFValues = mvnpdf(X',obj.mu,obj.Sigma)';
                %compPDFValues = normpdf(X,obj.mu,sqrt(obj.Sigma));
            end
        end
        
        function copyComponent(obj,comp)
           obj.setWeight(comp.getWeight());
           obj.setMean(comp.getMean());
           obj.setCovariance(comp.getCovariance());
        end
    
    end
end

