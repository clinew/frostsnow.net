# LaTeX files.
file = instructions
texs = ${file:=.tex}
pdfs = ${file:=.pdf}
dvis = ${file:=.dvi}
pss = ${file:=.ps}
auxs = ${file:=.aux}
logs = ${file:=.log}

# Compile both programs and PDFs, then clean intermediate files.
all: ${pdfs}

# Compile the PDFs.
${pdfs}: %.pdf: %.ps
	ps2pdf $<

# Compile the PostScripts.
${pss}: %.ps: %.dvi
	dvips -R -Poutline $< -o $@

# Compile the DVIs.
${dvis}: %.dvi: %.tex
	latex $<
	latex $<

# Remove all the output files.
clean: tidy
	rm -f ${pdfs}

# Remove all intermediate output files.
tidy:
	rm -f ${dvis}
	rm -f ${pss}
	rm -f ${auxs}
	rm -f ${logs}
