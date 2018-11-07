classdef VariableNode < handle  
    properties
        index % only useful for debugging
        P % Pi
        msgList
    end
    
    methods
        function self = VariableNode(index, value)
            self.index = index;
            self.P = value;
            self.msgList = List();
        end
        
        function send(self, source, r0)
            msg = Message(source, r0, 1-r0);
            self.msgList.append(msg);
        end
        
        function bit = process(self)
            messages = self.msgList;
            self.msgList = List();
            
            for m = messages.iterator()
                q0 = 1-self.P; %qij(0)
                q1 = self.P; %qij(1)
                
                % no boostrap
                if ~isnan(m.p0)
                    for mm = messages.iterator()
                        if mm == m
                            continue;
                        end
                        q0 = q0 * mm.p0; % ri'j(0)
                        q1 = q1 * mm.p1; % ri'j(1)
                    end
                    K = 1/(q0 + q1); % Ki
                    q0 = q0 * K;
                    q1 = q1 * K;
                end
                
                m.source.send(self, q0, q1);
            end
            
            % boostrap
            if isnan(m.p0)
                Q0 = q0;
                Q1 = q1;
            else
                Q0 = q0 * m.p0; %rij(0)
                Q1 = q1 * m.p1; %rij(1)
            end
            bit = double(Q1>Q0); % Qi(1) Qi(0)
        end
    end
    
end

