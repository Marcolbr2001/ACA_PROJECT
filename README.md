# XOHW-24-?-Registration
## Info & Description

|                         | Information   |
| -------------           | ------------- |
| Team Number             | AOHW-329      |
| Project Name            | AXI4 High Speed Communication for Microprocessors and RegEx Architectures  |
| YouTube's Video         | https://www.youtube.com/watch?v=APLu9YeusYE |
| Project's Repository    | https://github.com/Marcolbr2001/M_AXI_ALU      |
| University Name         | Politecnico di Milano      |
| Participant (email)     | Filippo Carloni (filippo.carloni@polimi.it)      |
| Participant (email)     | Marco La Barbera (marco.labarbera@mail.polimi.it)      |
| Participant (email)     | Giulio Lotto (giulio.lotto@mail.polimi.it)      |
| Supervisor name         | Davide Conficconi      |
| Supervisor email        | davide.conficconi@mail.polimi.it |
| Board used              | PYNQ Z2 |
| Software version        | Vivado 2023.2 |

## Description of Archive

<pre>
├─ ALU_sys_HDL                      # It contains the core project
   └─ ALU_sys_HDL_BD                # It is the Burst = 100 default implementation
   └─ Archived_Project              # The Archived project of the Burst = 100 Default implementation
   └─ Bitstream                     # The various bitstreams (50, 100, 200, 400)
   └─ HLS                           # Folder of the HLS implementation
   └─ ip_repo                       # The VHDL ip_repo used to generate ALU_sys_HD
   └─ py                            # Python script for PYNQ testing
├─ SISD                             # The ALVEARE State-Of-Art
   └─ Bitstream                     # The SISD Bitstream
   └─ HLS                           # Folder of the HLS implementation
   └─ ip_repo                       # The HLS ip_repo used to generate SISD
   └─ py                            # Python script for PYNQ testing
└─ z_history                        # The history of the entire project

</pre>

## Instructions to build and test project
   
<pre>
└─Open VITIS HLS 2023.2

└─Create HLS project

└─Type as top_function ALU_sys_HDL and add
--Type as part xc7z020clg400-1 and add
--Right click on SOURCES and then ADD SOURCE FILE
--Add core.cpp (Alu_sys_HDL->HLS->HLS_project)
--Right click onTEST BENCH and ADD TEST BENCH FILE
--Add test.cpp (Alu_sys_HDL->HLS->HLS_project)
--Click RUN C SIMULATION
--Wait for the results
--Click RUN C SYNTHESIS
--Wait for the synthesis to finish
(Optional
--Click RUN COSIMULATION
--Click on VHDL e select VIVADO XSIM and select OK
--Wait for the results)
--Click on IMPLEMENTATION
--Select VHDL and press OK
--Wait for the implementation to finish
--Click on RUN EXPORT RTL
--Select as display format Vivado, type as display name ALU_sys_HDL and click OK
--Unzip export folder created in the previous step
--Open 400 folder and copy all the files
--Open the export folder and paste the files copied in the previous step, replacing the old files
--Open Vivado 2023.2
--Create a new project named ALU_sys_HDL
--Select as target language VHDL and select ADD FILES: select all the files that are in the export folder and click OK
--Select as Board PYNQZ2 and click OK
--Once the new project is created select TOOLS->PACKAGE YOUR CURRENT PROJECT->CLICK NEXT->SELECT THE LOCATION WHERE TO SAVE THE ip_repo
--In the window Package IP click Review Package and click package IP
--Import the ip_repo created in the project
--Create block design
--Import in the block design ZYNQ processing system and RUN BLOCK AUTOMATION
--Import in the block design ALU_sys_HDL
--Add 4 HP slave
--Run connection automation specifying axi-gmem_1,2 and 3 for HP slaves 1,2 and 3
--Save bd
--create HDL wrapper
--Select the HDL wrapper as top_sim
--generate bitstream
--Copy .bit file, .tcl file (the first one), .hwh file and change their names in ALU_sys_HDL_400.bit, ALU_sys_HDL_400.tcl , ALU_sys_HDL_400.hwh and copy them
--Insert the files in the folder in the Pynq
--Open Jupiter notebook, paste the Python code following the cell order
--Run the programm
</pre>

### Step - 2

comprane un altro


> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.
