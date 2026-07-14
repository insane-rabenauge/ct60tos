// disassembly of the gcc 2.95 compiled pmmu2 code

	.text
	.globl	_init_mmu_tree
	.align	4
_init_mmu_tree:
	move    sr,-(sp)
	ori.w   #0x700,sr

	lea     -0x18(sp),sp
	movem.l d2-d7/a2-a6,-(sp)
	clr.l   0x34(sp)
	clr.l   0x38(sp)
	clr.l   d6
	clr.w   d3
	move.l  d6,-(sp)
	move.l  d6,-(sp)
	move.w  d3,-(sp)
	move.w  #0xc60b,-(sp)
	trap    #0xe
	lea     0xc(sp),sp
	move.l  0x5a4.w,d7
	btst    #0,d0
	beq.b   .lbl_002
	tst.l   d7
	beq.b   .lbl_002
	move.l  d7,d0
	addi.l  #0xffefe000,d0
	move.l  d0,0x5a4.w
	move.l  d7,d6
	addi.l  #0xfff00000,d6
	move.l  d6,0x38(sp)
	movea.l #0xe00000,a5
	movea.l d6,a0
	moveq   #0x1,d2
	swap    d2
.lbl_001:
	move.l  (a5)+,(a0)+
	move.l  (a5)+,(a0)+
	move.l  (a5)+,(a0)+
	move.l  (a5)+,(a0)+
	subq.l  #0x1,d2
	bne.b   .lbl_001
	addi.l  #0xffffe000,d6
	move.l  d6,0x34(sp)
	bra.b   .lbl_003
.lbl_002:
	clr.l   d6
.lbl_003:
	tst.l   d7
	beq.b   .lbl_004
	move.l  0x5a4.w,d5
	bra.b   .lbl_005
.lbl_004:	
	move.l  0x42e.w,d5
.lbl_005:	
	addi.l  #0xfffb6000,d5
	addi.l  #0x1fff,d5
	andi.w  #0xe000,d5
	movea.l d5,a6
	adda.l  #0x48000,a6
	move.l  d5,0x30(sp)
	movea.l d5,a5
	lea     0x200(a5),a5
	movea.l d5,a0
	lea     0x2400(a0),a0
	move.l  0x42e.w,0x3c(sp)
	clr.l   d3
	tst.l   d7
	beq.b   .lbl_006
	move.l  d5,0x5a4.w
.lbl_006:
	clr.l   d0
.lbl_007:	
	moveq   #0x10,d1
	cmp.l   d0,d1
	bcs.w   .lbl_032
	lea     0x3(a5),a2
	movea.l 0x30(sp),a1
	addq.l  #0x4,0x30(sp)
	move.l  a2,(a1)+
	lea     0.w,a2
	movea.l d0,a4
	move.l  a4,d1
	moveq   #0x19,d2
	lsl.l   d2,d1
	movea.l d1,a4
	addq.l  #0x1,d0
	move.l  d0,0x2c(sp)
.lbl_008:	
	lea     0x3(a0),a1
	move.l  a1,(a5)+
	move.l  a2,d0
	moveq   #0x12,d1
	lsl.l   d1,d0
	move.l  a4,d2
	add.l   d0,d2
	movea.l d0,a1
	cmp.l   0x3c(sp),d2
	bcc.b   .lbl_012
	clr.l   d1
	move.l  a2,d4
	addq.l  #0x1,d4
	move.l  d2,d0
.lbl_009:	
	cmp.l   d0,d5
	bhi.b   .lbl_010
	cmpa.l  d0,a6
	bls.b   .lbl_010
	moveq   #0x45,d2
	add.l   d3,d2
	move.l  d2,(a0)+
	bra.b   .lbl_011
.lbl_010:	
	movea.l d3,a1
	addq.l  #0x1,a1
	move.l  a1,(a0)+
.lbl_011:	
	addi.l  #0x2000,d3
	addi.l  #0x2000,d0
	addq.l  #0x1,d1
	moveq   #0x1f,d2
	cmp.l   d1,d2
	bcc.b   .lbl_009
	bra.w   .lbl_031
.lbl_012:	
	move.l  d2,d0
	addi.l  #0xff200000,d0
	cmpi.l  #0xfffff,d0
	bhi.b   .lbl_017
	clr.l   d1
	move.l  a2,d4
	addq.l  #0x1,d4
	move.l  d2,d0
.lbl_013:	
	cmpi.l  #0xeeffff,d0
	bhi.b   .lbl_015
	tst.l   d6
	beq.b   .lbl_014
	movea.l 0x38(sp),a1
	addq.l  #0x5,a1
	move.l  a1,(a0)+
	addi.l  #0x2000,0x38(sp)
	bra.b   .lbl_016
.lbl_014:	
	movea.l d3,a2
	addq.l  #0x5,a2
	move.l  a2,(a0)+
	bra.b   .lbl_016
.lbl_015:	
	moveq   #0x41,d2
	add.l   d3,d2
	move.l  d2,(a0)+
.lbl_016:	
	addi.l  #0x2000,d3
	addi.l  #0x2000,d0
	addq.l  #0x1,d1
	moveq   #0x1f,d2
	cmp.l   d1,d2
	bcc.b   .lbl_013
	bra.w   .lbl_031
