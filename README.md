# hyrax meta-repository #

This meta-repo will help you build all of the dependencies for the Hyrax reference
implementation, and optionally for the BCCGP-sqrt and Bulletproofs implementations.

Please see the respective README files in each of the following repositories:

- [fennel](https://github.com/hyraxZK/fennel)

- [bccgp](https://github.com/hyraxZK/bccgp)

- [pws](https://github.com/hyraxZK/pws)

- [libpws](https://github.com/hyraxZK/libpws)

- [pymiracl](https://github.com/hyraxZK/pymiracl)

- [pylaurent](https://github.com/hyraxZK/pylaurent)

## prerequisites ##

On Debian-ish systems, you can run the following:

    apt-get install build-essential g++ gcc automake pkg-config libtool \
                    libtool-bin python python-cffi pypy libssl-dev libgmp-dev

In other words, you'll need a C++11-compatible compiler (g++ 5, 6, or 7 will work).

If you are also planning to build BCCGP, you will need to have NTL 10.x available.
Please see the [pylaurent](https://github.com/hyraxZK/pylaurent) README for more information.

## building ##

The top-level Makefile in this directory will build everything below. Just run

    git submodule update --init
    make -j4        # for example

If you want to build BCCGP, you may need a bit more. First, you will need to set
the makefile variable BCCGP to 1, i.e.,

    make -j4 BCCGP=1

Moreover, if NTL is not in a standard location, you'll need to set the NTLDIR
variable on the make commandline:

    make -j4 BCCGP=1 NTLDIR=$HOME/toolchains

# license #

Please consult submodule licenses for more information.

This meta-repo is Copyright 2017 Riad S. Wahby <rsw@cs.stanford.edu> and the Hyrax authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Questions? #

    rsw@cs.stanford.edu
