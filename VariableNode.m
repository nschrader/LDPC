classdef VariableNode < handle  
    properties
        index
        tmp_p0 = 1
        tmp_p1 = 1
        probability % Pi
        probabilityOne % qij(1)
        probabilityZero % qij(0)
    end
    
    methods
        function self = VariableNode(index, value)
            self.index = index;
            self.probability = value;
            self.probabilityOne = self.probability;
            self.probabilityZero = 1 - self.probability;
        end
        
        function update(self, probabilityZero, probabilityOne) % rij
            self.tmp_p0 = self.tmp_p0 * probabilityZero;
            self.tmp_p1 = self.tmp_p1 * probabilityOne;
        end
        
        function r = decide(self)
            P = self.probability;
            K = 1/((1-P)*self.tmp_p0 + P*self.tmp_p1);
            for 
                self.probabilityZero(i) = K*(1-P)*self.tmp_p0;
                self.probabilityOne(i) = K*P*self.tmp_p1;
            end
            
            
        end
    end
    
end

