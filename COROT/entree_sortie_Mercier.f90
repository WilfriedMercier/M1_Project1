module entree_sortie_Mercier
!Mercier Wilfried
!01/12/2017
!Module contenant ecriture_fourier et lecture_corot

implicit none
contains


subroutine lecture_corot(tps, flx)
!Subroutine qui lit les donnes corot du temps et du flux
implicit none
                      !Declaration variables
double precision, dimension(*), intent(inout) :: flx, tps
integer(kind=8) :: nb_l, i, ios

open(33, file='hd52265_corotdata.dat', action='read', status='old',&
     iostat=ios)
if (ios.ne.0) write(*,*)"Probleme ouverture fichier"
read(33,*)nb_l

do i=1, nb_l
   read(33,*)tps(i),flx(i)
enddo

close(33)
end subroutine lecture_corot



subroutine ecriture_fourier(freq, puis, nbft)
!subroutine qui ecrit les freq et puissances de la transforme

implicit none
             !Declaration variables
integer(kind=8), intent(in) :: nbft
double precision, dimension(*), intent(in) :: freq, puis
integer(kind=8) :: i, ios

             !Ouverture fichier sortie
open(34, file='puissance_52265_Mercier.dat', action='write',&
     status='replace', iostat=ios)
if (ios.ne.0) write(*,*) "Probleme ouveture fichier de sortie"

            !Ecriture
do i=1, nbft
   write(34,*)freq(i),puis(i)
enddo

close(34)
end subroutine ecriture_fourier
end module entree_sortie_Mercier
