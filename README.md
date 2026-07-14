This is a work in progress of rebasing mikro's 1.03e to insane's 1.05 CT60 TOS.
DO NOT USE UNTIL FURTHER NOTICE

CT60 boot 1.05 - 20260714 - modified by insane/tSCc

Contact me insane.atari@gmail.com - http://insane.tscc.de

Please read out your ABE+SDR with abesdr.tos BEFORE Flashing a new TOS.
I've had reports of the ABE+SDR IDs being gone after Flashing.
If you have an ID of FFFFFFFF your ABE+SDR ID is not programmed.
This has no negative impact!

If you have an ID which is not listed in abesdr.tos then please contact me!

Use either CT60tosA.bin or CT60tosB.bin if you have problems.
There shouldn't be any difference to non-SV users.
For some SV users CT60tosA works, for others CT60tosB.

Check ftp://untergrund.net/users/insane/atari/autoexec.zip for a nice boot menu!

CT60 Setup Changelog since v1.1
- exit and restart does a cold boot after changing the cpu_freq
- fixed grey vertical bar on redraw
- modified video setting
- uses 80x30 on VGA instead of 80x25 (Detects Y size via Line-A)
- fixed "Press DEL to enter setup" positioning on VGA + RGB-Overscan
- halved CTCM speed detected and supported
- added support for CT60_CACHE_DELAY so that you can disable that 5s delay mode
- modified menu selection - now it skips empty entries
- fixed scrolling up in forms (f.e. NVRAM)
- fixed ABE and SDR display when no revision is available
- redraw menu after going back to the menu selector
- added additional CT60 parameters
- added additional NVRAM parameters
- added exit to diagnostics if they are in ROM
- forces caches to on so that the cpu speed can be measured correctly
- rewrote setup loader for stability improvements

Boot Changelog since v1.03c
- modified the sources for cross compilation on PC (huge thanks to mikro!)
- added fixes from 1.03c-PM (background color ESC-c)
- added fixes from 1.03d (flash chip id is 16bit, not 32bit)
- added v_pline fix from 1.04alpha
- added Patrice Mandin's CT60 Setup, enhanced it and bugfixed the setup loader
- added CTPCI IDE Port support (and nothing else regarding PCI!)
- limit CTPCI memory space to 0xC0000000-0xE0000000
  This way Ethernat+SuperVidel+CTPCI work
- fixed boot modecode interlace setting when boot monitor != running monitor
- fixed VT52 emulator: ESC KoJEd all destroyed the saved cursor pos
- removed ataboot Linux Atari Bootstrap from ROM
  as it can't boot the current Linux/m68k Kernel
  Selecting Linux will launch C:\BOOTSTRA.TOS
- New Atari Logo Display Routine which doesn't use the Blitter (for SV Users)
- 20190306: Changed CTPCI IDE Config String in Setup
- 20260714: rebase with mikro's ct60 tos 1.03e
- TOS1.03e: Backport some changes from CTPCI TOS 2.02 (there are still some interesting bits left out but I wanted to minimise the risk of introducing new bugs)
- TOS1.03e: Fix the weird state when ST/TT RAM test finishes: https://www.atari-forum.com/viewtopic.php?t=35035
- TOS1.03e: Fix slowness reported in CT60 TOS when using emulated instructions: https://www.dhs.nu/bbs-ct60/index.php?request=12235
- 20260714: Removed the Boot Logo so now TOS doesn't try to detect internal and external video clocks when SuperVidel is present
- 20260714: Fix the inverted double lines / interlace flag when switching between RGB and VGA
- 20260714: Remove the infamous 5s cache delay code so people can stop wondering why Quake runs at 1 FPS
- 20260714: Fix CAS/CAS2 emulation: https://atari-forum.com/viewtopic.php?p=467731#p467731
- 20260714: Don't clear FPCR register when processing FP exceptions (done by Holger Schulz's 060sp for some reason which got importend into FreeMiNT and from FreeMiNT to CT60 TOS; now it is fixed everywhere)
- 20260714: Fix FPSP bug fetching an immediate single-precision constant: https://atari-forum.com/viewtopic.php?p=467696#p467696

Notes:
  Now the whole supervisor stack is moved into TT RAM so other functions should be faster (e.g. AES) and hopefully more stable (the stack is much bigger now)
  This has one important consequence: you must install 060sp.prg when booting into FreeMiNT / MagiC!
  FreeMiNT is preconfigured that way by default in recent snapshots but if you have your own mint.cnf, you must add that line there.
  Even though it seems like a downgrade/regression, what CT60 TOS did was a dirty hack which had to be removed.

