use ExtUtils::MakeMaker;
use ExtUtils::F77;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	      AUTHOR         => 'Ari Jolma (ari.jolma[at]hut.fi)',
              BUILD_REQUIRES => {
                                  ExtUtils::F77 => '0',
                                },
	      PREREQ_PM      => {
                                },
	      NAME	     => 'Statistics::Lmoments',
	      VERSION_FROM   => 'Lmoments.pm',
	      LIBS	     => [" -L/usr/lib " . ExtUtils::F77->runtime],
	      DEFINE	     => '',
	      INC	     => '',
	      MYEXTLIB       => 'lmoments/libclmoments$(LIB_EXT) lmoments/liblmoments$(LIB_EXT) -lc'
	      );

sub MY::postamble {
'
$(MYEXTLIB): lmoments/Makefile
	cd lmoments && $(MAKE) $(PASTHRU)
';
}
