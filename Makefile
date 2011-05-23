include LaTeX.mk

LATEXFILTER=/usr/share/texmf/scripts/latex-make/latexfilter.pl |\
  grep -v 'Overfull .[vh]box ([^)]*) has occurred while .output is active' |\
  grep -v 'Underfull .[vh]box ([^)]*) has occurred while .output is active' |\
  grep -v 'Overfull .[vh]box ([^)]*) in paragraph at lines ' |\
  grep -v 'Overfull .[vh]box ([^)]*) detected at line ' |\
  grep -v 'hyperref[^r]*removing' | \
  grep -v 'Overfull .[vh]box ([^)]*) detected at line ' |\
  grep  '[a-zA-Z]' |\
  grep -v 'Package hyperref Warning: Token not allowed in a PDFDocEncoded string,' |\
  grep -v 'OT1/cmss/././. ../..'

printable:
	pdftk packaging-tutorial.pdf pract0-dash.pdf pract1-grep.pdf pract2-gnujump.pdf pract3-java.pdf output tutorial-all.pdf
	pdfnup --paper a4paper --no-landscape --nup 2x4 --frame true --offset '0cm 0cm' --delta '0.5mm 0.5mm' --scale 0.965 --suffix 8 tutorial-all.pdf
	pdfnup --paper a4paper --landscape --nup 2x2 --frame true --offset '0cm 0cm' --delta '1mm 1mm' --scale 0.96 --suffix 4 tutorial-all.pdf
