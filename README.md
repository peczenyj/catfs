acme-catfs
==========

Perl Fuse random cat picture [![CPAN version](https://badge.fury.io/pl/Acme-CatFS.png)](http://badge.fury.io/pl/Acme-CatFS) [![Build Status](https://travis-ci.org/peczenyj/catfs.svg?branch=master)](https://travis-ci.org/peczenyj/catfs)

How it works? Simple! You install Acme::CatFS module via cpan ( or cpanm ) and run acme-catfs script

```
  $ acme-catfs --mountpoint /path/to/catfs
 
  # in other terminal
  $ ls /path/to/catfs/cat.jpg     # first time can be slow
  $ gimp /path/to/catfs/cat.jpg   # will open an random picture of cat

  $ acme-catfs -h                 # to see all options
```

It is the equivalent to:

```perl
  Fuse::Simple::main(
    mountpoint => $mountpoint,
    "/"        => {
      'cat.jpg' => sub {
          LWP::Simple::get('http://thecatapi.com/api/images/get?format=src&type=jpg');
       },
    },
  );
```

Dependencies: libfuse-dev

Enjoy
