.subckt 2_4_DECODER A0 A1 D0 D1 D2 D3 vdd gnd

NOT1 A0 A0_inverted vdd gnd NOT
NOT2 A1 A1_inverted vdd gnd NOT
AND1 A0 A1 D3 vdd gnd AND
AND2 A0_inverted A1 D2 vdd gnd AND
AND3 A0 A1_inverted D1 vdd gnd AND
AND4 A0_inverted A1_inverted D0 vdd gnd AND

.ends 2_4_DECODER