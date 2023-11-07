.include TSMC_180nm.txt
.include FA.sub
.include ENABLE.sub
.include 2_4_DECODER.sub
.include COMPARATOR.sub
.include AND_BLOCK.sub
.include ADD_SUB.sub

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

* Input mode for Selecting AND Block
*V_in_s0 S0 gnd DC 1.8
* V_in_s1 S1 gnd DC 1.8

* Input mode for Selecting COMPARATOR Block
* V_in_s0 S0 gnd DC 0
*V_in_s1 S1 gnd DC 1.8

* Input mode for Selecting SUBTRACATION Block
*V_in_s0 S0 gnd DC 1.8
* V_in_s1 S1 gnd DC 0

* Input mode for Selecting ADDITION Block
 V_in_s0 S0 gnd DC 0
 V_in_s1 S1 gnd DC 0

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
X8 A0_AND A1_AND A2_AND A3_AND B0_AND B1_AND B2_AND B3_AND AB_0 AB_1 AB_2 AB_3 vdd gnd AND_BLOCK
* AB_0, AB_1, AB_2 & AB_3 are the ouputs.

.tran 1n 300n

.control
    run
    set color0 = rgb:f/f/e
    set color1 = white

    * Below is plot of the AND BLOCK ----->
    * plot v(A0) v(A1)+2 v(A2)+4 v(A3)+6 v(B0)+8 v(B1)+10 v(B2)+12 v(B3)+14 v(AB_0)+16 V(AB_1)+18 V(AB_2)+20 V(AB_3)+22

    * Below is the plot of the COMPARATOR BLOCK (numbers is A3A2A1A0 and B3B2B1B0) ----->
    * plot v(A0) v(A1)+2 v(A2)+4 v(A3)+6 v(B0)+8 v(B1)+10 v(B2)+12 v(B3)+14 V(A_eq_B)+16 V(A_st_B)+18 V(A_gt_B)+20

    * Below is the plot of the ADDITION-SUBTRACTION BLOCK (numbers is A3A2A1A0 and B3B2B1B0) ----->
    *plot v(A0) v(A1)+2 v(A2)+4 v(A3)+6 v(B0)+8 v(B1)+10 v(B2)+12 v(B3)+14 V(S0_AS)+16 V(S1_AS)+18 V(S2_AS)+20 V(S3_AS)+22 V(carry_AS)+24

    .end
.endc
