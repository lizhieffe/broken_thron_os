# Bootloader

## Real Mode
x86 processor boots into a 16 bit environment.
- Uses the native segment:offset memory model.
- Is limited to 1 MB (+64k) of memory.
- No Virtual Memory or Memory Protection.

### Segment:offset Memory Model
A Segment is simply a part of a whole. In our case, A segment is a section of
memory. An offset is a number that is added to a base number.

*Absolute (Exact) Memory Address = (Segment Address * 16(decimal)) + Offset*

### Segment:offset Model Problem
By changing the segment and offset values, you can find different segment:offset
pairs will yeld the same absolute address. This means, in Real Mode, you can
access every byte in memory, over 4,000 different ways, being able to overlap
segments that could potentally currupt that area of memory without you knowing.
This is what is ment by **Real Mode not having any Memory Protection**.

### Registers
- CS (Code Segment) - Stores base segment address for code
- DS (Data Segment) - Stores base segment address for data
- ES (Extra Segment) - Stores base segment address for anything
- SS (Stack Segment) - Stores base segment address for the stack

## Protected Mode (PMode)
It use 32 bit registers, and access up to 4GB of RAM. It allows Memory
Protection through the use of a **Descriptor Tables** that describe the memory
layout.

- Absolutley no interrupts will be avilable. You will need to write them
  yourself. The use of any interrupt--hardware or software will cause a Triple
  Fault
- Once you switch into pmode, the *slightest* mistake will cause a Triple Fault.
  Be carefull.
- PMode requires the use of Descriptor Tables, such as the GDT, LDT, and IDTs.
- PMode gives you access to 4 GB of Memory, With Memory Protection
- Segment:Offset Addressing is used along with Linear Addressing
- Access and use of 32 bit registers
