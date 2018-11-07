classdef Message < handle
    properties
        source
        p0
        p1
    end
    
    methods
        function self = Message(source, p0, p1)
            self.source = source;
            self.p0 = p0;
            self.p1 = p1;
        end
    end
    
end

