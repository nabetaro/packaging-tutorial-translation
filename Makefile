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

