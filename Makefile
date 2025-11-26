# Makefile for Unix/Xenix rz and sz programs
# the makefile is not too well tested yet

CC=			cc
OFLAG=
PROGS=			rz rb rx sz sb sx
DESTDIR= 
BINDIR= 		/mit/sipb/$(MACHINE)bin
MANDIR= 		/mit/sipb/man
MANSECT= 		1
INSTALL= 		install
BININSTALLFLAGS= 	-c -s
MANINSTALLFLAGS= 	-c -m 644
TLBFILES= 		zmodem.h zm.c zmr.c crctab.c sz.c rz.c\
			vmodem.h vvmodem.c vrzsz.c init.com crc.c
ARCFILES= 		$(TLBFILES) README rbsb.c gz ptest.sh\
			*.t minirb.c genie.c *.1

# Use the following defines for SYSTEM 5.3 Unix with mkdir(2)
DEFINES= -DMD=2 -DSV -DTXBSIZE=32768 -DNFGVMIN
LIBS=

# Use the following defines for SYSTEM 3/5 Unix
# DEFINES= -DMD -DSV -DTXBSIZE=32768 -DNFGVMIN
# LIBS=

# Use the following defines for Xenix
# DEFINES= -M0 -Ox -K -i -DTXBSIDE=16384 -DNFGVMIN -DREADCHECK -DMD
# LIBS= -lx

# Use the following defines for 386 Xenix
# DEFINES= -Ox -DMD -DTXBSIZE=32768 -DNFGVMIN -DREADCHECK
# LIBS= -lx

# Use the following defines for Berkeley 4.x BSD, Ultrix, V7
# DEFINES= -DMD=2 -Dstrchr=index -DV7 -DTXBSIZE=32768 -DNFGVMIN
# LIBS=

#nothing:
#	@echo ""
#	@echo "Please study the #ifdef's in crctab.c rbsb.c, rz.c and sz.c,"
#	@echo "then edit the makefile so that only one set of DEFINES"
#	@echo "and LIBS is uncommented, then type 'make all' to build"
#	@echo "everything."

all: $(PROGS)

usenet:
	shar -f /tmp/rzsz README Makefile zmodem.h zm.c sz.c rz.c rbsb.c \
	 init.com crc.c vmodem.h vvmodem.c vrzsz.c crctab.c minirb.c \
	 zmr.c *.1 gz ptest.sh *.t

tlbcmd:
	mktlb.sh README. $(TLBFILES)

shar:
	shar -f /tmp/rzsz -m 2000000 README Makefile zmodem.h zm.c \
	 zmr.c init.com vmodem.h vvmodem.c vrzsz.c sz.c rz.c crctab.c \
	 genie.c crc.c rbsb.c minirb.c *.1 gz ptest.sh *.t

unixforum: shar
	compress -b12 /tmp/rzsz.sh

unix:
	undos $(ARCFILES)

dos:
	todos $(ARCFILES)

arc:
	rm -f /tmp/rzsz.arc
	arc aq /tmp/rzsz README Makefile zmodem.h zm.c sz.c rz.c \
	 vmodem.h vvmodem.c vrzsz.c crctab.c rbsb.c \
	 zmr.c genie.c init.com crc.c *.1 gz ptest.sh *.t minirb.c
	chmod og-w /tmp/rzsz.arc
	mv /tmp/rzsz.arc /t/yam

zoo:
	rm -f /tmp/rzsz.zoo
	zoo a /tmp/rzsz README Makefile zmodem.h zm.c sz.c rz.c \
	 vmodem.h vvmodem.c vrzsz.c crctab.c rbsb.c *.1 \
	 zmr.c genie.c init.com crc.c gz ptest.sh *.t minirb.c
	touch /tmp/rzsz.zoo
	chmod og-w /tmp/rzsz.zoo
	mv /tmp/rzsz.zoo /t/yam

tar:
	tar cvf /tmp/rzsz.tar $(ARCFILES)

tags:
	ctags sz.c rz.c zm.c zmr.c rbsb.c

.PRECIOUS: rz sz

rz: rz.o
	$(CC) $(CFLAGS) $(OFLAG) $(DEFINES) -o rz rz.o $(LIBS)

sz: sz.o
	$(CC) $(CFLAGS) $(OFLAG) $(DEFINES) -o sz sz.o $(LIBS)

rb: rz
	-ln rz rb

rx: rz
	-ln rz rx

sb: sz
	-ln sz sb

sx: sz
	-ln sz sx

install: $(DESTDIR)$(BINDIR)/rz
install: $(DESTDIR)$(BINDIR)/rb
install: $(DESTDIR)$(BINDIR)/rx
install: $(DESTDIR)$(BINDIR)/sz
install: $(DESTDIR)$(BINDIR)/sb
install: $(DESTDIR)$(BINDIR)/sx

$(DESTDIR)$(BINDIR)/rz: rz
	$(INSTALL) $(BININSTALLFLAGS) rz $(DESTDIR)$(BINDIR)
	
$(DESTDIR)$(BINDIR)/rb:
	-cd $(DESTDIR)$(BINDIR); ln -s rz rb

$(DESTDIR)$(BINDIR)/rx:
	-cd $(DESTDIR)$(BINDIR); ln -s rz rx

$(DESTDIR)$(BINDIR)/sz: sz
	$(INSTALL) $(BININSTALLFLAGS) sz $(DESTDIR)$(BINDIR)

$(DESTDIR)$(BINDIR)/sb:
	-cd $(DESTDIR)$(BINDIR); ln -s sz sb

$(DESTDIR)$(BINDIR)/sx:
	-cd $(DESTDIR)$(BINDIR); ln -s sz sx

install:
	for i in rb rx gz; do \
		rm -f $(DESTDIR)$(MANDIR)/man$(MANSECT)/$$i.$(MANSECT); \
		echo ".so man$(MANSECT)/rz.$(MANSECT)" > \
			$(DESTDIR)$(MANDIR)/man$(MANSECT)/$$i.$(MANSECT); \
	done
	for i in sb sx; do \
		rm -f $(DESTDIR)$(MANDIR)/man$(MANSECT)/$$i.$(MANSECT); \
		echo ".so man$(MANSECT)/sz.$(MANSECT)" > \
			$(DESTDIR)$(MANDIR)/man$(MANSECT)/$$i.$(MANSECT); \
	done


.SUFFIXES: .1 .msed

.c.o: $*.c
	$(CC) $(CFLAGS) $(OFLAG) $(DEFINES) -c $*.c

.msed.1: $*.msed
	sed -e 's/MANSECT/$(MANSECT)/g' $*.msed > $*.1

depend:
	makedepend $(DEFINES) -- *.c

# DO NOT DELETE THIS LINE -- make depend depends on it.

crc.o: crc.c crctab.c
genie.o: genie.c minirb.c rbsb.c rz.c rbsb.c
rz.o: crctab.c zm.c zmodem.h
rz.o: zmr.c
sz.o: sz.c rbsb.c
sz.o: crctab.c zm.c zmodem.h
sz.o: zmr.c
zm.o: zm.c zmodem.h
zmr.o: zmr.c
