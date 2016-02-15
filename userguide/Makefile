BUILD_ROOT=$(shell pwd)
LATEX=latexmk
LATEXMK_VERSION=$(latexmk -v | grep "Version" | sed s/^.*Version\ \\\(.*\\\).*$/\\1/g)
LATEX_ROOT=$(BUILD_ROOT)/doc
LATEX_DIST=$(LATEX_ROOT)/dist
LXSRC=$(LATEX_ROOT)/src
LATEX_BUILD=$(LATEX_ROOT)/build
LATEX_BUILD_ARGS=-bibtex -pdf -outdir=$(LATEX_DIST) -cd
BIBLIOGRAPHY=$(LXSRC)/bibliography.bib

all: guide

publish: proofread guide

proofread:
	./spellcheck.sh

builddir:
	mkdir -p $(LATEX_ROOT)/dist

guide: builddir $(LATEX_DIST)/guide.pdf

$(LATEX_DIST)/guide.pdf: $(LXSRC)/*.ltx
	$(LATEX) $(LATEX_BUILD_ARGS) $(LXSRC)/guide.ltx
	$(LATEX) $(LATEX_BUILD_ARGS) $(LXSRC)/guide.ltx

clean:
	rm -rf $(LATEX_ROOT)/dist

