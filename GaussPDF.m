classdef GaussPDF < dynamicprops

    properties
        w
        mu
        Sigma
    end
    
    methods
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
        
        function compPDF = getPDF(obj,points)
            compPDF = obj.w*pdf('Normal',points,obj.mu,obj.Sigma);
        end
    
    end
end

