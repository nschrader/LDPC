H = [
        [0, 1, 0, 1, 1, 0, 0, 1]
        [1, 1, 1, 0, 0, 1, 0, 0]
        [0, 0, 1, 0, 0, 1, 1, 1]
        [1, 0, 0, 1, 1, 0, 1, 0]
    ];

c = [1, 0, 0, 1, 0, 1, 0, 1];

vNodes = [];
for ci = c
    vNodes = [vNodes VariableNode(ci)];
end

