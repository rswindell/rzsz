# Makefile for Unix/Xenix rz and sz programs
# the makefile is not too well tested yet
CC=cc
OFLAG=


ARCFILES= README rbsb.c gz ptest.sh *.t minirb.c *.1 zmodem.h \
	zm.c zmr.c crctab.c sz.c rz.c mailer.rz crc.c

nothing:
	@echo
	@echo "Please study the #ifdef's in crctab.c, rbsb.c, rz.c and sz.c,"
	@echo "make any necessary hacks for oddball or merged SYSV/BSD systems,"
	@echo "then type 'make SYSTEM' where SYSTEM is one of:"
	@echo
	@echo "	sysvr3	SYSTEM 5.3 Unix with mkdir(2)"
	@echo "	sysv	SYSTEM 3/5 Unix"
	@echo "	xenix	Xenix"
	@echo "	x386	386 Xenix"
	@echo "	bsd	Berkeley 4.x BSD, Ultrix, V7"
	@echo "	tandy	Tandy 6000 Xenix"
	@echo

usenet:
	shar -f /tmp/rzsz README Makefile zmodem.h zm.c sz.c rz.c rbsb.c \
	 crc.c crctab.c minirb.c mailer.rz zmr.c *.1 gz ptest.sh *.t

shar:
	shar -f /tmp/rzsz -m 2000000 README Makefile zmodem.h zm.c \
	 zmr.c sz.c rz.c crctab.c \
	 mailer.rz crc.c rbsb.c minirb.c *.1 gz ptest.sh *.t

unixforum: shar
	compress -b12 /tmp/rzsz.sh

unix:
	undos $(ARCFILES)

dos:
	todos $(ARCFILES)

arc:
	rm -f /tmp/rzsz.arc
	arc aq /tmp/rzsz README Makefile zmodem.h zm.c sz.c rz.c \
	 mailer.rz crctab.c rbsb.c \
	 zmr.c crc.c *.1 gz ptest.sh *.t minirb.c
	chmod og-w /tmp/rzsz.arc
	mv /tmp/rzsz.arc /u/t/yam

zoo:
	rm -f /tmp/rzsz.zoo
	nroff -man rz.1 | col  >rz.doc
	nroff -man sz.1 | col  >sz.doc
	nroff -man crc.1 | col  >crc.doc
	zoo a /tmp/rzsz README Makefile zmodem.h zm.c sz.c rz.c \
	 mailer.rz crctab.c rbsb.c *.doc \
	 zmr.c crc.c gz ptest.sh *.t minirb.c
	touch /tmp/rzsz.zoo
	chmod og-w /tmp/rzsz.zoo
	mv /tmp/rzsz.zoo /u/t/yam
	rm -f rzsz.zip
	pkzip rzsz readme mailer.rz makefile zmodem.h zm.c sz.c rz.c
	pkzip rzsz crctab.c rbsb.c *.doc
	pkzip rzsz zmr.c crc.c gz ptest.sh *.t minirb.c
	mv rzsz.zip /u/t/yam

tar:
	tar cvf /tmp/rzsz.tar README Makefile zmodem.h zm.c sz.c rz.c \
	 mailer.rz crctab.c rbsb.c \
	 zmr.c crc.c *.1 gz ptest.sh *.t minirb.c

tags:
	ctags sz.c rz.c zm.c zmr.c rbsb.c

.PRECIOUS:rz sz

xenix:
	$(CC) $(CFLAGS) $(OFLAG) -M0 -Ox -K -i -DTXBSIZE=16384 -DNFGVMIN -DREADCHECK sz.c -lx -o sz
	size sz
	-ln sz sb
	-ln sz sx
	$(CC) $(CFLAGS) $(OFLAG) -M0 -Ox -K -i -DMD rz.c -o rz
	size rz
	-ln rz rb
	-ln rz rx

x386:
	$(CC) $(CFLAGS) $(OFLAG) -Ox -DMD rz.c -o rz
	size rz
	-ln rz rb
	-ln rz rx
	$(CC) $(CFLAGS) $(OFLAG) -Ox -DTXBSIZE=32768 -DNFGVMIN -DREADCHECK sz.c -lx -o sz
	size sz
	-ln sz sb
	-ln sz sx

sysv:
	$(CC) $(CFLAGS) $(OFLAG) -DMD rz.c -o rz
	size rz
	-ln rz rb
	-ln rz rx
	$(CC) $(CFLAGS) $(OFLAG) -DSV -DTXBSIZE=32768 -DNFGVMIN sz.c -o sz
	size sz
	-ln sz sb
	-ln sz sx

sysvr3:
	$(CC) $(CFLAGS) $(OFLAG) -DMD=2 rz.c -o rz
	size rz
	-ln rz rb
	-ln rz rx
	$(CC) $(CFLAGS) $(OFLAG) -DSV -DTXBSIZE=32768 -DNFGVMIN sz.c -o sz
	size sz
	-ln sz sb
	-ln sz sx


odt:
	cc -Za -n -DMD=2 rz.c -o rz
	size rz
	-ln rz rb
	-ln rz rx
	cc -Za -n -DSV -DTXBSIZE=32768 -DNFGVMIN sz.c -o sz
	size sz
	-ln sz sb
	-ln sz sx

bsd:
	$(CC) $(CFLAGS) $(OFLAG) -DMD=2 -Dstrchr=index -DV7 rz.c -o rz
	size rz
	-ln rz rb
	-ln rz rx
	$(CC) $(CFLAGS) $(OFLAG) -DV7 -DTXBSIZE=32768 -DNFGVMIN sz.c -o sz
	size sz
	-ln sz sb
	-ln sz sx

tandy:
	$(CC) $(CFLAGS) $(OFLAGS) -n -DMD -DT6K sz.c -lx -o sz
	size sz
	-ln sz sb
	-ln sz sx
	$(CC) $(CFLAGS) $(OFLAGS) -n -DMD -DT6K rz.c -lx -o rz
	size rz
	-ln rz rb
	-ln rz rx


sz: nothing
sb: nothing
rz: nothing
rb: nothing
