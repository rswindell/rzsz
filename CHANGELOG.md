# Changelog

## [1991-12-07] RZ 3.17 / SZ 3.18

This release included this `README` update:
```
Oct 30 1991: Changed shar programs to aid net.digestion.
Rs and sz now use the same version number.
```
Interesting that RZ and SZ actually have different version numbers in this
release.

  - SZ Received ZFERR is treated the same as ZSKIP (again?).

## [1991-10-30] RZ 3.17 / SZ 3.17

  - One small change to read /dev/tty instead of STDIN (file descriptor 0)

## [1991-10-04] RZ 3.11 / SZ 3.16

This release included this `README` update:
```
Oct 4 1991:  Fixed bug in rz crash recovery.
```

## [1991-09-15] RZ 3.10 / SZ 3.16

This release included this `README` update:
```
Sep 1991: Major hacking to work around SVR4 bug.  Append and crash
recovery of shrinking files corrected.  Sz now supports rename.
Sz -c changed to zcommand, rx -c file changed to rc file.
```
  - RZ loses the -c and -e options
  - RZ adds the -a option (back)
  - New/unique exit codes
  - Remove idef NFGVMIN hacks
  - SZ loses the -i, -q, and -X options

## [1991-07-02] RZ 3.07 / SZ 3.14

  - Better error handling (e.g. closing files)
  - Man page source (.1) files replaced with .doc files
    This change actually occurred in previous release (whoops)

## [1991-03-20] RZ 3.05 / SZ 3.11

This release included this `README` update:
```
Feb 1991: various corrections and simplifications.  Sz now
stores critical error messages for post mortem display.
```
  - The Makefile seems to have reverted to its previous form
  - Remove '-y' (clobber existing file) option
  - Remove several conversion on receive options
  - SZ version string no longer starts with "sz"
  - vax11c, GENIE and other ifdef/ifndef hacks removed
  - Handle receive of ZNAK
  - Better diagnostic output

## [1990-02-02] RZ 3.02 / SZ 3.07

  - Major Makefile overhaul
    Makefile says it "Calls makefile.generic" but it does not
    The makefile.generic did exist in the archive, but not committing it
    since it wasn't actually used (and isn't referenced in future Makefiles)
  - sz treats received ZFERR the same as ZSKIP
  - zgethdr() ignores received CR (0x0D) and 0x8D characters

## [1989-05-25] RZ 3.01 / SZ 3.03

The archive that contained this release contained a `README.ATHENA` file:
```
  I got the files in this directory from the subdirectory
pd3:<misc.zmodem> on the machine simtel20.arpa by doing "mget
pd3:<misc.zmodem>*" and then frobbing the filenames to get rid of the
extra garbage.

  These are supposed to be the most up-to-date versions, although I
don't know how true that is.

  jik (9/3/89)
```

