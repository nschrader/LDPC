classdef CheckNode < handle
    %CHECKNODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        index
        connectedNodes
    end
    
    methods
        function self = CheckNode(index, connectedNodes)
            self.index = index;
            self.connectedNodes = List();
            self.connectedNodes.append(connectedNodes);
        end
    end
    
end

