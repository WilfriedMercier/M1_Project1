program puissance_sinus1_Mercier
!Mercier Wilfried
!24/11/2017
!Calcule le spectre en puissance de la sinusoide
!Compilation
!gfortran -o puissance_sinus1_Mercier.x puissance_sinus1_Mercier.f90
!Execution
!./puissance_sinus1_Mercier.x

implicit none
             !Declaration de variables
!puissance -> puissance de Fourier pour chaque frequence de Fourier
!freq -> frequences de Fourier
!Nf -> nb points de la transformee de Fourier
integer(kind=8) :: i, ios=0, nb_lignes, Nf
double precision, dimension(:), allocatable :: signal
integer(kind=8), dimension(:), allocatable :: temps
double precision, dimension(:), allocatable :: frequence, puissance

                !Ouverture fichier entree
open(30, file='sinus1_Mercier.dat', action='read', status='old', iostat=ios)
if (ios.ne.0) write(*,*)"Probleme ouverture fichier entree"

         !Lecture nb de lignes et calcul de Nf
read(30,*)nb_lignes

if (mod(nb_lignes, 2).eq.0) then
   Nf = nb_lignes/2 + 1
else
   Nf = (nb_lignes+1)/2
endif
write(*,*)"Nombre de frequences de Fourier : ", Nf

                !Allocation tableaux
allocate(temps(nb_lignes))
allocate(signal(nb_lignes))
allocate(frequence(Nf+1))
allocate(puissance(Nf+1))

do i=1,nb_lignes
   read(30,*)temps(i), signal(i)
enddo

           !Fermeture fichier
close(30)

frequence=0
           !Calcul tranforme fourier
call calcul_fourier(nb_lignes,signal,temps,Nf,frequence,puissance)

            !Desallocation de temps et signal
deallocate(temps)
deallocate(signal)

           !Ouverture fichier sortie
open(31, file='puissance_sinus1_Mercier.dat', action='write', status='replace', iostat=ios)
if (ios.ne.0) write(*,*)"Probleme ouverture fichier sortie"

           !Ecriture dans le fichier
write(31,*)Nf
do i=1, Nf
   write(31,*)frequence(i), puissance(i)
enddo

            !Desallocation
deallocate(frequence)
deallocate(puissance)

end program puissance_sinus1_Mercier


subroutine calcul_fourier(npts, signal, temps, nbft, freq, puis)
!subroutine qui calcule la transforme de Fourier

implicit none
             !Declaration variables
integer(kind=8), intent(in) :: npts, nbft
double precision, dimension(*), intent(in) :: signal
double precision, dimension(*), intent(out) :: freq
double precision, dimension(*), intent(out) :: puis
integer(kind=8), dimension(*), intent(in) :: temps
double precision :: delta_nu !delta_nu -> resolution frequence
double precision :: F_reel, F_imag !Fourier reel et imaginaire
double precision :: PI=4*atan(1.)
integer(kind=8) :: k, p

                !Calcul valeurs
delta_nu = 1./(temps(npts) - temps(1))
write(*,*)"Resolution frequentielle : ", delta_nu*1.d6, "µHz"

do k=0, nbft
   freq(k+1) = k*delta_nu
   F_reel = 0
   F_imag = 0
   do p=1, npts
      F_reel = F_reel + signal(p)*cos(2*PI*freq(k+1)*temps(p))
      F_imag = F_imag + signal(p)*sin(2*PI*freq(k+1)*temps(p))
   enddo
   puis(k+1) =4*(F_reel*F_reel + F_imag*F_imag)/(npts*npts)
enddo

end subroutine calcul_fourier
