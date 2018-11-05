classdef List < handle
    %LIST Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        array
    end
    
    methods
        function append(self, val)
            self.array = [self.array val];
        end
        
        function r = get(self, index)
            r = self.array(index);
        end
        
        function r = size(self)
            r = length(self.array);
        end
    end
    
end

