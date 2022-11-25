# Requires:
# - lualatex with tikz package
# - pdftocairo from poppler
TEXOPTS := --synctex=1 -shell-escape --file-line-error --halt-on-error

all: gaplogo.pdf gaplogo.svg gaplogo.png \
 gaplogo-notext.pdf gaplogo-notext.svg gaplogo-notext.png \
 gaplogo-reduced.pdf gaplogo-reduced.svg gaplogo-reduced.png \
 gaplogo-notext16.png gaplogo-notext32.png gaplogo-notext48.png gaplogo-notext64.png gaplogo-notext128.png

%.pdf: %.tex gaplogo.tex
	lualatex $(TEXOPTS) $<

%.png: %.pdf
	pdftocairo -png -singlefile -r 300 $< $(basename $@ .png)

%.svg: %.pdf
	pdftocairo -svg $< $@


gaplogo-notext16.png: gaplogo-notext.pdf
	sips -z 16 16 -s format png $< --out $@

gaplogo-notext32.png: gaplogo-notext.pdf
	sips -z 32 32 -s format png $< --out $@

gaplogo-notext48.png: gaplogo-notext.pdf
	sips -z 48 48 -s format png $< --out $@

gaplogo-notext64.png: gaplogo-notext.pdf
	sips -z 64 64 -s format png $< --out $@

gaplogo-notext128.png: gaplogo-notext.pdf
	sips -z 128 128 -s format png $< --out $@
