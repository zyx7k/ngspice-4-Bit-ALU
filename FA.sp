.subckt FA nodeA nodeB carry_in sum carry_out vdd gnd

*Full Adder

XOR1 nodeA nodeB node1 vdd gnd XOR
AND1 nodeA nodeB node2 vdd gnd AND
XOR2 carry_in node1 sum vdd gnd XOR
AND2 carry_in node1 node3 vdd gnd AND
OR1 node2 node3 carry_out vdd gnd OR

.ends FA