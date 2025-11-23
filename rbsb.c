/*% shar zmodem.h zm.c sz.c>/tmp/rzsz1.sh;shar rz.c rbsb.c rz.1 sz.1 gz>/tmp/rzsz2.sh
 * -rev 05-28-86
 * mode function and most of the rest of the system dependent
 * stuff for rb.c and sb.c   This file is #included so the includer
 * can set parameters such as HOWMANY.  See the main file (rz.c/sz.c)
 * for compile instructions.
 */

#ifdef V7
#include <sys/types.h>
#include <sys/stat.h>
#include <sgtty.h>
#define OS "V7/BSD"
#endif

#ifndef OS
#ifndef USG
#define USG
#endif
#endif

#ifdef USG
#include <sys/types.h>
#include <sys/stat.h>
#include <termio.h>
#include <sys/ioctl.h>
#define OS "SYS III/V"
#endif


struct {
	unsigned baudr;
	int speedcode;
} speeds[] = {
	110,	B110,
	300,	B300,
	600,	B600,
	1200,	B1200,
	2400,	B2400,
	4800,	B4800,
	9600,	B9600,
	19200,	EXTA,
	9600,	EXTB,
	0,
};

int Twostop;		/* Use two stop bits */

static unsigned
getspeed(code)
{
	register n;

	for (n=0; speeds[n].baudr; ++n)
		if (speeds[n].speedcode == code)
			return speeds[n].baudr;
	return 0;
}



#ifdef ICANON
struct termio oldtty, tty;
#else
struct sgttyb oldtty, tty;
struct tchars oldtch, tch;
#endif

int iofd = 0;		/* File descriptor for ioctls & reads */

/*
 * mode(n)
 *  2: set a cbreak, XON/XOFF control mode if using Pro-YAM's -g option
 *  1: save old tty stat, set raw mode 
 *  0: restore original tty mode
 */
mode(n)
{
	static did0 = FALSE;

	vfile("mode:%d", n);
	switch(n) {
#ifdef USG
	case 2:	/* Cbreak mode used by sb when -g detected */
		if(!did0)
			(void) ioctl(iofd, TCGETA, &oldtty);
		tty = oldtty;

		tty.c_iflag = BRKINT|IXON;

		tty.c_oflag = 0;	/* Transparent output */

		tty.c_cflag &= ~PARENB;	/* Disable parity */
		tty.c_cflag |= CS8;	/* Set character size = 8 */
		if (Twostop)
			tty.c_cflag |= CSTOPB;	/* Set two stop bits */

#ifdef XCLUDE
		tty.c_lflag = XCLUDE | ISIG;
#else
		tty.c_lflag = ISIG;
#endif

		tty.c_cc[VINTR] = Zmodem ? 03:030;	/* Interrupt char */
		tty.c_cc[VMIN] = 1;

		(void) ioctl(iofd, TCSETAW, &tty);
		did0 = TRUE;
		return OK;
	case 1:
		if(!did0)
			(void) ioctl(iofd, TCGETA, &oldtty);
		tty = oldtty;

		tty.c_iflag = IGNBRK;

		 /* No echo, crlf mapping, INTR, QUIT, delays, no erase/kill */
		tty.c_lflag &= ~(ECHO | ICANON | ISIG);
#ifdef XCLUDE
		tty.c_lflag |= XCLUDE;
#endif

		tty.c_oflag = 0;	/* Transparent output */

		tty.c_cflag &= ~PARENB;	/* Leave baud rate alone, disable parity */
		tty.c_cflag |= CS8;	/* Set character size = 8 */
		if (Twostop)
			tty.c_cflag |= CSTOPB;	/* Set two stop bits */
		tty.c_cc[VMIN] = HOWMANY; /* Satisfy reads when this many chars in */
		tty.c_cc[VTIME] = 1;	/* ... or in this many tenths of seconds */
		(void) ioctl(iofd, TCSETAW, &tty);
		did0 = TRUE;
		Baudrate = getspeed(tty.c_cflag & CBAUD);
		return OK;
#endif
#ifdef V7
	case 2:	/*  This doesn't work ... */
		printf("No mode(2) in V7/BSD!"); bibi(99);
		if(!did0) {
			ioctl(iofd, TIOCEXCL, 0);
			ioctl(iofd, TIOCGETP, &oldtty);
			ioctl(iofd, TIOCGETC, &oldtch);
		}
		tty = oldtty;
		tch = oldtch;
		tch.t_intrc = Zmodem ? 03:030;	/* Interrupt char */
		tty.sg_flags |= (ODDP|EVENP|CBREAK);
		tty.sg_flags &= ~(ALLDELAY|CRMOD|ECHO|LCASE);
		ioctl(iofd, TIOCSETP, &tty);
		ioctl(iofd, TIOCSETC, &tch);
		did0 = TRUE;
		return OK;
	case 1:
		if(!did0) {
			ioctl(iofd, TIOCEXCL, 0);
			ioctl(iofd, TIOCGETP, &oldtty);
			ioctl(iofd, TIOCGETC, &oldtch);
		}
		tty = oldtty;
		tty.sg_flags |= RAW;
		tty.sg_flags &= ~ECHO;
		ioctl(iofd, TIOCSETP, &tty);
		did0 = TRUE;
		Baudrate = getspeed(tty.sg_ospeed);
		return OK;
#endif
	case 0:
		if(!did0)
			return ERROR;
#ifdef USG
		(void) ioctl(iofd, TCSBRK, 1);	/* Wait for output to drain */
		(void) ioctl(iofd, TCFLSH, 1);	/* Flush input queue */
		(void) ioctl(iofd, TCSETAW, &oldtty);	/* Restore original modes */
		(void) ioctl(iofd, TCXONC,1);	/* Restart output */
#endif
#ifdef V7
		ioctl(iofd, TIOCSETP, &oldtty);
		ioctl(iofd, TIOCSETC, &oldtch);
		ioctl(iofd, TIOCNXCL, 0);
#endif
		return OK;
	default:
		return ERROR;
	}
}

sendbrk()
{
#ifdef V7
#ifdef TIOCSBRK
#define CANBREAK
	sleep(1);
	ioctl(iofd, TIOCSBRK, 0);
	sleep(1);
	ioctl(iofd, TIOCCBRK, 0);
#endif
#endif
#ifdef USG
#define CANBREAK
	ioctl(iofd, TCSBRK, 0);
#endif
}

#ifdef FIONREAD
#define READCHECK
/*
 *  Return non 0 iff something to read from io descriptor f
 */
rdchk(f)
{
	static long lf;

	ioctl(f, FIONREAD, &lf);
	return ((int) lf);
}
#endif

