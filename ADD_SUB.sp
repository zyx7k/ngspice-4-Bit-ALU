.subckt ADD_SUB M A0 A1 A2 A3 B0 B1 B2 B3 S0 S1 S2 S3 carry vdd gnd

XOR1 M B0 I0 vdd gnd XOR
FA1 A0 I0 M S0 C1 vdd gnd FA

XOR2 M B1 I1 vdd gnd XOR
FA2 A1 I1 C1 S1 C2 vdd gnd FA

XOR3 M B2 I2 vdd gnd XOR
FA3 A2 I2 M S2 C3 vdd gnd FA

XOR4 M B3 I3 vdd gnd XOR
FA4 A3 I3 M S3 carry vdd gnd FA
     
.ends ADD_SUB