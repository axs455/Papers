#!/bin/sh
convert  RV3_Coherence_Z1D.png -geometry x630 1.png
convert  RV3_Coherence_Z2D.png -geometry x621 2.png
convert  RV3_Coherence_Z5D.png -geometry x621 3.png
convert RV3_Coherence_Z10D.png -geometry x635 4.png

montage -label 'L=1D' 1.png -label 'L=2D' 2.png -label 'L=5D' 3.png -label 'L=10D' 4.png -tile 4x1 -geometry +4+4 -gravity center -pointsize 25 RV3_Coherence.png

# -------------------------------------

convert  RV5_Coherence_Z1D.png -geometry x630 1.png
convert  RV5_Coherence_Z2D.png -geometry x621 2.png
convert  RV5_Coherence_Z5D.png -geometry x621 3.png
convert RV5_Coherence_Z10D.png -geometry x635 4.png

montage -label 'L=1D' 1.png -label 'L=2D' 2.png -label 'L=5D' 3.png -label 'L=10D' 4.png -tile 4x1 -geometry +4+4 -gravity center -pointsize 25 RV5_Coherence.png

# -------------------------------------

convert  RV5p9_Coherence_Z1D.png -geometry x630 1.png
convert  RV5p9_Coherence_Z2D.png -geometry x621 2.png
convert  RV5p9_Coherence_Z5D.png -geometry x621 3.png
convert RV5p9_Coherence_Z10D.png -geometry x635 4.png

montage -label 'L=1D' 1.png -label 'L=2D' 2.png -label 'L=5D' 3.png -label 'L=10D' 4.png -tile 4x1 -geometry +4+4 -gravity center -pointsize 25 RV5p9_Coherence.png

rm -f 1.png 2.png 3.png 4.png
