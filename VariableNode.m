classdef VariableNode < handle
    %VARIABLENODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index
        value
        votes
    end
    
    methods
        function self = VariableNode(index, value)
            self.index = index;
            self.value = value;
        end
        
        function r = decide(self)
            if self.votes > 1
                r = 1;
            else
                r = 0;
            end
        end
    end
    
end

