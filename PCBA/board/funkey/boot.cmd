setenv initrd_high 0xffffffff
setenv bootargs console=ttyS0,115200 root=/dev/ram0 rw panic=5 quiet
bootm 0x40000000
