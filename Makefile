all: assembly-paper.pdf

clean: 
	rm -fr *.log *.aux assembly-paper.pdf assembly-paper-si.pdf
	
assembly-paper.pdf: assembly-paper.tex
	pdflatex assembly-paper
	bibtex assembly-paper
	pdflatex assembly-paper
	pdflatex assembly-paper
	pdflatex assembly-paper-si

#e.g. use git show c1275:assembly-paper.tex > OLD-assembly-paper.tex
diff:
	latexdiff-so OLD-assembly-paper.tex assembly-paper.tex > DIFF-assembly-paper.tex
	
	pdflatex DIFF-assembly-paper
	bibtex DIFF-assembly-paper
	pdflatex DIFF-assembly-paper
	pdflatex DIFF-assembly-paper
