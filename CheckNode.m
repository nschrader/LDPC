classdef CheckNode
    %CHECKNODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        connectedNodes
    end
    
    methods
        function self = CheckNode(connectedNodes)
            self.connectedNodes = connectedNodes;
        end
        
        function factory = fromMatrixRow(row)
            cNodes = [];
            vNodes = [];
            for r = row
                vNodes = [vNodes CheckNodes(cNodes)];
            end
            factory = vNodes;
        end
    end
    
end

