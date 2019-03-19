program sismo_Mercier
!Mercier Wilfried
!01/12/2017
!Calcule et ecrit dans un fichier le spectre en puissance des donnes de COROT
!Compilation
!gfortran -o sismo_Mercier.x entree_sortie_Mercier.f90 fourier_Mercier.f90 sismo_Mercier.f90
!Execution
!./sismo_Mercier.x

use entree_sortie_Mercier
use fourier_Mercier
implicit none

                      !Declaration variables
double precision, dimension(:), allocatable :: flux, temps, puissance, freq
integer(kind=8) :: nb_lignes, ios, i, Nf
double precision, parameter :: nu_c = 3.d-3 !Hz

                      !Lecture nb de lignes
open(33, file='hd52265_corotdata.dat', action='read', status='old',&
     iostat=ios)
if (ios.ne.0) write(*,*)"Probleme ouverture fichier d'entree"
read(33,*)nb_lignes
close(33)

                       !Allocation tableaux
allocate(temps(nb_lignes))
allocate(flux(nb_lignes))

                !Lecture du temps et du flux relatif
call lecture_corot(temps, flux)

               !Calcul de nb de frequences de fourier
Nf = nu_c*( temps(nb_lignes) - temps(0) )

               !Allocation tableaux freq et puissance
allocate(freq(Nf))
allocate(puissance(Nf))

               !Calcul transfo de Fourier
call calcul_fourier(nb_lignes, flux, temps, Nf, freq, puissance)

               !Ecriture freq et puissances
call ecriture_fourier(freq, puissance, Nf)

                          !Desallocation
deallocate(temps)
deallocate(flux)
deallocate(freq)
deallocate(puissance)

end program sismo_Mercier
