classdef CheckNode < handle  
    properties
        index % only useful for debugging
        msgList
    end
    
    methods
        function self = CheckNode(index)
            self.index = index;
            self.msgList = List();
        end
        
        function send(self, source, q0, q1)
            msg = Message(source, q0, q1);
            self.msgList.append(msg);
        end
        
        function process(self)
            messages = self.msgList;
            self.msgList = List();
            
            for m = messages.iterator()
                r0 = 1; %rij(0)
                for mm = messages.iterator()
                    if mm == m
                        continue;
                    end
                    r0 = r0 * (1-2*mm.p1); % qi'j(1)
                end
                r0 = 0.5*r0 + 0.5;
                m.source.send(self, r0);
            end
        end

    end
    
end

