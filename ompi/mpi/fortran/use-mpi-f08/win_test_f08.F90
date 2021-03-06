! -*- f90 -*-
!
! Copyright (c) 2010-2013 Cisco Systems, Inc.  All rights reserved.
! Copyright (c) 2009-2012 Los Alamos National Security, LLC.
!               All Rights reserved.
! Copyright (c) 2019-2020 Research Organization for Information Science
!                         and Technology (RIST).  All rights reserved.
! $COPYRIGHT$

#include "mpi-f08-rename.h"

subroutine MPI_Win_test_f08(win,flag,ierror)
   use :: mpi_f08_types, only : MPI_Win
   ! See note in mpi-f-interfaces-bind.h for why we "use mpi" here and
   ! call a PMPI_* subroutine below.
   use :: mpi, only : PMPI_Win_test
   implicit none
   LOGICAL, INTENT(OUT) :: flag
   TYPE(MPI_Win), INTENT(IN) :: win
   INTEGER, OPTIONAL, INTENT(OUT) :: ierror
   integer :: c_ierror

   call PMPI_Win_test(win%MPI_VAL,flag,c_ierror)
   if (present(ierror)) ierror = c_ierror
end subroutine MPI_Win_test_f08
