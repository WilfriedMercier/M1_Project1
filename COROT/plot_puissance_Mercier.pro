;MERCIER Wilfried
;01/12/2017
;Affiche la transformee de Fourier de COROT

readcol, 'puissance_52265_Mercier.dat', F='D,D', freq, puissance

plot, freq*1e3, puissance, title='spectre de puissance donnees COROT', xtitle='frequence nu(mHz)',$
ytitle='puissance', xstyle=1., ystyle=1., charsize=1.5, xrange=[2.12,2.32], yrange=[0,4]

set_plot, 'ps'
device, filename='puissance_52265_Mercier.ps'
plot, freq*1e3, puissance, title='spectre de puissance donnees COROT', xtitle='frequence nu(mHz)',$
ytitle='puissance', xstyle=1., ystyle=1., charsize=1.5, xrange=[2.12,2.32], yrange=[0,4]
device, /close
set_plot, 'X'
stop

end

