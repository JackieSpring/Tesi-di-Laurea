

PWD=`pwd`

SRC_NAME := Tesi
SRC_TEX := $(SRC_NAME).tex
SRC_PDF := $(SRC_NAME).pdf

SRC_BIB := $(SRC_NAME).bib

BUILD_DIR :=$(PWD)/.build

all:
	@if [ ! -d $(BUILD_DIR) ]; 					then mkdir $(BUILD_DIR); fi;
	@if [ ! -d $(BUILD_DIR)/img ]; 				then ln -s $(PWD)/img/ $(BUILD_DIR)/img ; fi;
	@if [ ! -f $(BUILD_DIR)/sapthesis.cls ]; 	then cp sapthesis/sapthesis.cls $(BUILD_DIR)/; fi;
	@if [ ! -f $(BUILD_DIR)/sapienzalogo.pdf ]; then cp sapthesis/sapienzalogo.pdf $(BUILD_DIR)/; fi;
	@if [ ! -f $(BUILD_DIR)/$(SRC_TEX) ]; 		then ln -s $(PWD)/$(SRC_TEX) $(BUILD_DIR)/$(SRC_TEX) ; fi;
	@if [ ! -f $(BUILD_DIR)/$(SRC_BIB) ]; 		then ln -s $(PWD)/$(SRC_BIB) $(BUILD_DIR)/$(SRC_BIB) ; fi;
	cd $(BUILD_DIR)/ ; pdflatex -interaction=nonstopmode  $(SRC_TEX)
	cd $(BUILD_DIR)/ ; biber --fastsort $(SRC_NAME)
	@cd $(BUILD_DIR)/ ; pdflatex $(SRC_TEX)
	@cp $(BUILD_DIR)/$(SRC_PDF) ./

open:
	open $(SRC_PDF)