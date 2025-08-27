## AMBA APB Design and Verification
### AMBA
- AMBA (Advanced microcontroller bus architecture) is a widely used open-standard set of protocols, developed by ARM.
- **purpose**: To standradize the communication between various component inside the SoC.
- APB is one of common protocol of AMBA Family.
---
### what is APB Protocol?
- **APB**: Advance Peripheral Bus.
- It is a non-pipelined, simple and synchronous protocol.
- Every transfer need atleast two cycles to complete.
---
### Operating States
- **1. IDLE**: default state of APB interface.
- **2. SETUP**: PSELx is asserted. The interface remains in the SETUP state for one cycle only. And always move to **access state** in the next posedge of the clock.
- **3. ACCESS**: PENABLE is also asserted. Exit from the Access state is controlled by the PREADY Signal.
---
### Demo Video
