classdef CheckNode < handle
    %CHECKNODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index
        connectedNodes
    end
    
    methods
        function self = CheckNode(index)
            self.index = index;
            self.connectedNodes = List();
        end
        
        function connectNodes(self, nodes)
            self.connectedNodes.insert(nodes);
            for n = nodes
                n.register(self);
            end
        end
    end
    
end

