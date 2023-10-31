.subckt COMPARATOR A0 A1 A2 A3 B0 B1 B2 B3 A_gt_B A_eq_B A_st_B vdd gnd

*A_gt_B : means A greater than B
*A_eq_B means A equal to B
*A_st_B means A smaller than B

XN1 A0 B0 node0 vdd gnd XNOR
XN2 A1 B1 node1 vdd gnd XNOR
XN3 A2 B2 node2 vdd gnd XNOR
XN4 A3 B3 node3 vdd gnd XNOR
X1 node0 node1 node2 node3 A_eq_B vdd gnd 4_AND

NOT1 A0 A0_inv vdd gnd NOT
NOT2 A1 A1_inv vdd gnd NOT
NOT3 A2 A2_inv vdd gnd NOT
NOT4 A3 A3_inv vdd gnd NOT
NOT5 B0 B0_inv vdd gnd NOT
NOT6 B1 B1_inv vdd gnd NOT
NOT7 B2 B2_inv vdd gnd NOT
NOT8 B3 B3_inv vdd gnd NOT

G1 A3 B3_inv node4 vdd gnd AND
G2 A2 B2_inv node3 node5 vdd gnd 3_AND
G3 A1 B1_inv node3 node2 node6 vdd gnd 4_AND
G4 A0 B0_inv node3 node2 node1 node7 vdd gnd 5_AND 
G5 node4 node5 node6 node7 A_gt_B vdd gnd 4_OR

G6 B3 A3_inv node8 vdd gnd AND
G7 B2 A2_inv node3 node9 vdd gnd 3_AND
G8 B1 A1_inv node3 node2 node10 vdd gnd 4_AND
G9 B0 A0_inv node3 node2 node1 node11 vdd gnd 5_AND 
G10 node8 node9 node10 node11 A_st_B vdd gnd 4_OR

.ends COMPARATOR