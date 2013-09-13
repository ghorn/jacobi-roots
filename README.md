jacobi-roots
===

[![Build Status](https://secure.travis-ci.org/ghorn/jacobi-roots.png?branch=master)](http://travis-ci.org/ghorn/jacobi-roots)

This package provides roots of shifted Radau and Legendre polynomials to double precision.

The roots are precomputed using a Mathematica script, and degrees of up to a few hundred are provided.

[Usage documentation is on hackage](http://hackage.haskell.org/package/jacobi-roots)

To build this from scratch, first run compute_roots.nb in Mathematica to generate gen/JacobiRootsRaw.hs. Then type "make" to run gen/Convert.hs, which creates src/JacobiRootsBs.hs. Then the normal "cabal configure; cabal build".
