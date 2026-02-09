program scalars
use M_anything,only : anyscalar_to_real
use,intrinsic :: iso_fortran_env, only : int8, int16, int32, int64 
use,intrinsic :: iso_fortran_env, only : real32, real64
!use,intrinsic :: iso_fortran_env, only : real128
implicit none
integer               :: ios

integer(kind=int8)    :: tiny=   huge(0_int8)
integer(kind=int16)   :: small=  huge(0_int16     )
integer(kind=int32)   :: medium= huge(0_int32)
integer(kind=int64)   :: large=  huge(0_int64)
real(kind=real32)     :: rs= huge(0.0_real32)
real(kind=real64)     :: rm= huge(0.0_real64)
!real(kind=real128)    :: rl= huge(0.0_real128)

101 format(a10,"|",i39,"|",i11,"|",i39)
102 format(a10,"|",g0,t55,"|",i11,"|",g0)
   write(*,*)'First show the intrinsic variables of various KINDS we will be using'
   write(*,*) '  NAME   |VALUE                                  |KIND(VALUE)|10**RANGE(VALUE)'
   write(*,102) 'rs     ',rs,     kind(rs),     10.0_real32**range(rs)
   write(*,102) 'rm     ',rm,     kind(rm),     10.0_real64**range(rm)
!   write(*,102) 'rl     ',rl,     kind(rl),     10.0_real128**range(rl)
   write(*,102) 'tiny   ',tiny,   kind(tiny)    
   write(*,102) 'small  ',small,  kind(small)   
   write(*,102) 'medium ',medium, kind(medium)  
   write(*,102) 'large  ',large,  kind(large)   

   write(*,*)'Test squarei with all INTEGER KINDs:'
   write(*,*)'(and given the following facts what is the expected output?)'
   write(*,*)'FACTS:'
   write(*,*)'127 * 127 = 16129'
   write(*,*)'32767 * 32767 = 1073676289'
   write(*,*)'2147483647 * 2147483647 = 4611686014132420609'
   write(*,*)'9223372036854775807 * 9223372036854775807 = 85070591730234615847396907784232501249'
   write(*,*)'170141183460469231731687303715884105727 * 170141183460469231731687303715884105727 =&
   &28948022309329048855892746252171976962977213799489202546401021394546514198529'
   write(*,*)'OUTPUT:'
202 format(a,*(g0:,'; '))
   write(*,202,iostat=ios) 'SQUAREI()  :',squarei(tiny),  squarei(small), squarei(medium), squarei(large) 
   write(*,202,iostat=ios) 'SQUAREI()  :',                squarei(rs),    squarei(rm)
   !write(*,202,iostat=ios) 'SQUAREI()  :',                squarei(rl)    

contains

!! THIS FUNCTION CAN TAKE AN INTEGER OR REAL OF ANY TYPE KNOWN TO ANYSCALAR_TO_REAL() AS AN ARGUMENT
function squarei(invalue) result (dvalue)  ! square an integer value generically
use M_anything, only : anyscalar_to_real
implicit none
class(*),intent(in)  :: invalue
real                 :: invalue_local
real                 :: dvalue
!real,parameter       :: biggest=sqrt(real(0.0,kind=real128))
   invalue_local=anyscalar_to_real(invalue)
   !if(invalue_local.gt.biggest)then
   !   write(*,*)'ERROR:*squarei* input value too big=',invalue_local
   !endif
   dvalue=invalue_local*invalue_local
end function squarei

end program scalars
