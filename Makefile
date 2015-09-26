MAINFILENAME=Report
RMFILES:=$(filter-out $(MAINFILENAME).tex, $(wildcard $(MAINFILENAME)*))

all: *.tex *.bib
	pdflatex --shell-escape $(MAINFILENAME).tex
	pdflatex --shell-escape $(MAINFILENAME).tex
	bibtex $(MAINFILENAME).aux
	pdflatex --shell-escape $(MAINFILENAME).tex

.PHONY: clean

clean: $(RMFILES)
	-rm -f $(RMFILES)
	-rm -rf ./_minted-$(MAINFILENAME)
