.include 4_NOR.sub
.include NOT.sub

.subckt 4_OR nodeA nodeB nodeC nodeD output vdd gnd

X1 nodeA nodeB nodeC nodeD node1 vdd gnd 4_NOR
X2 node1 output vdd gnd NOT

.ends 4_OR