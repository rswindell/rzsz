# The History of Chuck Forsberg's RZ/SZ

The ZMODEM file transfer protocol is notable in the history of computers as a radically improved protocol featuring superior performance, restartable transfers, and 8-bit clean operation.  This source code repository was created to reproduce the development history of the definitive implementation of the ZMODEM protocol: Chuck Forsberg's rz and sz programs for UNIX and UNIX-like operating systems.

The "main" branch of this repository tracks Chuck's changes to his released files from 1986 through 2003 as accurately as possible.  This repository also includes a "modern" branch which includes subsequent minor modifications to aid code readability and resolving compilation warnings.

## How Files Were Transferred

If you used computers, in particular personal computers, up to and including the mid-late 1990s, you likely transferred files using one or more of the file transfer protocols known as XMODEM, YMODEM, or ZMODEM.  If you're a system administrator or avid computing/embedded-device hacker/user today, you might still be using one or more of these protocols for transferring data when a modern network stack/interface is not an option.

The first of these protocols, XMODEM, was the original and created in 1977 by the late Bulletin Board System (BBS) pioneer, Ward Christensen.  The 'X' in XMODEM meaning to "transfer" or possibly standing for "Christensen" and "MODEM" was the name of the MOdulator/DEModator device most often used to remotely connect the computers of the day.  These connections were made over a network of dial-up landlines designed for analog voice phone calls only: the so-called "plain old telephone system".  MODEMs were the devices used to perform the necessary digital-to-analog and analog-to-digital conversions that made these data-connections possible.

XMODEM transmitted data in 128-byte blocks, utilized an 8-bit checksum for error detection, and required that the sender wait for a positive acknowledgement from the receiver for each block transferred.  The simple and open design of XMODEM resulted in widespread adoption. XMODEM still has use cases almost 50 years later and likely will continue to be used in many scenarios for the foreseeable future.

## The X-\>Y Solution

In 1985, an enterprising technologist by the name of Chuck Forsberg extended Ward's XMODEM protocol for greater convenience, performance, and reliability and called his new protocol (with Ward's approval) YMODEM.  Chuck's YMODEM brought many long-sought improvements, including the transferring of file metadata (e.g. file names, sizes, and dates), multi-file/batch transfers, larger block sizes, acknowledgeless-streaming mode ("go mode"), and CRC-16 error detection.  These enhancements resulted in YMODEM quickly supplanting most use of XMODEM in the online world at the time.  YMODEM has also, at times, been referred to as XMODEM/CRC, YAM and Batch.

## Suddenly ZMODEM

Soon after the introduction of YMODEM, Chuck was commissioned to design and implement an even more robust and convenient file transfer protocol and he named it, naturally, ZMODEM.  Chuck's ZMODEM was more resilient to communication errors, more accommodating to the needs of different communication networks, supported failed file transfer recovery, and included a time-saving feature that hooked users: automatic start of file transfers.

From Chuck's own `ZMODEM.DOC` file:
*In early 1986, Telenet funded a project to develop an improved public domain application to application file transfer protocol.  This protocol would alleviate the throughput problems network customers were experiencing with XMODEM and Kermit file transfers.*

Chuck released the original ZMODEM implementation for UNIX and crucially, the technical specification of the protocol itself (`ZMODEM.DOC`), fully formed, to the public in May of 1986.  Chuck signed his files as "Chuck Forsberg Omen Technology Inc" and would later sell commercialized implementations of the protocol and add "for pay" features.  While other file-over-MODEM transfer protocols were subsequently conceived and successfully deployed, none has matched the ubiquity and lasting success of ZMODEM.

## RZ and SZ

Chuck's original ZMODEM programs, written for UNIX and UNIX-like operating systems, were named "rz" (for receiving files via ZMODEM) and "sz" (for sending files via ZMODEM).  Chuck originally distributed these programs in source code form (in the "C" programming language) posted to USENET newsgroups (i.e. net.sources and later comp.sources.unix) as shell archives (SHAR files).  Later, he distributed his C source code, build files, and documentation in compressed archives named `RZSZ.ARC`, `RZSZ.ZOO`, and later `RZSZ.ZIP`.  Often there was a release-date/version-number of sorts included in the filename as well, but the pattern would change from MMYY (e.g. `RZSZ0589.ZIP`) to YYMM (e.g. `RZSZ9405.ZIP`) to MMDD in 1995 (e.g. `RZSZ0607.ZIP`).

## ZMODEM for Other Computer Platforms

Chuck ported his programs to other platforms of the era, e.g. VAX/VMS, but didn't always combine the changes into the source code for the UNIX programs.  Chuck also created versions of his file transfer programs for MS-DOS/PC-DOS computers.  Combined into a single executable program capable of either sending or receiving files, he released several variants for DOS: DSZ.COM, DSZ.EXE, GSZ.EXE, and FDSZ.EXE.  These programs were released without source code under a "shareware" license and were very popular among BBS operators of the era.

Other programmers have ported Chuck's public rzsz-UNIX C source code to other platforms, getting his code to build and run on their computer of choice, including MS-DOS PCs, NeXT, Apple Macintosh, Atari and Amiga computers, among others.  However, these changes were never officially merged with Chuck's UNIX source code and remained bespoke forks with little ongoing support or maintenance.  Conversely, the last Public Domain release of Chuck's rzsz source code from 1988 was ported to the Linux operating system and renamed "lrzsz" (for **Linux** Receive ZMODEM / Send ZMODEM).  It is this forked port of Chuck's code that has had the most updates and support over the past few decades and will likely be maintained far into the future.

## ZFIN

In 1989, with version 3.00 of rzsz, Chuck changed the program's license from Public Domain to a commercial license, but allowed that the program "may be freely used for non commercial and educational purposes."  The rzsz source code released by Chuck as of version 3.00 also contained the notice: "Any programs which use part or all of this software must be provided in source form with this notice intact except by written permission from Omen Technology Incorporated."  Chuck Forsberg passed away in September of 2015.  His company and any intellectual property claims it might have made against violators of his license terms seemed to have died with him.  That said, if anyone intends to reuse any of the source code in this repository for commercial (non-educational) purposes, consult a legal professional for advice on the matter.  The code provided here was all publicly posted by Chuck Forsberg and is only being re-posted as commits to this repository for educational purposes and to recreate the history of changes to the definitive ZMODEM implementation by the originator himself.  The last known public release of rzsz was version 3.73, released by Chuck in January of 2003.

## OO
