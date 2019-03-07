set terminal epslatex color fontscale 1.0 size 3.5,3.5 font "Times,12"
set key right top spacing 1.1 
set size ratio 1
set format y "%2.1f"
set format x "%g"
set linestyle 1 lc rgb "black"       linewidth 3
set linestyle 2 lc rgb "dark-violet" linewidth 3
set linestyle 3 lc rgb "sea-green"   linewidth 3
set linestyle 4 lc rgb "red"         linewidth 3
set linestyle 5 lc rgb "blue"        linewidth 3

set linestyle 11 lc rgb "black"       dashtype 6 linewidth 3
set linestyle 12 lc rgb "dark-violet" dashtype 6 linewidth 3
set linestyle 13 lc rgb "sea-green"   dashtype 6 linewidth 3
set linestyle 14 lc rgb "red"         dashtype 6 linewidth 3
set linestyle 15 lc rgb "blue"        dashtype 6 linewidth 3

#
# Spectra
#
set ylabel "PSD"  offset 1,0
set xlabel "Non-dimensional frequency, $k$"
set ytics 0.1
set yrange [0.0:0.3]
set xrange [0.0:0.5]

set terminal epslatex color fontscale 1.0 size 4,4 font "Times,12"
set key top right box opaque width 1.05 height 1.05
set label 1 "$k_N$" at 0.21,0.2
set output 'spectra_RV5.eps'
set arrow 1 from 0.2,0 to 0.2,0.3 ls 11 nohead
plot 'StPSD_force_Z1.csv'  u 1:2 t '$L/D$=1'  w lp ls 4 pt 1 ps 1.5, \
     'StPSD_force_Z2.csv'  u 1:2 t '$L/D$=2'  w lp ls 5 pt 2 ps 1.5, \
     'StPSD_force_Z5.csv'  u 1:2 t '$L/D$=5'  w lp ls 3 pt 4 ps 1.5, \
     'StPSD_force_Z10.csv' u 1:2 t '$L/D$=10' w lp ls 2 pt 6 ps 1.5 

unset label 1
set key left top
set output 'spectra_RV5_log.eps'
set logscale x
set format y "10^{%+3T}"
set logscale y
set xrange[0.01:1]
set yrange[0.00001:1]
set ytics
set arrow 1 from .333,.00001 to 0.333,1.0 ls 11 nohead
plot 'StPSD_force_Z1.csv'  u 1:2 t '$L/D$=1'  w l ls 4, \
     'StPSD_force_Z2.csv'  u 1:2 t '$L/D$=2'  w l ls 5, \
     'StPSD_force_Z5.csv'  u 1:2 t '$L/D$=5'  w l ls 3, \
     'StPSD_force_Z10.csv' u 1:2 t '$L/D$=10' w l ls 2


set output 'junk.eps'
plot sin(x)

!${HOME}/bin/latexit.pl spectra_RV5
!${HOME}/bin/latexit.pl spectra_RV5_log
!rm -f *.eps *.tex junk.*
