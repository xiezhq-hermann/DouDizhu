## Banking System Validation Plan

![BankingSystemLogin](C:\Users\xiezh\Documents\MATLAB\DouDizhu\doc\BankingSystemLogin.png)

![BankingSystemLogined](C:\Users\xiezh\Documents\MATLAB\DouDizhu\doc\BankingSystemLogined.png)

The above pictures are the demos of the banking system interface. These validation will be arranged for the interface and inter logics:

- First iteration:
  - Checkout the state machine model for implementation and try other tools to verify the correctness if possible (UPPAL is suitable here)
- The state machine used can not describe all kind of interaction, then we'll try larger searching space for no obvious problems:
  - Iterating different kinds of numbers as inputs
  - Iterating trivial numbers and big number to be inputs
  - Enumerating the different push sequences based on the state machine
    - Specifically, write scripts to make combination of pushing different buttons of different times.
- Finally, the test will be about the external interface with staffs outside the running system, and to keep the interface simple enough to be obvious correct.