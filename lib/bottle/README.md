![bottle](https://raw.githubusercontent.com/crystal-data/bottle/master/static/bottle_logo.png)

[![Build Status](https://travis-ci.org/crystal-data/bottle.svg?branch=master)](https://travis-ci.org/crystal-data/bottle) [![Join the chat at https://gitter.im/crystal-data/bottle](https://badges.gitter.im/crystal-data/bottle.svg)](https://gitter.im/crystal-data/bottle?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Bottle is the core shard needed for scientific computing with Crystal

- **Website:** https://crystal-data.github.io/bottle
- **API Documentation:** https://crystal-data.github.io/bottle/
- **Source code:** https://github.com/crystaldata/bottle
- **Bug reports:** https://github.com/crystaldata/bottle/issues

It provides:

- An n-dimensional `Tensor` data structure
- sophisticated reduction and accumulation routines
- data structures that can easily be passed to C libraries
- powerful linear algebra routines backed by LAPACK and BLAS

## Prerequisites

Bottle relies on OpenBLAS and LAPACK for many underlying computations, and the
development packages must be present for Bottle to work correctly.

For Debian, use `libopenblas-dev` and `liblapack-dev`.  For other operating
systems review the relevant installation instructions for that OS.

## Usage

Bottle provides data structures that facilitate element-wise operations,
accumulations, and reductions.  While some operations are backed by BLAS
and LaPACK, many vectorized operations use iteration written in Crystal.
The primary goal of this library was to provide a NumPy like interface in
Crystal, and performance will be revisited constantly as the library is
improved.


## Getting Started

To learn how to use the basic functionality of Bottle, check out the [quickstart guide](https://crystal-data.github.io/bottle/user/quickstart.html).

Contributing
------------
Bottle requires help in many different ways to continue to grow as a shard.
Contributions such as high level documentation and code quality checks are needed just
as much as API enhancements.  If you are considering larger scale contributions
that extend beyond minor enhancements and bug fixes, contact Crystal Data
in order to be added to the organization to gain access to review and merge
permissions.
