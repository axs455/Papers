set terminal epslatex color fontscale 1.0 size 5,5 font "Times,12"
set key right top spacing 1.1 box
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
set ylabel "$A/D$"  offset 1,0
set xlabel "$V_{R,n}$"
set yrange [0:1.2]
set xrange [0:16]
set output 'viv_amp_noyaw.eps'

set label 1 'Initial Excitation branch' at 2.0,0.1 rotate by 80
set label 2 'Upper branch'              at 4,1.05
set label 3 'Lower branch'              at 8,0.68
set label 4 'Desynchronization'         at 12,0.19  

plot 'ExpIII_VIV.dat' i 0 u 1:2 t 'Exp III' w p ls 1 ps 1.5, \
      '' i 1 smooth bezier t '' ls 1, \
      '' i 2 smooth bezier t '' ls 1, \
      '' i 3 smooth bezier t '' ls 1, \
      'ExpII_VIV.dat' i 0 u 1:2 t 'Exp II' w p ls 2 ps 1.5, \
      'sim_VIV.dat'   i 0 u 1:2 t 'DES' w p ls 3 pt 5 ps 2

set output 'viv_independence.eps'
plot 'sim_VIV.dat'    i 0 u 1:2 t '$\beta=0^\circ$'  w p ls 3 pt 5 ps 2, \
     'sim_VIV.dat'    i 0 u 1:3 t '$\beta=45^\circ$' w p ls 3 pt 4 ps 3, \
     'ExpIII_VIV.dat' i 1 smooth bezier t 'Exp III, $\beta=0^\circ$' ls 1, \
      ''              i 2 smooth bezier t '' ls 1, \
      ''              i 3 smooth bezier t '' ls 1

unset label 1
unset label 2
unset label 3
unset label 4
set key right bottom
set output 'viv_independence_Exp.eps'
plot 'ExpII_VIV.dat' i 0 u 1:2 t 'Exp II, $\beta=0^\circ$'       w p ls 1 pt 6 ps 1.5, \
     'ExpII_VIV.dat' i 2 u 1:2 t 'Exp II, $\beta=45^\circ$ (Up)' w p ls 2 pt 1 ps 1.5, \
     'ExpII_VIV.dat' i 1 u 1:2 t 'Exp II, $\beta=45^\circ$ (Dn)' w p ls 2 pt 2 ps 1.5

set key left top
set output 'viv_amp_yaw45.eps'
plot 'ExpII_VIV.dat' i 2 u 1:2 t 'Exp II - Up' w p ls 2 pt 1 ps 1.5, \
     'ExpII_VIV.dat' i 1 u 1:2 t 'Exp II - Dn' w p ls 2 pt 2 ps 1.5, \
     'sim_VIV.dat'   i 0 u 1:3 t 'DES' w p ls 3 pt 5 ps 2

set key left top
set yrange[0:3.5]
set ytics 0.5
set ylabel '$f_v/f_N$'
set output 'viv_freq.eps'
plot 'ExpIII_VIV.dat' i 4 u 1:2 t 'Exp III' w p ls 1 ps 1.5, \
      'sim_VIV.dat' i 1 u 1:2 t 'DES, $\beta=0^\circ$'  w p ls 3 pt 5 ps 2, \
      'sim_VIV.dat' i 1 u 1:3 t 'DES, $\beta=45^\circ$' w p ls 3 pt 6 ps 3, \
      0.21*x t '' ls 12, \
      1 t '' ls 11


set output 'junk.eps'
plot sin(x)

!${HOME}/bin/latexit.pl viv_amp_noyaw
!${HOME}/bin/latexit.pl viv_amp_yaw45
!${HOME}/bin/latexit.pl viv_independence
!${HOME}/bin/latexit.pl viv_independence_Exp
!${HOME}/bin/latexit.pl viv_freq
!rm -f *.eps *.tex junk.*
