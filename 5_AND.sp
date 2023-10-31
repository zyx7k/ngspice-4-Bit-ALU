.include 5_NAND.sub
.include NOT.sub

.subckt 5_AND nodeA nodeB nodeC nodeD nodeE output vdd gnd

X1 nodeA nodeB nodeC nodeD nodeE node1 vdd gnd 4_NAND
X2 node1 output vdd gnd NOT

.ends 5_AND