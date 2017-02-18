playlist:
	find -name "*.wav" | sed "s/.\/player\///" > player/playlist.txt

diagrams:
	mermaid report/diagram.md
	mermaid report/pd_diagram.md
	mv diagram.md.png report/media/diagram.png
	mv pd_diagram.md.png report/media/pd-diagram.png

report-build: diagrams
	cd report && pandoc --smart report.md -o report.pdf

report-regenerate:
	./report/regenerate.sh

paper-build:
	cd paper \
	&& pdflatex paper.tex \
	&& bibtex paper \
	&& pdflatex paper.tex \
	&& pdflatex paper.tex

paper-regenerate:
	./paper/regenerate.sh
