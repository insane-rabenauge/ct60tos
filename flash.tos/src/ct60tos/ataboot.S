	.text
	
	.globl ataboot

ataboot:
	lea	null(pc),a0
	pea	(a0)
	pea	(a0)
	pea	ataname
	move.w	#0,-(sp)
	move.w	#0x4b,-(sp)
	trap	#1
	lea	16(sp),sp
	jmp	loadtos_halt

null:	.long	0
ataname:
	.asciz	"C:\\BOOTSTRA.TOS"
	.align	2
