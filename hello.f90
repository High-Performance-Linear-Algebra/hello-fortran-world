program hello
    use iso_fortran_env, only: output_unit
    implicit none
    write(output_unit, '("Hello, World!")')
end program hello