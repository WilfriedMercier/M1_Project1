module fourier_Mercier
!Mercier Wilfried
!01/12/2017
!Calcule de la transformee de Fourier

implicit none
contains

subroutine calcul_fourier(npts, signal, temps, nbft, freq, puis)
!subroutine qui calcule la transforme de Fourier

implicit none
             !Declaration variables
integer(kind=8), intent(in) :: npts, nbft
double precision, dimension(*), intent(in) :: signal
double precision, dimension(*),intent(inout) :: freq, puis
double precision, dimension(*), intent(out) :: temps
double precision :: delta_nu !delta_nu -> resolution frequence
double precision :: F_reel, F_imag !Fourier reel et imaginaire
double precision :: PI=4*atan(1.)
integer(kind=8) :: k, p, ios

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
   puis(k+1) = 4*(F_reel*F_reel + F_imag*F_imag)/(npts*npts)
enddo

end subroutine calcul_fourier
end module fourier_Mercier
