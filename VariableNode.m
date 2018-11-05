classdef VariableNode < handle
    %VARIABLENODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index
        value
        voteOne = 0
        voteZero = 0
    end
    
    methods
        function self = VariableNode(index, value)
            self.index = index;
            self.value = value;
        end
        
        function r = decide(self)
            delta = self.voteOne - self.voteZero;
            if delta == 0
                r = self.value;
            else
                r = double(delta > 0);
            end
        end
    end
    
end

