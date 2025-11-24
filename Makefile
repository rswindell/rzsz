# Makefile for Unix/Xenix rz and sz programs
# the makefile is not too well tested yet

nothing:
	@echo
	@echo "Please study the #define's in rz.c and sz.c,"
	@echo "then type 'make system' where system is one of:"
	@echo "	sysv	SYSTEM 5 Unix"
	@echo "	xenix	SYSTEM 5 Xenix"
	@echo "		xenix386 SYSTEM 5 386 Xenix"
	@echo "	bsd	Berkeley 4.x BSD, and Ultrix"
	@echo

usenet:
	shar -f /tmp/rzsz README Makefile zmodem.h zm.c sz.c rz.c rbsb.c \
	  minirb.c *.1 gz ptest.sh zupl.t

shar:
	 shar -f /tmp/rzsz1et2 -m 1000000 README Makefile zmodem.h zm.c \
	    sz.c rz.c rbsb.c minirb.c *.1 gz ptest.sh zupl.t

arc:
	rm -f /tmp/rzsz.arc
	arc a /tmp/rzsz README Makefile zmodem.h zm.c sz.c rz.c \
	    rbsb.c *.1 gz ptest.sh zupl.t minirb.c
	chmod og-w /tmp/rzsz.arc
	ln /tmp/rzsz.arc /usr/spool/uucppublic
	mv /tmp/rzsz.arc /t/yam

zoo:
	rm -f /tmp/rzsz.zoo
	zoo a /tmp/rzsz README Makefile zmodem.h zm.c sz.c rz.c \
	    rbsb.c *.1 gz ptest.sh zupl.t minirb.c
	chmod og-w /tmp/rzsz.zoo
	ln /tmp/rzsz.zoo /usr/spool/uucppublic
	mv /tmp/rzsz.zoo /t/yam

xenix:
	cc -M0 -Ox -K -i -DNFGVMIN -DREADCHECK sz.c -lx -o sz
	size sz
	-ln sz sb
	cc -M0 -Ox -K -i rz.c -o rz
	size rz
	-ln rz rb

xenix386:
	cc -Ox rz.c -o rz
	size rz
	-ln rz rb
	cc -Ox -DNFGVMIN -DREADCHECK sz.c -lx -o sz
	size sz
	-ln sz sb

sysv:
	cc -O rz.c -o rz
	size rz
	-ln rz rb
	cc -DSVR2 -O -DNFGVMIN sz.c -o sz
	size sz
	-ln sz sb

bsd:
	cc -DV7 -O rz.c -o rz
	size rz
	-ln rz rb
	cc -DV7 -O -DNFGVMIN sz.c -o sz
	size sz
	-ln sz sb

sz: nothing
sb: nothing
rz: nothing
rb: nothing