.lbl_017:	
	move.l  d2,d0
	addi.l  #0xff100000,d0
	cmpi.l  #0xfffff,d0
	bhi.b   .lbl_024
	clr.l   d1
	move.l  a2,d4
	addq.l  #0x1,d4
	lea     (-0xfc0000,a4,a1.l),a3
	lea     (-0xfa0000,a4,a1.l),a2
	lea     (-0xf10000,a4,a1.l),a1
.lbl_018:	
	cmpa.l  #0x8ffff,a1
	bhi.b   .lbl_019
	moveq   #0x41,d0
	add.l   d3,d0
	bra.b   .lbl_022
.lbl_019:	
	cmpa.l  #0x1ffff,a2
	bhi.b   .lbl_020
	moveq   #0x45,d2
	add.l   d3,d2
	move.l  d2,(a0)+
	bra.b   .lbl_023
.lbl_020:	
	cmpa.l  #0x37fff,a3
	bhi.b   .lbl_021
	clr.l   (a0)+
	bra.b   .lbl_023
.lbl_021:	
	move.l  d3,d0
	addi.l  #0xc1,d0
.lbl_022:	
	move.l  d0,(a0)+
.lbl_023:	
	addi.l  #0x2000,d3
	lea     0x2000(a3),a3
	lea     0x2000(a2),a2
	lea     0x2000(a1),a1
	addq.l  #0x1,d1
	moveq   #0x1f,d2
	cmp.l   d1,d2
	bcc.b   .lbl_018
	bra.b   .lbl_031
.lbl_024:	
	tst.l   d7
	beq.b   .lbl_029
	cmpi.l  #0xffffff,d2
	bls.b   .lbl_029
	cmp.l   d2,d7
	bls.b   .lbl_029
	tst.l   d6
	beq.b   .lbl_026
	cmp.l   d2,d6
	bhi.b   .lbl_026
	clr.l   d1
	move.l  a2,d4
	addq.l  #0x1,d4
.lbl_025:	
	clr.l   (a0)+
	addi.l  #0x2000,d3
	addq.l  #0x1,d1
	moveq   #0x1f,d0
	cmp.l   d1,d0
	bcc.b   .lbl_025
	bra.b   .lbl_031
.lbl_026:	
	clr.l   d1
	move.l  a2,d4
	addq.l  #0x1,d4
	move.l  a4,d0
	add.l   a1,d0
.lbl_027:	
	moveq   #0x21,d2
	cmp.l   d0,d5
	bhi.b   .lbl_028
	cmpa.l  d0,a6
	bls.b   .lbl_028
	moveq   #0x45,d2
.lbl_028:	
	add.l   d3,d2
	move.l  d2,(a0)+
	addi.l  #0x2000,d3
	addi.l  #0x2000,d0
	addq.l  #0x1,d1
	moveq   #0x1f,d2
	cmp.l   d1,d2
	bcc.b   .lbl_027
	bra.b   .lbl_031
.lbl_029:	
	clr.l   d1
	move.l  a2,d4
	addq.l  #0x1,d4
.lbl_030:	
	clr.l   (a0)+
	addi.l  #0x2000,d3
	addq.l  #0x1,d1
	moveq   #0x1f,d0
	cmp.l   d1,d0
	bcc.b   .lbl_030
.lbl_031:	
	movea.l d4,a2
	moveq   #0x7f,d1
	cmp.l   a2,d1
	bcc.w   .lbl_008
	bra.b   .lbl_033
.lbl_032:	
	movea.l 0x30(sp),a1
	addq.l  #0x4,0x30(sp)
	clr.l   (a1)+
	addq.l  #0x1,d0
	move.l  d0,0x2c(sp)
.lbl_033:	
	move.l  0x2c(sp),d0
	moveq   #0x7f,d1
	cmp.l   d0,d1
	bcc.w   .lbl_007
	tst.l   d6
	beq.b   .lbl_035
	lea     0.w,a5
	movea.l 0x34(sp),a0
	move.l  #0x200,d2
.lbl_034:	
	move.l  (a5)+,(a0)+
	move.l  (a5)+,(a0)+
	move.l  (a5)+,(a0)+
	move.l  (a5)+,(a0)+
	subq.l  #0x1,d2
	bne.b   .lbl_034
.lbl_035:	

	cpusha  bc
	pflusha 
	movec   d5,urp
	movec   d5,srp
	move.l  #0x403fe020,d0
	movec   d0,itt1
	movec   d0,dtt1
	move.l  #0x807fe040,d0
	movec   d0,itt0
	movec   d0,dtt0
	move.l  #0xc210,d0
	movec   d0,tc

	tst.l   d6			// tos in ram?
	beq.b   .lbl_038
	movea.l 0x5a0.w,a0		// load cookie jar
	bra.b   .lbl_037
.lbl_036:	
	addq.l  #0x8,a0
.lbl_037:	
	tst.l   a0
	beq.b   .lbl_038
	tst.l   (a0)
	bne.b   .lbl_036
	move.l  (a0),0x8(a0)
	move.l  0x4(a0),0xc(a0)
	move.l  #0x504d4d55,(a0)	// PMMU
	move.l  d5,0x4(a0)
.lbl_038:	
	move.l  d6,d0
	movem.l (sp)+,d2-d7/a2-a6
	lea     0x18(sp),sp
	move    (sp)+,sr
	rts
