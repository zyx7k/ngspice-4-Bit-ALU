.include XOR.sub
.include NOT.sub

.subckt XNOR nodeA nodeB output vdd gnd

X1 nodeA nodeB node1 vdd gnd XOR
X2 node1 output vdd gnd NOT

.ends XNOR