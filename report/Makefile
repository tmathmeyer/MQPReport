BUILD_ROOT=$(shell pwd)
LATEX=latexmk
LATEXMK_VERSION=$(latexmk -v | grep "Version" | sed s/^.*Version\ \\\(.*\\\).*$/\\1/g)
LATEX_ROOT=$(BUILD_ROOT)/doc
LATEX_DIST=$(LATEX_ROOT)/dist
LXSRC=$(LATEX_ROOT)/src
LATEX_BUILD=$(LATEX_ROOT)/build
LATEX_BUILD_ARGS=-bibtex -pdf -outdir=$(LATEX_DIST) -cd
BIBLIOGRAPHY=$(LXSRC)/bibliography.bib

all: main

builddir:
	mkdir -p $(LATEX_ROOT)/dist

main: builddir $(LATEX_DIST)/main.pdf

$(LATEX_DIST)/main.pdf: $(LXSRC)/main.ltx \
	                    $(LXSRC)/intro.ltx \
						$(LXSRC)/litreview.ltx \
	                    $(LXSRC)/approach.ltx \
						$(LXSRC)/compare.ltx \
						$(LXSRC)/methodology.ltx \
						$(LXSRC)/results.ltx
	$(LATEX) $(LATEX_BUILD_ARGS) $(LXSRC)/main.ltx
	cp $(LATEX_DIST)/main.bcf $(LXSRC)/main.ltx.bcf
	biber $(LXSRC)/main.ltx
	$(LATEX) $(LATEX_BUILD_ARGS) $(LXSRC)/main.ltx
	$(LATEX) $(LATEX_BUILD_ARGS) $(LXSRC)/main.ltx
	rm $(LXSRC)/main.ltx.*

clean:
	rm -rf $(LATEX_ROOT)/dist

