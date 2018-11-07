function decodeword = ldpc(codeword, parityMatrix)
    C = codeword;
    H = transpose(parityMatrix);
    
    vNodes = List();
    for ci = C
        vNodes.append(VariableNode(vNodes.size(), ci));
    end

    cNodes = List();
    for hi = H
        c = CheckNode(cNodes.size());
        cNodes.append(c);
        
        % bootstrap message flow
        connectedNodes = vNodes.get(hi==1);
        arrayfun(@(v) v.send(c, NaN(1)), connectedNodes);
    end
    
    iterations = 0;
    while true
        arrayfun(@(c) c.process(), cNodes.iterator());
        decodeword = arrayfun(@(v) v.process(), vNodes.iterator());
        
        symptom = mod(parityMatrix*decodeword', 2);
        if sum(symptom) == 0
            break;
        end
               
        iterations = iterations + 1;
        if iterations >= length(parityMatrix(:)) % seems reasonalbe
            MException('', 'Iteration limit exceeded').throw(); 
        end
            
    end
    
end

