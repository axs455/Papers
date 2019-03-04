set terminal epslatex color fontscale 1.0 size 3.5,3.5 font "Times,12"
set key right top spacing 1.1 
set size ratio 1
unset grid
set format y "%2.1f"
set format x "%g"

set linestyle 1 lc rgb "black"       linewidth 4
set linestyle 2 lc rgb "dark-violet" linewidth 4
set linestyle 3 lc rgb "sea-green"   linewidth 4
set linestyle 4 lc rgb "red"         linewidth 4

set linestyle 11 lc rgb "black"       dashtype 6 linewidth 4
set linestyle 12 lc rgb "dark-violet" dashtype 6 linewidth 4
set linestyle 13 lc rgb "sea-green"   dashtype 6 linewidth 4
set linestyle 14 lc rgb "red"         dashtype 6 linewidth 4

#
# A/D plot
#
set ylabel "$\\bar{A}/D$"  offset 1,0
set xlabel "$V_{R}$"
set yrange [0:1.2]
set xrange [0:16]
set output 'viv_amp_noyaw.eps'

set label 1 'Initial Excitation' at 2.0,0.1 rotate by 80
set label 2 'Upper'              at 4,1.05
set label 3 'Lower'              at 8,0.68
set label 4 'Desynchronization'  at 8,0.19  

plot 'ExpIII_VIV.dat' i 0 u 1:2 t 'Exp' w p ls 1 ps 1.5, \
      '' i 1 smooth bezier t '' ls 1, \
      '' i 2 smooth bezier t '' ls 1, \
      '' i 3 smooth bezier t '' ls 1, \
      'sim_VIV.dat'   i 0 u 1:2 t 'DES' w p ls 2 pt 6 ps 2

unset label 1
unset label 2
unset label 3
unset label 4
set key left top
set yrange[0:3.5]
set ytics 0.5
set ylabel '$f_v/f_N$'

set output 'viv_freq_noyaw.eps'
plot 'ExpIII_VIV.dat' i 4 u 1:2 t 'Exp' w p ls 1 ps 1.5, \
      'sim_VIV.dat' i 1 u 1:2 t 'DES'  w p ls 2 pt 6 ps 2, \
      0.21*x t '' ls 11, \
      1 t '' lc rgb "black" dashtype 5 linewidth 4

set output 'junk.eps'
plot sin(x)

!${HOME}/bin/latexit.pl viv_amp_noyaw
!${HOME}/bin/latexit.pl viv_freq_noyaw
!rm -f *.eps *.tex junk.*
