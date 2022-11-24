TEXOPTS := --synctex=1 -shell-escape --file-line-error --halt-on-error

all: gaplogo.pdf gaplogo.svg gaplogo.png

gaplogo.pdf: gaplogo.tex
	lualatex $(TEXOPTS) $<

gaplogo.png: gaplogo.pdf
	sips -s format png $< --out $@

gaplogo.svg: gaplogo.pdf
	pdf2svg $< $@
