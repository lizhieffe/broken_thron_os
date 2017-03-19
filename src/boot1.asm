;*******************************************************************************
;       boot1.asm - A Simple Bootloader
;
;*******************************************************************************

  org       07c00h        ; we are loaded by BIOS at 0x7c00

  bits      16            ; still in 16 bit Real Mode


Start:
  cli                     ; Clear all Interrupts
  hlt                     ; halt the system

times       510 - ($ - $$) db 0 ; we have to be 512 bytes. Clear the rest of bytes with 0
dw          0xAA55        ; Boot signature
