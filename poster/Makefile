BUILD_ROOT=$(shell pwd)
LATEX=latexmk
LATEXMK_VERSION=$(latexmk -v | grep "Version" | sed s/^.*Version\ \\\(.*\\\).*$/\\1/g)
LATEX_ROOT=$(BUILD_ROOT)/doc
LATEX_DIST=$(LATEX_ROOT)/dist
LXSRC=$(LATEX_ROOT)/src
LATEX_BUILD=$(LATEX_ROOT)/build
LATEX_BUILD_ARGS=-bibtex -pdf -outdir=$(LATEX_DIST) -cd
BIBLIOGRAPHY=$(LXSRC)/bibliography.bib
MAIN_FILE=conference_poster_4.tex

all: main

builddir:
	mkdir -p $(LATEX_ROOT)/dist

main: builddir $(LATEX_DIST)/main.pdf

$(LATEX_DIST)/main.pdf: $(LXSRC)/*.tex
	$(LATEX) $(LATEX_BUILD_ARGS) $(LXSRC)/$(MAIN_FILE)
	cp $(LATEX_DIST)/*.aux $(LXSRC)/

clean:
	rm -rf $(LATEX_ROOT)/dist

