This is a work in progress of rebasing mikro's 1.03e to insane's 1.05 CT60 TOS.
DO NOT USE UNTIL FURTHER NOTICE

CT60 boot 1.05 - 20260715 - modified by insane/tSCc

Contact me insane.atari@gmail.com - http://insane.tscc.de

Check https://github.com/insane-rabenauge/insaneboot for a nice boot menu!

Boot Changelog since v1.03c
- 201902xx: modified the sources for cross compilation on PC (huge thanks to mikro!)
- 201902xx: added fixes from 1.03c-PM (background color ESC-c)
- 201902xx: added fixes from 1.03d (flash chip id is 16bit, not 32bit)
- 201902xx: added v_pline fix from 1.04alpha
- 201902xx: added Patrice Mandin's CT60 Setup, enhanced it and bugfixed the setup loader
- 201902xx: CT60Setup: exit and restart does a cold boot after changing the cpu_freq
- 201902xx: CT60Setup: fixed grey vertical bar on redraw
- 201902xx: CT60Setup: modified video setting
- 201902xx: CT60Setup: uses 80x30 on VGA instead of 80x25 (Detects Y size via Line-A)
- 201902xx: CT60Setup: fixed "Press DEL to enter setup" positioning on VGA + RGB-Overscan
- 201902xx: CT60Setup: halved CTCM speed detected and supported
- 201902xx: CT60Setup: added support for CT60_CACHE_DELAY so that you can disable that 5s delay mode
- 201902xx: CT60Setup: modified menu selection - now it skips empty entries
- 201902xx: CT60Setup: fixed scrolling up in forms (f.e. NVRAM)
- 201902xx: CT60Setup: fixed ABE and SDR display when no revision is available
- 201902xx: CT60Setup: redraw menu after going back to the menu selector
- 201902xx: CT60Setup: added additional CT60 parameters
- 201902xx: CT60Setup: added additional NVRAM parameters
- 201902xx: CT60Setup: added exit to diagnostics if they are in ROM
- 201902xx: CT60Setup: forces caches to on so that the cpu speed can be measured correctly
- 201902xx: CT60Setup: rewrote setup loader for stability improvements
- 201902xx: added CTPCI IDE Port support (and nothing else regarding PCI!)
- 201902xx: limit CTPCI memory space to 0xC0000000-0xE0000000 - This way Ethernat+SuperVidel+CTPCI work
- 201902xx: fixed boot modecode interlace setting when boot monitor != running monitor
- 201902xx: fixed VT52 emulator: ESC KoJEd all destroyed the saved cursor pos
- 201902xx: removed ataboot Linux Atari Bootstrap from ROM - Selecting Linux will launch C:\BOOTSTRA.TOS
- 201902xx: New Atari Logo Display Routine which doesn't use the Blitter (for SV Users)
- 20190306: Changed CTPCI IDE Config String in Setup
- 20260714: rebase with mikro's ct60 tos 1.03e
- 20260714: TOS1.03e: Backport some changes from CTPCI TOS 2.02 (there are still some interesting bits left out but I wanted to minimise the risk of introducing new bugs)
- 20260714: TOS1.03e: Fix the weird state when ST/TT RAM test finishes: https://www.atari-forum.com/viewtopic.php?t=35035
- 20260714: TOS1.03e: Fix slowness reported in CT60 TOS when using emulated instructions: https://www.dhs.nu/bbs-ct60/index.php?request=12235
- 20260714: TOS1.03e: Fix CAS/CAS2 emulation: https://atari-forum.com/viewtopic.php?p=467731#p467731
- 20260714: TOS1.03e: Fix the inverted double lines / interlace flag when switching between RGB and VGA
- 20260714: TOS1.03e: Don't clear FPCR register when processing FP exceptions (done by Holger Schulz's 060sp for some reason which got importend into FreeMiNT and from FreeMiNT to CT60 TOS; now it is fixed everywhere)
- 20260714: TOS1.03e: Fix FPSP bug fetching an immediate single-precision constant: https://atari-forum.com/viewtopic.php?p=467696#p467696
- 20260714: TOS1.03e: Remove the infamous 5s cache delay code so people can stop wondering why Quake runs at 1 FPS
- 20260714: Removed the Boot Logo so now TOS doesn't try to detect internal and external video clocks when SuperVidel is present
- 20260714: CT60Setup: removed cache delay completely
- 20260715: CT60Setup: fixed 66mhz sets 133mhz on rev 6 board
- 20260715: CT60Setup: left/right modify the clock speed in 1 MHz steps

Notes:
  Now the whole supervisor stack is moved into TT RAM so other functions should be faster (e.g. AES) and hopefully more stable (the stack is much bigger now)
  This has one important consequence: you must install 060sp.prg when booting into FreeMiNT / MagiC!
  FreeMiNT is preconfigured that way by default in recent snapshots but if you have your own mint.cnf, you must add that line there.
  Even though it seems like a downgrade/regression, what CT60 TOS did was a dirty hack which had to be removed.

