# Requires:
# - lualatex with tikz package
# - pdftocairo from poppler
# - svg2png
TEXOPTS := --synctex=1 -shell-escape --file-line-error --halt-on-error

DESIGNS = node-colors
#DESIGNS = classic thicker thicker-red thicker-blueish thicker-greenish thicker-orchid node-colors

THEMES := light dark bw 4c  # bw = black&white;  4c = four colors

FILE = gaplogo.pdf gaplogo.svg gaplogo.png \
 gaplogo-notext.pdf gaplogo-notext.svg gaplogo-notext.png \
 gaplogo-notext-small.pdf gaplogo-notext-small.svg gaplogo-notext-small.png \
 gaplogo-reduced.pdf gaplogo-reduced.svg gaplogo-reduced.png \
 gaplogo-notext32.png gaplogo-notext48.png gaplogo-notext64.png gaplogo-notext128.png gaplogo-notext256.png

DST := $(foreach D,$(DESIGNS),$(foreach T,$(THEMES),$(foreach F,$(FILE),output/$(D)/$(T)/$(F))))

TEXINPUTS = $(PWD)/:
export TEXINPUTS

all: $(DST)

clean:
	rm -f $(DST) */*.aux */*.log */*.synctex.gz

VARIANTS := \
  gaplogo: \
  gaplogo-notext:\def\NoTextMode{} \
  gaplogo-notext-small:\def\NoTextMode{}\def\SmallIconMode{} \
  gaplogo-reduced:\def\ReducedMode{}

define MAKE_GAPLOGO_RULE
output/%/$(1)/$(2).pdf: variant-%.tex gaplogo.sty gaplogo-pic.tex
	mkdir -p $$(@D)/.aux
	lualatex $$(TEXOPTS) --jobname=$(2) --output-dir=$$(@D)/.aux "\def\Theme{$(1)}$(3)\input{$$<}"
	mv $$(@D)/.aux/$(2).pdf $$@
endef

# Generate rules for every combination of theme and variant
$(foreach theme,$(THEMES),\
  $(foreach v,$(VARIANTS),\
    $(eval $(call MAKE_GAPLOGO_RULE,$(theme),$(word 1,$(subst :, ,$(v))),$(wordlist 2,99,$(subst :, ,$(v)))))\
  )\
)

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
