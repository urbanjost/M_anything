## Name
   M_anything(3fm) - [M_anything] procedures that use polymorphism to allow arguments of different types generically
   (LICENSE:MIT)

## Synopsis
    use M_anything,only : anyscalar_to_string  
    use M_anything,only : anyscalar_to_int64   
    use M_anything,only : anyscalar_to_real    
    use M_anything,only : anyscalar_to_real128 
    use M_anything,only : anyscalar_to_double 
    use M_anything,only : anything_to_bytes
    use M_anything,only : anyinteger_to_string  
    use M_anything,only : bytes_to_anything
    use M_anything,only : empty, assignment(=) 
<!--
![toc](docs/workaround.svg)
-->
## Description

  Generic routines are generally more efficient than casting but can generate a
  large amount of duplicate code. These procedures show how to use casting 
  instead for input parameters. Future versions of Fortran are planned to allow
  for templating as another alternative.

    anyscalar_to_string     convert intrinsic types to a a string
    anyscalar_to_int64      convert integer parameter of any kind to 64-bit integer
    anyscalar_to_real       convert integer or real parameter of any kind to real
    anyscalar_to_real128    convert integer or real parameter of any kind to real128
    anyscalar_to_double     convert integer or real parameter of any kind to doubleprecision
    anyinteger_to_string    convert integer parameter of any kind to string
    anything_to_bytes       convert anything to bytes
    empty                   create an empty array

## Example
  Sample program:
```fortran
      program demo_anyscalar_to_double
      use, intrinsic :: iso_fortran_env, only : int8, int16, int32, int64
      use, intrinsic :: iso_fortran_env, only : real32, real64, real128
      implicit none
         ! call same function with many scalar input types
         write(*,*)squareall(2_int8)
         write(*,*)squareall(2_int16)
         write(*,*)squareall(2_int32)
         write(*,*)squareall(2_int64)
         write(*,*)squareall(2.0_real32)
         write(*,*)squareall(2.0_real64)
         write(*,*)squareall(2.0_real128)
      contains

      function squareall(invalue) result (dvalue)
      use M_anything, only : anyscalar_to_double
      class(*),intent(in)  :: invalue
      doubleprecision      :: invalue_local
      doubleprecision      :: dvalue
         invalue_local=anyscalar_to_double(invalue)
         dvalue=invalue_local*invalue_local
      end function squareall

      end program demo_anyscalar_to_double
```
    Results:

```text
        4.00000000000000
        4.00000000000000
        4.00000000000000
        4.00000000000000
        4.00000000000000
        4.00000000000000
        4.00000000000000
```
## Author
   John S. Urban

## License
   MIT

---
![gmake](docs/images/gnu.gif)
---

## Building the Module Using make(1)
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

---
![-](docs/images/fpm_logo.gif)
---

## Build and Test with fpm

   Alternatively, download the github repository and build it with
   fpm ( as described at [Fortran Package Manager](https://github.com/fortran-lang/fpm) )

   ```bash
        git clone https://github.com/urbanjost/M_anything.git
        cd M_anything
        fpm run "*"
        fpm run --example "*"
        fpm test
   ```

   or just list it as a dependency in your fpm.toml project file.

```toml
        [dependencies]
        M_anything        = { git = "https://github.com/urbanjost/M_anything.git" }
```

---
![docs](docs/images/docs.gif)
---

## Documentation

### User
![man-pages](docs/images/manpages.gif)

   - a simple index to the man-pages in HTML form for the
   [routines](https://urbanjost.github.io/M_anything/man3.html) 

   - A single page that uses javascript to combine all the HTML
     descriptions of the man-pages is at 
     [BOOK_M_anything](https://urbanjost.github.io/M_anything/BOOK_M_anything.html).

   - There are man-pages in the repository download in the docs/ directory
     that may be installed on ULS (Unix-Like Systems).

   + [manpages.zip](https://urbanjost.github.io/M_anything/manpages.zip)
   + [manpages.tgz](https://urbanjost.github.io/M_anything/manpages.tgz)

   - [CHANGELOG](docs/CHANGELOG.md) provides a history of significant changes

### Developer
   - [ford(1) output](https://urbanjost.github.io/M_anything/fpm-ford/index.html).
   - [doxygen(1) output](https://urbanjost.github.io/M_anything/doxygen_out/html/index.html).
   - [github action status](docs/STATUS.md) 
<!--
---
## Pedigree

---
![-](docs/images/ref.gif)
---

## References

   * [RFC-4122](https://tools.ietf.org/html/rfc4122)
   * [FOX](http://fortranwiki.org/fortran/show/FoX)
-->
---
