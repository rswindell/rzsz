# Changelog

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

