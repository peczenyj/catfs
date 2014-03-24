catfs
=====

Perl Fuse random cat picture

How it works? Simple! You install Acme::CatFS via cpan ( or cpanm ) and run catfs script

```
  $ catfs --mountpoint /path/to/catfs
 
  $ ls /path/to/catfs/cat.jpg     # first time can be slow
  $ gimp /path/to/catfs/cat.jpg   # will open an random picture of cat

  $ catfs -h                      # to see all options
```

Enjoy
