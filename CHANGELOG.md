# Changelog

## [RZ 1.10 / SZ 1.19] - 1986-11-14

  - Support nonblocking I/O in System V, Release 2
  - Support invoking YMODEM (batch) transfers by symlinking sb -> sz

### Files
This release was found only as a SHAR file (`RSSZ1ET2.SH`).  In this example,
zipped and uploaded to Night Owls BBS.
```
Archive:  ../archive/rzsz_1.10_19.zip

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

## [RZ 1.09 / SZ 1.17] - 1986-10-23

  - Fixed typo in masking of ZP0 byte value in received ZRINIT
  - Reduce expected receive CAN count back from 5 to 2

## [RZ 1.08 / SZ 1.14] - 1986-09-15

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

## [RZ 1.06 / SZ 1.13] - 1986-08-16

SZ changes only:

  - Add command-line option to control receive timeout duration
  - Add command-line option to enable encoding of all tx'd control characters
  - Handle (ignore) receipt of ZACK

## [RZ 1.06 / SZ 1.08] - 1986-07-18

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

Note: TeleGodzilla was Chuck Forsberg's dial-up Bulletin Board System (BBS) and
WA7KGX was his [Amateur Radio call sign](https://www.qcwa.org/wa7kgx-26075-sk.htm).

Main change:

  - Move from run-time to table-driven 16-bit CRC calculation algorithm

## [RZ 1.04 / SZ 1.07] - 1986-06-12

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

## [RZ 1.03 / SZ 1.03] - 1986-05-20

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

