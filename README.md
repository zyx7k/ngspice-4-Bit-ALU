## Description <br>

This is a project which demonstrates a 4-Bit ALU coded in Ngspice which was made as a part of the VLSI-Design course taken by me in the Monsoon 2023 Semester. 

### Overview

The implementation can perform four important operations on two 4-Bit Numbers:

>1. Addition
>2. Subtraction
>3. Comparator
>4. ANDing both numbers

### Inputs
The input from the user side are the two 4-Bit Numbers. Find below the select line combinations and their respective functions to help you select your desired operation you would like to test:<br>
>1. Setting S1 = 0 and S0 = 0 performs Addition Operation.
>2. Setting S1 = 0 and S0 = 1 performs Subtraction Operation.
>3. Setting S1 = 1 and S0 = 0 performs Comparator Operation.
>4. Setting S1 = 1 and S0 = 1 performs ANDing Operation.

### Running the project
To run the project on your computer, you must have ngspice installed on your machine.<br>

Clone the repo to your local machine and go to the directory.<br>

Say you want to test the addition operation, then edit the **alu.sp** file and uncomment the appropriate lines both at the select lines section and in the plots section of the code.<br>

Once done, run the following command in your terminal:
```
ngspice alu.sp
```

