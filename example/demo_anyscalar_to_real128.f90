    program demo_anyscalar_to_real128
    use, intrinsic :: iso_fortran_env, only :  &
    &  sp=>real32,  dp=>real64,  qp=>real128,  &
    &  i8=>int8,    i16=>int16,  i32=>int32,   i64=>int64
    implicit none
       ! call function with various intrinsic numeric types
       write(*,*)minall(2_i8, 3_i16, 4_i32, 5_i64, 6.0_sp, 7.0_dp, 8.0_qp)
       write(*,*)minall(2.0_qp, 2.0_dp, 2.0_sp, 2_i8, 2_i16, 2_i32, 2_i64)
       write(*,*)min(2.0_qp, 2.0_dp)
       write(*,*)min(2.0_qp, 2.0_dp, 2.0_sp, 2_i8, 2_i16, 2_i32, 2_i64)
    contains

    function minall(a,b,c,d,e,f,g) result (value)
    use M_anything, only : x=>anyscalar_to_real128
    class(*),intent(in)  :: a,b,c,d,e,f,g
    real(kind=qp)        :: value
       value=min( x(a),x(b),x(c),x(d),x(e),x(f),x(g) )
    end function minall

    end program demo_anyscalar_to_real128
