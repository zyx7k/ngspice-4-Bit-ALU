.subckt NAND nodeA nodeB output vdd gnd

Mn1 output nodeB node4 gnd CMOSN W = {wn1} L = {ln1}
    + AS = {5*wn1*LAMBDA} PS = {10*LAMBDA + 2*wn1} AD = {5*wn1*LAMBDA} PD = {10*LAMBDA + 2*wn1}

Mn2 node4 nodeA gnd gnd CMOSN W = {wn2} L = {ln2}
    + AS = {5*wn2*LAMBDA} PS = {10*LAMBDA + 2*wn2} AD = {5*wn2*LAMBDA} PD = {10*LAMBDA + 2*wn2}

Mp1 output nodeA vdd vdd CMOSP W = {wp1} L = {lp1}
    + AS = {5*wp1*LAMBDA} PS = {10*LAMBDA + 2*wp1} AD = {5*wp1*LAMBDA} PD = {10*LAMBDA + 2*wp1}

Mp2 output nodeB vdd vdd CMOSP W = {wp2} L = {lp2}
    + AS = {5*wp2*LAMBDA} PS = {10*LAMBDA + 2*wp2} AD = {5*wp2*LAMBDA} PD = {10*LAMBDA + 2*wp2}

.ends NAND