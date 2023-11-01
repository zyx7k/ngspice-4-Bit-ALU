.include 4_NAND.sub
.include NOT.sub

.subckt 4_AND nodeA nodeB nodeC nodeD output vdd gnd

X1 nodeA nodeB nodeC nodeD node1 vdd gnd 4_NAND
X2 node1 output vdd gnd NOT

.ends 4_AND