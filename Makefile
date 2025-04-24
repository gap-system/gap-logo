# Requires:
# - lualatex with tikz package
# - pdftocairo from poppler
# - svg2png
TEXOPTS := --synctex=1 -shell-escape --file-line-error --halt-on-error

VARIANTS = node-colors
#VARIANTS = classic thicker thicker-red thicker-blueish thicker-greenish thicker-orchid node-colors

THEMES = light dark bw 4c  # bw = black&white;  4c = four colors

FILE = gaplogo.pdf gaplogo.svg gaplogo.png \
 gaplogo-notext.pdf gaplogo-notext.svg gaplogo-notext.png \
 gaplogo-notext-small.pdf gaplogo-notext-small.svg gaplogo-notext-small.png \
 gaplogo-reduced.pdf gaplogo-reduced.svg gaplogo-reduced.png \
 gaplogo-notext32.png gaplogo-notext48.png gaplogo-notext64.png gaplogo-notext128.png gaplogo-notext256.png

DST := $(foreach V,$(VARIANTS),$(foreach T,$(THEMES),$(foreach F,$(FILE),output/$(V)/$(T)/$(F))))

TEXINPUTS = $(PWD)/:
export TEXINPUTS

all: $(DST)

clean:
	rm -f $(DST) */*.aux */*.log */*.synctex.gz

output/%/light/gaplogo.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo --output-dir=$(@D)/.aux "\def\Theme{light}\input{$<}"
	mv $(@D)/.aux/gaplogo.pdf $@

output/%/dark/gaplogo.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo --output-dir=$(@D)/.aux "\def\Theme{dark}\input{$<}"
	mv $(@D)/.aux/gaplogo.pdf $@

output/%/bw/gaplogo.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo --output-dir=$(@D)/.aux "\def\Theme{bw}\input{$<}"
	mv $(@D)/.aux/gaplogo.pdf $@

output/%/4c/gaplogo.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo --output-dir=$(@D)/.aux "\def\Theme{4c}\input{$<}"
	mv $(@D)/.aux/gaplogo.pdf $@


output/%/light/gaplogo-notext.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-notext --output-dir=$(@D)/.aux "\def\Theme{light}\def\NoTextMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-notext.pdf $@

output/%/dark/gaplogo-notext.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-notext --output-dir=$(@D)/.aux "\def\Theme{dark}\def\NoTextMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-notext.pdf $@

output/%/bw/gaplogo-notext.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-notext --output-dir=$(@D)/.aux "\def\Theme{bw}\def\NoTextMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-notext.pdf $@

output/%/4c/gaplogo-notext.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-notext --output-dir=$(@D)/.aux "\def\Theme{4c}\def\NoTextMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-notext.pdf $@


output/%/light/gaplogo-notext-small.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-notext-small --output-dir=$(@D)/.aux "\def\Theme{light}\def\NoTextMode{}\def\SmallIconMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-notext-small.pdf $@

output/%/dark/gaplogo-notext-small.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-notext-small --output-dir=$(@D)/.aux "\def\Theme{dark}\def\NoTextMode{}\def\SmallIconMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-notext-small.pdf $@

output/%/bw/gaplogo-notext-small.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-notext-small --output-dir=$(@D)/.aux "\def\Theme{bw}\def\NoTextMode{}\def\SmallIconMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-notext-small.pdf $@

output/%/4c/gaplogo-notext-small.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-notext-small --output-dir=$(@D)/.aux "\def\Theme{4c}\def\NoTextMode{}\def\SmallIconMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-notext-small.pdf $@


output/%/light/gaplogo-reduced.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-reduced --output-dir=$(@D)/.aux "\def\Theme{light}\def\ReducedMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-reduced.pdf $@

output/%/dark/gaplogo-reduced.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-reduced --output-dir=$(@D)/.aux "\def\Theme{dark}\def\ReducedMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-reduced.pdf $@

output/%/bw/gaplogo-reduced.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-reduced --output-dir=$(@D)/.aux "\def\Theme{bw}\def\ReducedMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-reduced.pdf $@

output/%/4c/gaplogo-reduced.pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $(@D)/.aux
	lualatex $(TEXOPTS) --jobname=gaplogo-reduced --output-dir=$(@D)/.aux "\def\Theme{4c}\def\ReducedMode{}\input{$<}"
	mv $(@D)/.aux/gaplogo-reduced.pdf $@


%.png: %.pdf
	pdftocairo -png -transp -singlefile -r 1200 $< $(basename $@ .png)

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

########################################################################
# Makefile debugging trick:
# call print-VARIABLE to see the runtime value of any variable
########################################################################
print-%:
	@echo '$*=$($*)'
