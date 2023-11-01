.include NOT.sub

.subckt XOR nodeA nodeB output vdd gnd

X1 nodeA nodeA_inv vdd gnd NOT 
X2 nodeB nodeB_inv vdd gnd NOT 

Mn1 output nodeA node3 node3 CMOSN W = {wn1} L = {ln1}
    + AS = {5*wn1*LAMBDA} PS = {10*LAMBDA + 2*wn1} AD = {5*wn1*LAMBDA} PD = {10*LAMBDA + 2*wn1}

Mn2 node3 nodeB gnd gnd CMOSN W = {wn2} L = {ln2}
    + AS = {5*wn2*LAMBDA} PS = {10*LAMBDA + 2*wn2} AD = {5*wn2*LAMBDA} PD = {10*LAMBDA + 2*wn2}

Mn3 output nodeA_inv node4 node4 CMOSN W = {wn1} L = {ln1}
    + AS = {5*wn1*LAMBDA} PS = {10*LAMBDA + 2*wn1} AD = {5*wn1*LAMBDA} PD = {10*LAMBDA + 2*wn1}

Mn4 node4 nodeB_inv gnd gnd CMOSN W = {wn2} L = {ln2}
    + AS = {5*wn2*LAMBDA} PS = {10*LAMBDA + 2*wn2} AD = {5*wn2*LAMBDA} PD = {10*LAMBDA + 2*wn2}

Mp1 node1 nodeA_inv vdd vdd CMOSP W = {wp1} L = {lp1}
    + AS = {5*wp1*LAMBDA} PS = {10*LAMBDA + 2*wp1} AD = {5*wp1*LAMBDA} PD = {10*LAMBDA + 2*wp1}

Mp2 output nodeB node1 node1 CMOSP W = {wp2} L = {lp2}
    + AS = {5*wp2*LAMBDA} PS = {10*LAMBDA + 2*wp2} AD = {5*wp2*LAMBDA} PD = {10*LAMBDA + 2*wp2}

Mp3 node2 nodeA vdd vdd CMOSP W = {wp1} L = {lp1}
    + AS = {5*wp1*LAMBDA} PS = {10*LAMBDA + 2*wp1} AD = {5*wp1*LAMBDA} PD = {10*LAMBDA + 2*wp1}

Mp4 output nodeB_inv node2 node2 CMOSP W = {wp2} L = {lp2}
    + AS = {5*wp2*LAMBDA} PS = {10*LAMBDA + 2*wp2} AD = {5*wp2*LAMBDA} PD = {10*LAMBDA + 2*wp2}    

.ends XOR

