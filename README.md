## NAME
## NAME
   M_anything(3fm) - [M_anything] procedures that use polymorphism to allow arguments of different types generically
   (LICENSE:PD)

## SYNOPSIS
    use M_anything,only : anyinteger_to_string  
    use M_anything,only : anyscalar_to_int64   
    use M_anything,only : anyscalar_to_real    
    use M_anything,only : anyscalar_to_real128 
    use M_anything,only : anyscalar_to_double 
    use M_anything,only : anything_to_bytes
    use M_anything,only : bytes_to_anything
    use M_anything,only : empty, assignment(=) 

## DESCRIPTION
    anyinteger_to_string    convert integer parameter of any kind to string
    anyscalar_to_int64      convert integer parameter of any kind to 64-bit integer
    anyscalar_to_real       convert integer or real parameter of any kind to real
    anyscalar_to_real128    convert integer or real parameter of any kind to real128
    anyscalar_to_double     convert integer or real parameter of any kind to doubleprecision
    anything_to_bytes       convert anything to bytes
    empty                   create an empty array

## EXAMPLE
  Sample program:

## AUTHOR
   John S. Urban

## LICENSE
   MIT

## BUILDING THE MODULE USING make(1) ![gmake](docs/images/gnu.gif)
     git clone https://github.com/urbanjost/M_anything.git
     cd M_anything/src
     # change Makefile if not using one of the listed compilers
     
     # for gfortran
     make clean
     make F90=gfortran gfortran
     
     # for ifort
     make clean
     make F90=ifort ifort

     # REMOVE REFERENCES TO 128-BIT REALS
     # for nvfortran
     make clean
     make F90=nvfortran nvfortran

This will compile the Fortran module and basic example
program that exercise the routine.

## BUILD and TEST with FPM ![-](docs/images/fpm_logo.gif)

   Alternatively, download the github repository and build it with
   fpm ( as described at [Fortran Package Manager](https://github.com/fortran-lang/fpm) )

   ```bash
        git clone https://github.com/urbanjost/M_anything.git
        cd M_anything
        fpm run
        fpm run --example
        fpm test
   ```

   or just list it as a dependency in your fpm.toml project file.

```toml
        [dependencies]
        M_anything        = { git = "https://github.com/urbanjost/M_anything.git" }
```

## DOCUMENTATION

### USER
![manpages](docs/images/manpages.gif)
   - There are man-pages in the repository download in the docs/ directory
     that may be installed on ULS (Unix-Like Systems).

   + [manpages.zip](https://urbanjost.github.io/M_anything/manpages.zip)
   + [manpages.tgz](https://urbanjost.github.io/M_anything/manpages.tgz)

   - a simple index to the man-pages in HTML form for the
   [routines](https://urbanjost.github.io/M_anything/man3.html) 
   and [programs](https://urbanjost.github.io/M_anything/man1.html) 

   - A single page that uses javascript to combine all the HTML
     descriptions of the man-pages is at 
     [BOOK_M_anything](https://urbanjost.github.io/M_anything/BOOK_M_anything.html).

   - [CHANGELOG](docs/CHANGELOG.md) provides a history of significant changes

### DEVELOPER
   - [ford(1) output](https://urbanjost.github.io/M_anything/fpm-ford/index.html).
   - [doxygen(1) output](https://urbanjost.github.io/M_anything/doxygen_out/html/index.html).
   - [github action status](docs/STATUS.md) 
---
## PEDIGREE

## REFERENCES ![-](docs/images/ref.gif)

   * [RFC-4122](https://tools.ietf.org/html/rfc4122)
   * [FOX](http://fortranwiki.org/fortran/show/FoX)
---
