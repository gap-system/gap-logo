TEXOPTS := --synctex=1 -shell-escape --file-line-error --halt-on-error

all: gaplogo.pdf gaplogo.svg gaplogo.png gaplogo-notext.pdf gaplogo-notext.png \
 gaplogo-notext16.png gaplogo-notext32.png gaplogo-notext48.png gaplogo-notext64.png gaplogo-notext128.png

gaplogo.pdf: gaplogo.tex
	lualatex $(TEXOPTS) $<

gaplogo.png: gaplogo.pdf
	sips -s format png $< --out $@

gaplogo.svg: gaplogo.pdf
	pdf2svg $< $@


gaplogo-notext.pdf: gaplogo-notext.tex
	lualatex $(TEXOPTS) $<

gaplogo-notext.png: gaplogo-notext.pdf
	sips -s format png $< --out $@



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