The archive also included an [interesting text file](https://vert.synchro.net/files/main/text/zmodem_rtc.txt)
which contained an edited transcript of the special GEnie IBM RoundTable Real
Time Conference held June 15, 1986 to discuss micro communication protocols,
especially Xmodem, Ymodem, and Zmodem.  Chuck Forsberg was the guest of honor.

  - Long source lines are now unwrapped again

## [1989-05-09] RZ 3.00 / SZ 3.03

  - Corrections for undefined variable and multiply defined rdchk()
  - Long source lines are now wrapped
  - sz `-z` option treated the same as `-Z`
  
## [1989-04-22] RZ 3.00 / SZ 3.01

This release included this README update:
```
New for April 1989:  ZMODEM compression and other compatible extensions
have been added to the rz and sz programs.  Please read the comments in
the rz.c and sz.c source code for licensing information for commercial use.

Previous versions of rz and sz (April 1988) remain Public Domain.
```
(Odd that the May 1988 releases were not referenced)

  - New dependent source file: zmr.c
  - Add optional Run Length Encoding (compression)
  - Add optional Variable Length Headers (compression)
  - This release included a new source file (genie.c) to support GEnie OS,
    intentionaly not included in this repo to cut down the noise.

## [1988-05-29] RZ 2.03 / SZ 2.12

  - Last full Public Domain release
  - Add ZCRC frame handling

## [1988-05-09] RZ 2.02 / SZ 2.10

  - Sends hex headers terminated with 0x0D,0x8A instead of 0x0D,0x0A (CR LF).
    This change is curious as Even Parity (used more often in serial
	communications than Odd Parity) would mean the high (parity) bit would be
	set in the CR (0x0D) byte, not the LF (0x0A) byte.
  - Handle CR (0x0A) with or without parity bit set when receiving hex headers
  - Detect 7-bit connections based on whether high bit (0x80) is set in the CR
    or *not* set in the LF following a received hex header.
	It seems Chuck was using this scheme to detect if the high bit was being
	stripped in transit.
	The included ZMODEM.DOC file still documents the HEX header format as
	HEX Header Packet
       * * ZDLE TYPE F3/P0 F2/P1 F1/P2 F0/P3 CRC-1 CRC-2 CR LF XON

## [1988-04-22] RZ 2.02 / SZ 2.01

  - VMS flavor hacks
  - CRC tables moved to separate source file (`crctab.c`)

Note: Although this release introduces the source code for some new programs,
I chose not to include them in this repository to keep the noise level down:
  - `crc.c`: Demonstration program to compute the 32-bit CRC
  - `vrzsz.c` and `vvmodem.c`: VMS support (vvrb/vvsb programs)

## [1988-03-29] RZ 1.31 / SZ 1.44

  - getspeed() defaults to 38400 instead of 0
  - Add `-y` (clobber existing file) option

## [1988-03-09] RZ 1.29 / SZ 1.44

The original USENET announcement of this release by Chuck:
```
XMODEM, YMODEM, ZMODEM Unix Programs 3/3
Chuck Forsberg WA7KGX <caf at omen.UUCP>
Wed Mar 9 06:00:31 AEST 1988

This edition of the Unix rz/sz programs adds directory creation
to rz and fixes a problem with running sz on BSD systems.  The
doco has been enhanced to answer most of the questions people
have had about these programs.

This is being released on alt.sources and pnw.general to get some
feedback before shipping off to the comp.sources.unix black hole.
```

  - Introduces "True YMODEM (Omen Technology trademark)"
  - Directory creation code from John Gilmore's PD TAR program
  - More support for systems that do not support overlapping I/O

## [1987-10-11] RZ 1.26 / SZ 1.36

### RZ

  - Same version number (1.26), but slight changes to code
  
### SZ

  - Improved support for XMODEM protocol

## [1987-08-21] RZ 1.26 / SZ 1.35

```
 Length   Method    Size  Cmpr    Date    Time   CRC-32   Name
--------  ------  ------- ---- ---------- ----- --------  ----
   14087  Implode    4163  70% 1987-08-16 05:45 35295e10  ZM.C
     703  Implode     450  36% 1987-08-15 11:49 59cf5431  ZUPL.T
    5487  Implode    2416  56% 1987-06-03 11:44 f886b49c  ZMODEM.H
    6659  Implode    3290  51% 1987-08-10 15:44 a6ab3dc0  RZ.1
   30884  Implode   11549  63% 1987-08-21 14:27 b263c08e  SZ.C
   10570  Implode    4548  57% 1987-08-10 15:55 715ed9ec  SZ.1
    1873  Implode    1269  32% 1987-08-15 11:57 afab0bbc  README
   13705  Implode    6509  53% 1987-07-03 11:46 5aad4ec2  RBSB.C
     119  Shrunk      105  12% 1987-05-25 02:48 3159084c  PTEST.SH
   25050  Implode    9561  62% 1987-08-21 19:26 9dfa6e8c  RZ.C
    4057  Implode    1934  52% 1987-05-25 01:32 aeba47b6  MINIRB.C
    1174  Implode     778  34% 1987-05-25 01:34 4e6445de  MINIRB.1
    1544  Implode     629  59% 1987-08-21 14:28 81bd9bb8  MAKEFILE
      14  Stored       14   0% 1986-06-01 02:21 7a402b5c  GZ
--------          -------  ---                            -------
  115926            47215  59%                            14 files
```

  - Makefile created
  - log() replaced with zperr() to print errors, conflicted with math.h
  - minirb 2.0
  - hacks for BIX support
  - sz 1.34 implements tx backchannel garbage count and ZCRCW after ZRPOS
    in accordance with the 7-31-87 ZMODEM Protocol Description

## [1987-05-29] RZ 1.21 / SZ 1.31

  - Add XMODEM receive (rx) support
  - Add option to control ZMODEM window size
  - Add option to ignore control characters

## [1987-03-10] RZ 1.18 / SZ 1.26

This release was located in a tar file:

```
drwxr-xr-x 6/12              0 1989-07-14 11:45 zmodem/
-r--r--r-- 6/12           9990 1987-09-19 08:16 zmodem/sz.1
-r--r--r-- 6/12          12391 1987-09-19 08:16 zmodem/zm.c
-r--r--r-- 6/12          13868 1987-09-19 08:16 zmodem/rbsb.c
-r--r--r-- 6/12          69544 1987-09-19 08:16 zmodem/zmodem.doc
-r--r--r-- 6/12          24016 1987-09-19 08:16 zmodem/rz.c
-r--r--r-- 6/12          27916 1987-09-19 08:16 zmodem/sz.c
-r--r--r-- 6/12           1307 1987-09-19 08:16 zmodem/README
-r--r--r-- 6/12           1271 1987-09-19 08:16 zmodem/minirb.1
-r--r--r-- 6/12           4039 1987-09-19 08:16 zmodem/minirb.c
-r--r--r-- 6/12             14 1987-09-19 08:16 zmodem/gz
-r--r--r-- 6/12            116 1987-09-19 08:16 zmodem/ptest.sh
-r--r--r-- 6/12           6227 1987-09-19 08:16 zmodem/rz.1
-r--r--r-- 6/12           4595 1987-09-19 08:16 zmodem/zmodem.h
```
  - Improved XON / XOFF control character handling
  - Add program: minirb - boostrap to receive ZMODEM program via YMODEM

This release introduced a `README` file:
```
Compile instructions are located in the comments at the beginning of the rz.c
ans sz.c files.  The main compiler flags are -DV7 for V7 and BSD systems and
-DSVR2 for sVr2.  Other #ifdefs in the files may be activated to deal with
various types of kernel brain damage if you have a mutant system.

Naturally, rz ans sz work best with comm programs that seamlessly support ZMODEM
command and file AutoDownload (PowerCOm, Pro-YAM and ZCOMM).  Ths DOS "DSZ"
sub-program allows ZMODEM file transfers with older programs, but it must be
called manually.  DSZ and the ZMODEM protocol description are on TeleGodzilla
and other bulletin boards.  They may be obtained via UUCP from site "omen", for
which a direct UUCP login and telephone number are provided below.  You may uucp
~uucp/FILES first to determine the pathnames for the "goodies".

Chuck Forsberg WA7KGX Author of Pro-YAM communications Tools for PCDOS and Unix
...!tektronix!reed!omen!caf  Omen Technology Inc "The High Reliability Software"
  17505-V Northwest Sauvie Island Road Portland OR 97231  Voice: 503-621-3406
TeleGodzilla BBS: 621-3746 2400/1200  CIS:70007,2304  Genie:CAF  Source:TCE022
  omen Any ACU 1200 1-503-621-3746 se:--se: link ord: Giznoid in:--in: uucp
  omen!/usr/spool/uucppublic/FILES lists all uucp-able files, updated hourly
```

## [1987-01-25] RZ 1.16 / SZ 1.25

We're back on the high confidence train here as the mysteriously removed
features (e.g. SVR2 support) are now restored and bugs that reappeared
(e.g. the ZRINIT/ZP0 byte masking) are again fixed.

So it is probably best to consider this commit to be the first official release
with 32-bit CRC error detection - that I was able to sucessfully recover.

## [1987-01-16] RZ 1.14 / SZ 1.14 (suspect)

The original [USENET announcement](https://mirrors.nycbug.org/pub/The_Unix_Archive/Unix_Usenet/comp.sources.unix/1987-January/005074.html) of this release by Chuck:

```
Unix X/Y/ZMODEM programs w/32 bit CRC 1 of 2
caf at omen.UUCP
Fri Jan 16 13:08:10 AEST 1987

The reliability of ZMODEM file transfers has been enhanced with the
addition of a table driven 32 bit CRC.  ZMODEM downloads from Unix to
PC's are much more efficient than XMODEM or Kermit.  For example, 9600
baud downloads from a 9 mHz PC-AT Xenix machine to Crosstalk XVI gave
343 characters per second throughput, Kermit gave 327 characters per
second, and ZMODEM gives 915 characters per second.  At 19200 baud,
ZMODEM downloads to a 4.77 mHz PC hard disk attain 1870 characters per
second throughput.  Note that the 343 cps throughput with Crosstalk was
with an 8 bit checksum while ZMODEM uses 32 bit CRC for orders of
magnitude better data reliability.

Chuck Forsberg WA7KGX Author of Pro-YAM communications Tools for PCDOS and Unix
...!tektronix!reed!omen!caf  Omen Technology Inc "The High Reliability Software"
  Voice: 503-621-3406  17505-V Northwest Sauvie Island Road Portland OR 97231
TeleGodzilla BBS: 621-3746 2400/1200  CIS:70007,2304  Genie:CAF  Source:TCE022
  omen Any ACU 1200 1-503-621-3746 se:--se: link ord: Giznoid in:--in: uucp
  omen!/usr/spool/uucppublic/FILES lists all uucp-able files, updated hourly
```

So this release includes a pretty huge improvement: supporting 32-bit CRC for
better error detection (in addition to 16-bit CRC for backward compatibility).
Thankfully, the 32-bit CRC algorithm implemented, courtesy of Gary S. Brown,
was the same ISO/IEEE standard CRC-32 used by Ethernet (IEEE 802.3).  To this
day, when most people say "CRC-32", they're referring to this algorithm and
usually not the plethora of other 32-bit CRC algorithms that exist.  Chuck
used Ethernet/networking terminology when referring to the CRC checksum as an
FCS (Frame Check Sequence) in the souce code.

Unfortunately, this article (part 1 of 2) is truncated in all the USENET
archives where it was located, making the complete SHAR contents (including key
source files) unrecoverable.

I did locate a gzipped-tar file that contained versions of the source claiming
to be version 1.14 of both rz and sz:
```
-rw-rw-r-- discmaster/discmaster 9800 2025-10-24 15:29 ./zm.c
-rw-rw-r-- discmaster/discmaster  663 2025-10-24 15:29 ./:AUTHOR
-rw-rw-r-- discmaster/discmaster 4345 2025-10-24 15:29 ./zmodem.h
-rw-rw-r-- discmaster/discmaster 48879 2025-10-24 15:29 ./ymodem.doc
drwxrwxr-x discmaster/discmaster     0 2025-10-24 15:29 ./:BUGS/
-rw-rw-r-- discmaster/discmaster  1474 2025-10-24 15:29 ./:BUGS/1
-rw-rw-r-- discmaster/discmaster  1949 2025-10-24 15:29 ./:BUGS/2
-rw-rw-r-- discmaster/discmaster 26469 2025-10-24 15:29 ./sz.c
drwxrwxr-x discmaster/discmaster     0 2025-10-24 15:29 ./:UPDATES/
-rw-rw-r-- discmaster/discmaster 14112 2025-10-24 15:29 ./:UPDATES/rbsb.c
-rw-rw-r-- discmaster/discmaster    14 2025-10-24 15:29 ./:UPDATES/gz
-rw-rw-r-- discmaster/discmaster 23972 2025-10-24 15:29 ./:UPDATES/rz.c
-rw-rw-r-- discmaster/discmaster   389 2025-10-24 15:29 ./:UPDATES/:AUTHOR
-rw-rw-r-- discmaster/discmaster 10163 2025-10-24 15:29 ./:UPDATES/sz.1
-rw-rw-r-- discmaster/discmaster  6427 2025-10-24 15:29 ./:UPDATES/rz.1
```

However, the ZRINIT/ZP0 byte-masking bug mysteriously returns in `sz.c`, the
SVR2 support vanishes, and other minor changes that were previously made are
missing but then reappear in subsequent releases, thus making this revision
suspect.  Caveat emptor.

## [1986-11-14] RZ 1.10 / SZ 1.19

  - Support nonblocking I/O in System V, Release 2
  - Support invoking YMODEM (batch) transfers by symlinking sb -> sz

### Files
This release was found only as a SHAR file (`RSSZ1ET2.SH`).  In this example,
zipped and uploaded to Night Owls BBS.
```
        This File was Complements Of Night Owls BBS - Buffalo,New York
           (716)-881-5380 - 1200/2400 -- 24 Hrs - 365 Days
           (716)-881-5688 - 1200/2400/19200 Courier HST Dual
           PCBoard 14.5/E6 -1045 Megs - Qmail Door - Echo Conferences
           Western New York "HUB" For NetMail Echoing 165 Conferences
 Length   Method    Size  Cmpr    Date    Time   CRC-32   Name
--------  ------  ------- ---- ---------- ----- --------  ----
   94273  Implode   33715  64% 1986-12-02 10:00 db6fc379  RZSZ1ET2.SH
--------          -------  ---                            -------
   94273            33715  64%                            1 file
```

### Attribution
A couple of the RZSZ releases from 1986 were only found on the War Ensemble BBS
(warensemble.com).  Thank you to the sysop, DaiTengu!

## [1986-10-23] RZ 1.09 / SZ 1.17

  - Fixed typo in masking of ZP0 byte value in received ZRINIT
  - Reduce expected receive CAN count back from 5 to 2

## [1986-09-15] RZ 1.08 / SZ 1.14

Chuck's corresponding USENET announcement follows:
```
Updated Unix X/Y/ZMODEM File Xfer 1/2
Chuck Forsberg WA7KGX caf at omen.UUCP
Mon Sep 15 21:59:32 AEST 1986

This version of rz corrects an annoying automatic file conversion feature.
Rz ans sz add the ZMODEM ZMPROT file management option which protects exisiting
files on the destination.   A number of small coding and documentation errors
have been fixed as well.

   Chuck Forsberg WA7KGX  ...!tektronix!reed!omen!caf  CIS:70007,2304
   Author of Professional-YAM communications Tools for PCDOS and Unix
 Omen Technology Inc     17505-V NW Sauvie Island Road Portland OR 97231
Voice: 503-621-3406 TeleGodzilla: 621-3746 300/1200 L.sys entry for omen:
omen Any ACU 1200 1-503-621-3746 se:--se: link ord: Giznoid in:--in: uucp
omen!/usr/spool/uucppublic/FILES lists all uucp-able files, updated hourly
```

## [1986-08-16] RZ 1.06 / SZ 1.13

SZ changes only:

  - Add command-line option to control receive timeout duration
  - Add command-line option to enable encoding of all tx'd control characters
  - Handle (ignore) receipt of ZACK

## [1986-07-18] RZ 1.06 / SZ 1.08

This appears to be the third public release of ZMODEM by Chuck Forsberg.
Chuck's corresponding USENET announcement follows:
```
From: caf@omen.UUCP
Newsgroups: net.micro,net.micro.pc,net.dcom
Subject: Revised ZMODEM sources
Message-ID: <370@omen.UUCP>
Date: 18 Jul 86 12:12:41 GMT
Date-Received: 22 Jul 86 18:57:57 GMT
Distribution: net
Organization: Omen Technology, Portland
Lines: 16
Xref: santra net.micro:1169 net.micro.pc:2159 net.dcom:676

A new version of the ZMODEM programs sz and rz are being posted to
net.sources.  These have many bug fixes and enhancements over the
previous posting, which did not get intact to all sites.  The posting
is in two parts (to get past notesfiles), rzsz1.sh and rzsz2.sh.

A new version of ZMODEM.ARC with a revised ZMODEM.DOC is now available on
Telegodzilla.  ZMODEM.ARC includes a PC-DOS communications program with
ZMODEM protocol (also X/YMODEM, Compuserve B, and Kermit w/sliding window).


   Chuck Forsberg WA7KGX  ...!tektronix!reed!omen!caf   CIS:70715,131
   Author of Professional-YAM communications Tools for PCDOS and Unix
 Omen Technology Inc     17505-V NW Sauvie Island Road Portland OR 97231
Voice: 503-621-3406 TeleGodzilla: 621-3746 300/1200 L.sys entry for omen:
omen Any ACU 1200 1-503-621-3746 se:--se: link ord: Giznoid in:--in: uucp
omen!/usr/spool/uucppublic/FILES lists all uucp-able files, updated hourly
```

The actual SHAR file postings for this release,
[part1](https://mirrors.nycbug.org/pub/The_Unix_Archive/Unix_Usenet/comp.sources.unix/1986-July/001063.html)
and [part2](https://mirrors.nycbug.org/pub/The_Unix_Archive/Unix_Usenet/comp.sources.unix/1986-July/003237.html),
did not include any introductory text.

Note: TeleGodzilla was Chuck Forsberg's dial-up Bulletin Board System (BBS) and
WA7KGX was his [Amateur Radio call sign](https://www.qcwa.org/wa7kgx-26075-sk.htm).

Main change:

  - Move from run-time to table-driven 16-bit CRC calculation algorithm

## [1986-06-12] RZ 1.04 / SZ 1.07

This appears to be the second public release of ZMODEM by Chuck Forsberg.
No associated USENET announcement/description article has been located.

  - Support for serial connections that utilize 2 stop bits
  - Add options to control packet (block) and frame length limits
  - Handle more received CANs (5 instead of 2 for quick abort)
  - New frame type: ZSTDERR (19)
  - Some hacks for V7/BSD compatibility

### Files

The contents of the associated tar file follow:
```
-rwxr-xr-x 0/0              14 1986-07-23 09:17 gz
-rwxr-xr-x 0/0            4361 1986-07-23 09:18 rbsb.c
-rwxr-xr-x 0/0            6026 1986-07-23 09:18 rz.1
-rwxr-xr-x 0/0           24179 1986-07-23 09:18 rz.c
-rwxr-xr-x 0/0            8581 1986-07-23 09:18 sz.1
-rwxr-xr-x 0/0           25781 1986-07-23 09:13 sz.c
-rwxr-xr-x 0/0            9098 1986-07-23 09:13 zm.c
-rwxr-xr-x 0/0            4244 1986-07-23 09:13 zmodem.h
```
You may notice the shell script file `gz` which I elected to exclude from
the repo.  It appear it was used to send a command to a remote rz application
to initiate a send (`sz` invocation) of a specified filename.  I speculate the
name was short for "get ZMODEM".
```
sz -c "sz $*"
```

### Attribution

Nelgin (EOTLBBS) found this archive and uploaded it to my BBS, Vertrauen
(vert.synchro.net) in response to my request for historic RZSZ archives.
Thanks Nelgin!

## [1986-05-20] RZ 1.03 / SZ 1.03

This is the first public release of ZMODEM, originally posted by Chuck Forsberg (caf)
to the comp.sources.unix (nee net.sources) USENET newsgroup with the following
introduction:

```
New ZMODEM+YMODEM+ZMODEM Unix Programs
caf at omen.UUCP
Tue May 20 20:46:35 AEST 1986

Here are the Unix/Xenix programs that implement ZMODEM as well as XMODEM
and YMODEM.  They supercede rb.c and sb.c.

The ZMODEM protocol is described in ZMODEM.DOC, posted separately.
ZMODEM provides high throughput with timesharing systems and networks, a
simple user interface, security verification to protect from Trojan
Horses, command download and other advanced protocol management
functions.
```

Note: rb.c and sb.c were the source files for Chuck's receive-batch and
send-batch YMODEM file transfer programs.

This introductory text was followed by a series of files encoded in Shell
Archive (SHAR) format which, when extracted from the article correctly, were to
recreate the C source files that could be compiled and linked to create the
'rz' and 'sz' programs.

Unfortantely, it appears this [original USENET post](https://mirrors.nycbug.org/pub/The_Unix_Archive/Unix_Usenet/comp.sources.unix/1986-May/001067.html)
was missing the sz.c and rz.c files from the SHAR, making it nearly useless.
Chuck must have posted to another newsgroup or uploaded an archive to a BBS
somewhere...

### Eureka!

After an extensive search of BBSes, FTP servers, and web-file libraries, I
located what appears to be an in-tact ZIP file of this original RZSZ
release at a pay-to-download web-site in China named verysource.com.  Here
are the contents of the `zmodem.zip` file that I happily paid less than $1 (US)
to download from that web-site:
```
Archive:  zmodem.zip

This file was downloaded from

Programmers Heaven
http://www.programmersheaven.com

The Internet's most complete source of free downloadable programming files,
source codes, utilities, C/C++, Java, .NET, C#, and other tools for programmers
and developers. Here you will find over 10000 files and 4500 links organized
in an easy-to-find format.

 Length   Method    Size  Cmpr    Date    Time   CRC-32   Name
--------  ------  ------- ---- ---------- ----- --------  ----
    3555  Defl:X     1325  63% 1992-04-04 17:15 a427bc70  RBSB.C
    6295  Defl:X     2870  54% 1992-04-04 17:15 a155a6f5  RZ.1
   24123  Defl:X     8700  64% 1992-04-04 17:15 544dcac9  RZ.C
    8442  Defl:X     3509  58% 1992-04-04 17:15 25decc13  SZ.1
   23624  Defl:X     8588  64% 1992-04-04 17:15 2b755465  SZ.C
    8833  Defl:X     2760  69% 1992-04-04 17:15 a43afac8  ZM.C
   63488  Defl:X    20832  67% 1992-04-04 17:15 4494bfe9  ZMODEM.DOC
    4184  Defl:X     1716  59% 1992-04-04 17:15 430d4289  ZMODEM.H
     224  Defl:N      179  20% 2015-01-06 12:21 a9b0f4a0  readme_verysource.com.txt
--------          -------  ---                            -------
  142768            50479  65%                            9 files
```

Comparing the files in common between this archive and the original USENET
posted SHAR seems to confirm they are in fact the same version released on
either May 19th (the latest timestamp within the files) or 20th of 1986
(the date of the USENET post).

This particular archive appears to have been created in April of 1992 and then
ammended with the addition of the verysource.com ad file in 2015.  However, the
source files within contain, to the best of my knowledge, the same text (source
code) as the initial release from Chuck, made in 1986.

### Attribution

The www.programmersheaven.com web-site mentioned in the ZIP comment is
defunct today and does not appear to have ever been archived by archive.org.

The contents of the included `readme_verysource.com.txt` file were:
```
VerySource.com -- The leading source code sharing site.
Over 10 million, 10TB source code free download.

VerySource.com -- 领先的源码共享网站。
超过1千万、10TB 源码免费下载。
```

### Source files

As you might have guessed from the naming, the files were in "MS-DOS format"
with CRLF terminated lines.  I renamed the files to lowercase and used dos2unix
to convert their line-endings to the traditional UNIX (LF-termianted) form.
I will later need to perform these same steps with many of the DOS archives I
discovered and used to create this Git repo.

No Build/Makefiles were included.  The 'rz.c' and 'sz.c' files include comments
near their top with the suggested command-lines used to compile and link the
programs.  Most modern C compilers will still manage to compile these source
files, though with some effort and a lot of warnings.  It is not recommended
that you run any of the historic versions of 'rz' and 'sz' as they contain
well-known security vulnerabilities.  These files are intended for educational
purposes only.

### ZMODEM.DOC

I am not including the ZMODEM.DOC file (and its change history) in this repo.
Since that file is formatted for line-printing (e.g. includes form-feeds and
backspace control characters for over-striking/bold), it's not suitable as-is
for tracking changes via a Git repo.  After some effort to convert to a more
common plain-ASCII text (maybe Markdown) format, I hope to create another Git
repo just to track the history of Chuck's ZMODEM technical specification.

