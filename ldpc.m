function decodeword = ldpc(codeword, parityMatrix)
    C = codeword;
    H = transpose(parityMatrix);
    vNodes = List();
    for ci = C
        vNodes.append(VariableNode(vNodes.size(), ci));
    end

    cNodes = List();
    for hi = H
        connectedNodes = vNodes.get(hi==1);
        c = CheckNode(cNodes.size(), connectedNodes);
        cNodes.append(c);
        c.updateVariableNodes();
    end

    decodeword = arrayfun(@(v) v.decide(), vNodes.iterator());
end

