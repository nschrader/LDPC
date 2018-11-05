H = [
        [0, 1, 0, 1, 1, 0, 0, 1]
        [1, 1, 1, 0, 0, 1, 0, 0]
        [0, 0, 1, 0, 0, 1, 1, 1]
        [1, 0, 0, 1, 1, 0, 1, 0]
    ];

C = [1, 0, 0, 1, 0, 1, 0, 1];

vNodes = List();
for ci = C
    vNodes.append(VariableNode(vNodes.size(), ci));
end

cNodes = List();
for hi = H'
    connectedNodes = vNodes.get(hi==1);
    cNodes.append(CheckNode(cNodes.size(), connectedNodes));
end

