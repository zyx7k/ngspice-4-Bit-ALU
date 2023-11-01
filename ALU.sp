.include TSMC_180nm.txt
.include FA.sub
.include ENABLE.sp
.include 2_4_DECODER.sp
.include COMPARATOR.sp
.include AND_BLOCK.sp
.include ADD_SUB.sp

.param SUPPLY = 1.8
.param LAMBDA = 0.18u

.param wn1 = {10*LAMBDA}
.param wn2 = {10*LAMBDA}
.param ln1 = {2*LAMBDA}
.param ln2 = {2*LAMBDA}

.param wp1 = wn1
.param wp2 = wn1
.param lp1 = {LAMBDA}
.param lp2 = {LAMBDA}

.global gnd

Vdd vdd gnd 'SUPPLY'

V_in_s0 S0 gnd DC vdd
V_in_s1 S1 gnd DC vdd

V_in_a0 A0 gnd PULSE(0 1.8 0ns 100ps 100ps 20ns 40ns)
V_in_a1 A1 gnd PULSE(0 1.8 0ns 100ps 100ps 50ns 70ns)
V_in_a2 A2 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 40ns)
V_in_a3 A3 gnd PULSE(0 1.8 0ns 100ps 100ps 40ns 50ns)

V_in_b0 B0 gnd PULSE(0 1.8 0ns 100ps 100ps 10ns 20ns)
V_in_b1 B1 gnd PULSE(0 1.8 0ns 100ps 100ps 30ns 50ns)
V_in_b2 B2 gnd PULSE(0 1.8 0ns 100ps 100ps 20ns 30ns)
V_in_b3 B3 gnd PULSE(0 1.8 0ns 100ps 100ps 40ns 70ns)

X1 S0 S1 D0 D1 D2 D3 vdd gnd 2_4_DECODER
* D0 - ADD, D1- SUBTRACT, D2 - COMPARATOR, D3 - AND BLOCK

* Adder Subtractor Section ---->
X2 D0 D1 node1 vdd gnd OR
* The above node1 is used as enable block for the adder-subtractor portion
X3 node1 A0 A1 A2 A3 B0 B1 B2 B3 A0_AS A1_AS A2_AS A3_AS B0_AS B1_AS B2_AS B3_AS vdd gnd ENABLE
* A0_E, B0_E etc- can now be provided to the adder-subtractor block, M is D1
X4 D1 A0_AS A1_AS A2_AS A3_AS B0_AS B1_AS B2_AS B3_AS S0_AS S1_AS S2_AS S3_AS carry_AS vdd gnd ADD_SUB
* _AS indicated that the node belongs to ADD-SUB portion of the ALU.

* Comparator Section ---->
X5 D2 A0 A1 A2 A3 B0 B1 B2 B3 A0_C A1_C A2_C A3_C B0_C B1_C B2_C B3_C vdd gnd ENABLE
* _C indicates that the node belongs to COMPARATOR portion of the ALU.
X6 A0_C A1_C A2_C A3_C B0_C B1_C B2_C B3_C A_gt_B A_eq_B A_st_B vdd gnd COMPARATOR
* A_gt_B, A_st_B, A_st_B are the three outputs

* AND Block Section --->
X7 D3 A0 A1 A2 A3 B0 B1 B2 B3 A0_AND A1_AND A2_AND A3_AND B0_AND B1_AND B2_AND B3_AND vdd gnd ENABLE
* _AND indicates that the node belongs to the AND block of the ALU.
X8 AND_BLOCK A0_AND A1_AND A2_AND A3_AND B0_AND B1_AND B2_AND B3_AND AB_0 AB_1 AB_2 AB_3 vdd gnd AND_BLOCK
* AB_0, AB_1, AB_2 & AB_3 are the ouputs.

.tran 1n 800n

.control
    run
    set color0 = rgb:f/f/e
    set color1 = black
    print v(A0) v(B0)+2 v(AB_0)+4 v(A1)+6 v(B1)+8 V(AB_1)+10 V(A2)+12 V(B2)+14 V(AB_2)+16 V(A3)+18 V(B3)+20 V(AB_3)+22      
    .end
.endc