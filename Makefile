all: assembly-paper.pdf

clean: 
	rm -fr *.log *.aux assembly-paper.pdf assembly-paper-si.pdf
	
assembly-paper.pdf: assembly-paper.tex
	pdflatex assembly-paper
	pdflatex assembly-paper
	pdflatex assembly-paper-si
	pdflatex assembly-paper-si
	bibtex assembly-paper
	bibtex assembly-paper
	bibtex assembly-paper-si
	bibtex assembly-paper-si
	pdflatex assembly-paper
	pdflatex assembly-paper
	pdflatex assembly-paper-si
	pdflatex assembly-paper-si

#e.g. use git show c1275:assembly-paper.tex > OLD-assembly-paper.tex
diff:
	latexdiff-so OLD-assembly-paper.tex assembly-paper.tex > DIFF-assembly-paper.tex
	
	pdflatex DIFF-assembly-paper
	bibtex DIFF-assembly-paper
	pdflatex DIFF-assembly-paper
	pdflatex DIFF-assembly-paper
	
	latexdiff-so OLD-assembly-paper-si.tex assembly-paper-si.tex > DIFF-assembly-paper-si.tex
	pdflatex DIFF-assembly-paper-si
	bibtex DIFF-assembly-paper-si
	pdflatex DIFF-assembly-paper-si
	pdflatex DIFF-assembly-paper-si

arxiv:
	tar czf assembly-paper.tar.gz assembly-paper.tex assembly-paper.bbl nature.cls fig*.pdf flowchart.pdf

arxiv-si:
	tar czf assembly-paper-si.tar.gz assembly-paper-si.tex assembly-paper-si.bbl nature.cls coverage.pdf coverage1.pdf coverage2.pdf contig-lengths.pdf ref_gi32470572.pdf ecoli-multi-genomes.pdf memory.pdf corn.pdf prairie.pdf
