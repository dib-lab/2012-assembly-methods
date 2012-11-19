all: assembly-paper.pdf

clean: 
	rm -fr *.log *.aux assembly-paper.pdf assembly-paper-si.pdf
	
assembly-paper.pdf: assembly-paper.tex
	pdflatex assembly-paper
	bibtex assembly-paper
	pdflatex assembly-paper
	pdflatex assembly-paper-si
