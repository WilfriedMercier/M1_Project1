program sinus1_Mercier
!MERCIER Wilfried
!23/11/2017
!genere une sinusoide
!Compilation
!gfortran -o sinus1_Mercier.x sinus1_Mercier.f90
!Execution
!./sinus1_Mercier.x

implicit none
                !Declaration variables
double precision :: s
integer(kind=8) :: ios=0, count=0, temps=0
                !Declaration constantes
double precision, parameter :: nu0=2.D-3 !nu0 frequence en Hz
double precision, parameter :: PI=4*atan(1.)
integer(kind=8), parameter :: A=2, t_max=5*24*3600

                !Ouverture fichier
open(30, file='sinus1_Mercier.dat', action='write', status='replace',& 
     iostat=ios)
if (ios.ne.0) write(*,*)"Probleme d'ouverture de fichier"

         !Determination du nombre de points
do while(temps <= t_max)
   count = count+1
   temps = temps+30
enddo
write(30,*)count
write(*,*)"Duree : 5 jours - Nb points : ",count

             !Calcul et ecriture des valeurs de s
temps = 0
do while(temps <= t_max)
   s = A*cos(2*PI*nu0*temps)
   write(30,*)temps, s
   temps = temps + 30
enddo

close(30)
end program sinus1_Mercier
