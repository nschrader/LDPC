classdef CheckNode < handle  
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
        
        function probabilityZero = calculateProbability(self, variableNode)
            v = variableNode;
            probabilityZero = 0; % rij(0)
            for vv = self.connectedNodes.iterator()
                if vv == v
                    continue
                end
                probabilityZero = probabilityZero * (1-2*vv.probabilityOne);
            end
            probabilityZero = 0.5*probabilityZero + 0.5;
        end
        
        function updateVariableNodes(self)
            for v = self.connectedNodes.iterator()
                probabilityZero = self.calculateProbability(v);
                probabilityOne = 1 - probabilityZero;
                v.update(probabilityZero, probabilityOne);
            end
        end
    end
    
end

