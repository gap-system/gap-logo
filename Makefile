TEXOPTS := --synctex=1 -shell-escape --file-line-error --halt-on-error

all: gaplogo.pdf gaplogo.svg

gaplogo.pdf: gaplogo.tex
	lualatex $(TEXOPTS) $<

gaplogo.png: gaplogo.pdf
	echo TODO

gaplogo.svg: gaplogo.pdf
	pdf2svg $< $@
