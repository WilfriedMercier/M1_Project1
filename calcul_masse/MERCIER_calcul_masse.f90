program MERCIER_calcul_masse
!8/12/2017
!MERCIER Wilfried
!Compilation gfortran -o Mercier_masse.x MERCIER_calcul_masse.f90
!Execution ./Mercier_masse.x

double precision :: delta_nu, f_max, T_eff, T_sol, f_sol, f_max_2, delta_nu_2
double precision :: delta_sol, delta_T, delta_f_max, delta_delta_nu
double precision :: R, M, delta_R, delta_M

!Donnees perso
delta_nu = 0.099035570 !mHz
f_max = 2.0425540 !mHz
T_eff = 6100 !K
delta_T = 60 !K
T_sol = 5800 !K
f_sol = 3.15 !mHz
delta_sol = 0.1349 !mHz

!Meilleur donnes
f_max_2 = 2.09 !mHz
delta_nu_2 = 0.0983 ! mHz
delta_f_max = 0.02 !mHz
delta_delta_nu = 0.1d-3 !mHz

R = (f_max/f_sol) * (delta_sol/delta_nu)**2 * (T_eff/T_sol)**0.5
M = (f_max/f_sol)**3 * (delta_sol/delta_nu)**4 * (T_eff/T_sol)**1.5

write(*,*)"rayon = ", R, " R_sol", " masse = ", M, " M_sol"

R = (f_max_2/f_sol) * (delta_sol/delta_nu_2)**2 * (T_eff/T_sol)**0.5
M = (f_max_2/f_sol)**3 * (delta_sol/delta_nu_2)**4 * (T_eff/T_sol)**1.5

delta_R = sqrt( (delta_f_max/f_max_2)**2 + (2*delta_delta_nu/delta_nu_2)**2 + (0.5*delta_T/T_eff)**2 )
delta_M = sqrt( (3*delta_f_max/f_max_2)**2 + (4*delta_delta_nu/delta_nu_2)**2 + (1.5*delta_T/T_eff)**2 )

write(*,*)"rayon et masse plus precises :"
write(*,*)R, " R_sol ", M, " M_sol"
write(*,*)"precisions relatives :"
write(*,*)"rayon : ", delta_R, " masse : ", delta_M
end program
