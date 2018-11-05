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
        
        function voteVariableNodes(self)
            for v = self.connectedNodes.iterator()
                sum = 0;
                for vv = self.connectedNodes.iterator()
                    if vv == v
                        continue
                    end
                    sum = sum + vv.value;
                end
                [sum v.index self.index]
                
                isPair = @(x) (mod(x, 2) == 0);
                if isPair(sum)
                    v.voteZero = v.voteZero + 1;
                else
                    v.voteOne = v.voteOne + 1;
                end
            end
        end
    end
    
end

