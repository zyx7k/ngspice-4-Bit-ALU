.include NAND.sub
.include NOT.sub

.subckt XNOR nodeA nodeB output vdd gnd

X1 nodeA nodeB node1 vdd gnd NAND
X2 nodeA node1 node2 vdd gnd NAND
X3 nodeB node1 node3 vdd gnd NAND
X4 node2 node3 node4 vdd gnd NAND
X5 node4 output vdd gnd NOT

.ends XNOR