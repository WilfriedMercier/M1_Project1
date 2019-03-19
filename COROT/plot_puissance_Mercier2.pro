;MERCIER Wilfried
;01/12/2017
;Affiche la transformee de Fourier de COROT

readcol, 'puissance_52265_Mercier.dat', F='D,D', freq, puissance

plot, freq*1e3, puissance, title='spectre de puissance donnees COROT', xtitle='frequence nu(mHz)',$
ytitle='puissance', xstyle=1., ystyle=1., charsize=1.5, xrange=[1.6,2.5], yrange=[0,6]

set_plot, 'ps'
device, filename='puissance_52265_Mercier2.ps'
plot, freq*1e3, puissance, title='spectre de puissance donnees COROT', xtitle='frequence nu(mHz)',$
ytitle='puissance', xstyle=1., ystyle=1., charsize=1.5, xrange=[1.6,2.5], yrange=[0,6]
device, /close
set_plot, 'X'
stop

end
