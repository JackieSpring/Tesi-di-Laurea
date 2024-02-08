



all:
	@if [ ! -d build ]; then mkdir build; fi;
	@if [ ! -d build/img ]; then ln -s $(PWD)/img/ $(PWD)/build/img ; fi;
	@if [ ! -f build/sapthesis.cls ]; then cp sapthesis/sapthesis.cls build/; fi;
	@if [ ! -f build/sapienzalogo.pdf ]; then cp sapthesis/sapienzalogo.pdf build/; fi;
	@cp Tesi.tex build/
	@cp tesi.bib build/
#	cd build/ ; pdflatex Tesi.tex
	cd build/ ; biber Tesi
	@cd build/ ; pdflatex Tesi.tex && open Tesi.pdf

