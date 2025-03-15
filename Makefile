# Requires:
# - lualatex with tikz package
# - pdftocairo from poppler
# - svg2png
TEXOPTS := --synctex=1 -shell-escape --file-line-error --halt-on-error

VARIANTS = classic/ thicker/ thicker-red/ thicker-blueish/ thicker-greenish/ thicker-orchid/ node-colors/

FILE = gaplogo.pdf gaplogo.svg gaplogo.png \
 gaplogo-notext.pdf gaplogo-notext.svg gaplogo-notext.png \
 gaplogo-reduced.pdf gaplogo-reduced.svg gaplogo-reduced.png \
 gaplogo-notext32.png gaplogo-notext48.png gaplogo-notext64.png gaplogo-notext128.png gaplogo-notext256.png

DST := $(foreach V,$(VARIANTS),$(foreach F,$(FILE),$(addprefix $(V),$(F))))

all: $(DST)

clean:
	rm -f $(DST) */*.aux */*.log */*.synctex.gz

%.pdf: %.tex gaplogo.sty gaplogo-pic.tex
	lualatex $(TEXOPTS) --output-dir=$(*D) $<

%-notext.pdf: %.tex gaplogo.sty gaplogo-pic.tex
	lualatex $(TEXOPTS) --jobname=gaplogo-notext --output-dir=$(*D) "\def\NoTextMode{}\input{$<}"

%-notext-small.pdf: %.tex gaplogo.sty gaplogo-pic.tex
	lualatex $(TEXOPTS) --jobname=gaplogo-notext-small --output-dir=$(*D) "\def\NoTextMode{}\def\SmallIconMode{}\input{$<}"

%-reduced.pdf: %.tex gaplogo.sty gaplogo-pic.tex
	lualatex $(TEXOPTS) --jobname=gaplogo-reduced --output-dir=$(*D) "\def\ReducedMode{}\input{$<}"

%.png: %.pdf
	pdftocairo -png -singlefile -r 300 $< $(basename $@ .png)

%.svg: %.pdf
	pdftocairo -svg $< $@

%/gaplogo-notext32.png: %/gaplogo-notext-small.svg
	svg2png --width=32 --height=32 $< $@

%/gaplogo-notext48.png: %/gaplogo-notext-small.svg
	svg2png --width=48 --height=48 $< $@

%/gaplogo-notext64.png: %/gaplogo-notext-small.svg
	svg2png --width=64 --height=64 $< $@

%/gaplogo-notext128.png: %/gaplogo-notext.svg
	svg2png --width=128 --height=128 $< $@

%/gaplogo-notext256.png: %/gaplogo-notext.svg
	svg2png --width=256 --height=256 $< $@

.PHONY: all clean
