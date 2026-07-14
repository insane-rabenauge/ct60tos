/* TOS 4.04 Videl patch for the CT60 board
*  Didier Mequignon 2003-2004, e-mail: aniplay@wanadoo.fr
*  Daniel Illgen    2019/02: removed fix_modecode 
*   (RGB 640x200 -> VGA 640x400 with this code, TOS4 does VGA 640x200)
*
*  This library is free software; you can redistribute it and/or
*  modify it under the terms of the GNU Lesser General Public
*  License as published by the Free Software Foundation; either
*  version 2.1 of the License, or (at your option) any later version.
*
*  This library is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
*  Lesser General Public License for more details.
*
*  You should have received a copy of the GNU Lesser General Public
*  License along with this library; if not, write to the Free Software
*  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/
	.globl	picture_boot
	.globl	fix_mono_shift

#include "vars.h"

picture_boot:
	move.l #0xA0808000,D0                         // instruction cache
	movec.l D0,CACR

	move.w #0x2300,SR                         // enable interrupts
	moveq #1,D0	//
	rts
	
fix_mono_shift:                              // Replaces "move.w #0x400,0xFFFF8266"
	movem.l D0-D2,-(SP)
	bsr .wait_vbl_8266
	clr.w 0xFFFF8266
	bsr .wait_vbl_8266
	move.w #0x400,0xFFFF8266                  // 2 colors
	movem.l (SP)+,D0-D2
	rts
.wait_vbl_8266:
	move.l _frclock,D0                        // VBL frame counter
	move.l _hz_200,D1                         // 200 Hz time base
.wv8266:
		cmp.l _frclock,D0
		bne.s .wv8266_end                // a VBL occured
		move.l _hz_200,D2
		sub.l D1,D2
		cmp.l #20,D2                      // ~100 ms time-out
		blt.s .wv8266
.wv8266_end:
	rts

