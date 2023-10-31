.subckt 4_1_MUX S0 S1 I0 I1 I2 I3 output vdd gnd

NOT1 S0 S0_inverted vdd gnd NOT
NOT2 S1 S1_inverted vdd gnd NOT
AND1 S0 S1 I3 node3 vdd gnd 3_AND
AND2 S0_inverted S1 I2 node2 vdd gnd 3_AND
AND3 S0 S1_inverted I1 node1 vdd gnd 3_AND
AND4 S0_inverted S1_inverted I0 node0 vdd gnd 3_AND
OR1 node0 node1 node2 node3 output vdd gnd 4_OR

.ends 4_1_MUX