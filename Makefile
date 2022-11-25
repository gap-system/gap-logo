# Requires:
# - lualatex with tikz package
# - pdftocairo from poppler
# - svg2png
TEXOPTS := --synctex=1 -shell-escape --file-line-error --halt-on-error

DST = gaplogo.pdf gaplogo.svg gaplogo.png \
 gaplogo-notext.pdf gaplogo-notext.svg gaplogo-notext.png \
 gaplogo-reduced.pdf gaplogo-reduced.svg gaplogo-reduced.png \
 gaplogo-notext32.png gaplogo-notext48.png gaplogo-notext64.png gaplogo-notext128.png gaplogo-notext256.png

all: $(DST)

clean:
	rm -f $(DST)

%.pdf: %.tex gaplogo.tex
	lualatex $(TEXOPTS) $<

%.png: %.pdf
	pdftocairo -png -singlefile -r 300 $< $(basename $@ .png)

%.svg: %.pdf
	pdftocairo -svg $< $@

gaplogo-notext32.png: gaplogo-notext-small.svg
	svg2png --width=32 --height=32 $< $@

gaplogo-notext48.png: gaplogo-notext-small.svg
	svg2png --width=48 --height=48 $< $@

gaplogo-notext64.png: gaplogo-notext-small.svg
	svg2png --width=64 --height=64 $< $@

gaplogo-notext128.png: gaplogo-notext.svg
	svg2png --width=128 --height=128 $< $@

gaplogo-notext256.png: gaplogo-notext.svg
	svg2png --width=256 --height=256 $< $@

.PHONY: all clean
