use strict;
use warnings;
package Acme::CatFS;

# ABSTRACT: Fuse filesystem with a random pic of a cat

use LWP::Simple;
use Fuse::Simple;

use Moo;
use MooX::Options;
use Types::Path::Tiny qw(Dir);

option mountpoint => ( 
  is       => 'ro', 
  isa      => Dir,
  required => 1,
  format   => 's',
  coerce   => Dir->coercion,
  doc      => 'mount point for catfs (should be a directory)',
);

option cat_url => (
  is      => 'ro',
  format  => 's',
  default => sub {
    'http://thecatapi.com/api/images/get?format=src&type=jpg'
  },
  doc     => 'url used to find a random pic of a cat (default thecatapi.com)',
);

option forking => (
  is  => 'ro',
  doc => 'if enable, will fork and exit (default false)',
);

option debug => (
  is  => 'ro',
  doc => 'if enable, will run Fuse::Simple in debug mode (default false)',
);

sub run {
  my ($self) = @_;

  if($self->forking){
    fork and exit  
  }

  Fuse::Simple::main(
    mountpoint => $self->mountpoint,
    debug      => $self->debug,
    '/'        => {
      'cat.jpg' => sub {
        eval { LWP::Simple::get($self->cat_url) }
      },
    },
  );
}

=head1 NAME

Acme::CatFS

=head1 SYNOPSIS

  Acme::CatFS->new(mountpoint => '/tmp/catfs')->run();
=cut

1;
