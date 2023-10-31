.include 3_NAND.sub
.include NOT.sub

.subckt 3_AND nodeA nodeB nodeC output vdd gnd

X1 nodeA nodeB nodeC node1 vdd gnd 3_NAND
X2 node1 output vdd gnd NOT

.ends 3_AND