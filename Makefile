# makefile for hyraxZK meta-package
#
# (C) 2018 Riad S. Wahby <rsw@cs.nyu.edu>
#
# build hyraxZK

NTLDIR ?= "yes"
BCCGP ?= 0
export NTLDIR BCCGP
.PHONY: default all submodules clean distclean
default: submodules
	@+$(MAKE) all

# make a target depend on the value of a variable
# this solution is from https://stackoverflow.com/questions/26145267/
define REMEMBER_VAR
.PHONY: phony
$1: phony
	@if [ "`cat $1 2>&1`"x != "$($1)"x ]; then echo -n $($1) > $1; fi
endef
$(eval $(call REMEMBER_VAR,NTLDIR))
$(eval $(call REMEMBER_VAR,BCCGP))

ifeq ($(BCCGP),1)
all: libpws/config.log pylaurent/config.log pymiracl/config.log BCCGP
	@+$(MAKE) -C pylaurent
else
all: libpws/config.log pymiracl/config.log BCCGP
endif
	@+$(MAKE) -C libpws
	@+$(MAKE) -C pymiracl

submodules:
	@git submodule update --init --recursive

%/configure: %/configure.ac
	cd $* && ./autogen.sh

ifeq ($(BCCGP),1)
pylaurent/config.log: pylaurent/configure NTLDIR
	@cd pylaurent && ./configure --with-ntl=$(NTLDIR)
endif

%/config.log: %/configure
	@cd $* && ./configure

clean:
	@+-$(MAKE) -C libpws distclean
	@+-$(MAKE) -C pylaurent distclean
	@+-$(MAKE) -C pymiracl distclean
	@rm -f NTLDIR BCCGP

distclean: clean
	@git submodule foreach git clean -xffd .
