classdef List < handle
    %LIST Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        array
    end
    
    methods        
        function insert(self, array)
            self.array = array;
        end
        
        function append(self, val)
            self.array = [self.array val];
        end
        
        function r = get(self, index)
            r = self.array(index);
        end
        
        function r = size(self)
            r = length(self.array);
        end
        
        function r = iterator(self)
            r = self.array;
        end
    end
    
end

