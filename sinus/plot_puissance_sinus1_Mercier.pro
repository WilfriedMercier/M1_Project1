;MERCIER Wilfried
;24/11/2017
;Affiche la transformee de Fourier du sinus

readcol, 'puissance_sinus1_Mercier.dat', F='D,D', freq, puissance

plot, freq*1e3, puissance, title='spectre de puissance du sinus', xtitle='frequence nu(mHz)',$
ytitle='puissance', xstyle=1., ystyle=1., charsize=1.5

set_plot, 'ps'
device, filename='puissance_sinus1_Mercier.ps'
plot, freq*1e3, puissance, title='spectre de puissance du sinus', xtitle='frequence nu(mHz)',$
ytitle='puissance', xstyle=1., ystyle=1., charsize=1.5
device, /close
set_plot, 'X'
stop

end
