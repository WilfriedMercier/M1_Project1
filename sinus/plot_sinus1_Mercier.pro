;MERCIER Wilfried
;24/11/2017
;lecture sinus
readcol, 'sinus1_Mercier.dat', temps, s

plot, temps(1:1000/30), s(1:1000/30), title='sinus en fonction du temps',$
xtitle='temps t(jours)', ytitle='s', xstyle=1., ystyle=1.

end
