
# 这是目前最好的makefile 对于Rmd编译为beamer、handout和ioslides 的html文件。
# beamers in slides, handout notes in handout, ioslide htmls in iosldes.
# 使用rmdyaml 生成yaml header
# Rmd文件slides分割用“----”
# \note{notes word} notes word will be in one line.

##############################
# define the dir variables
##############################
BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/input # all middle files like .tex
INCLUDEDIR=$(BASEDIR)/include # all file needed include using yaml include:
TEMPLATEDIR=$(INPUTDIR)/templates
STYLEDIR=$(BASEDIR)/style


##############################
# old define
##############################
# ---------------------------
SRC = $(wildcard *.Rmd)

PDFS=$(SRC:.Rmd=.pdf)
HTML=$(SRC:.Rmd=.html)
HD=$(SRC:.Rmd=-handout.pdf)
# handout_pdf := $(patsubst %.Rmd,$(INPUTDIR)/%-handout.Rmd,$(SRC))


#
# target:  dependency1 dependency2 ...
#     <tab> command

# create a hddir directory
hdd=hddir

$(hdd):
	mkdir -p $(hdd)

# make commands
all: clean $(PDFS) $(HTML) hd clean

pdf: $(PDFS)

html: $(HTML)

hd: $(hdd) $(hdd)/$(HD)

#all_handout: $(handout_pdf)
#---------------------------------



####################################################################
## rules for just one rmd file that includes chunks
# usage: make slide_f f="macro-lect-2-2016-key-facta-on-growth.Rmd"
# usage: make handout_f f="macro-lect-2-2016-key-facta-on-growth.Rmd"
# usage: make ioslide_f f="macro-lect-2-2016-key-facta-on-growth.Rmd"
# usaage: make all_f  f="macro-lect-2-2016-key-facta-on-growth.Rmd"
####################################################################

#  possible theme= AnnArbor, Antibes, Bergen, Berkeley, Berlin, Boadilla, CambridgeUS, Copenhagen, Darmstadt, Dresden, Frankfurt, Goettingen, Hannover, Ilmenau, JuanLesPins, Luebeck, Madrid, Malmoe, Marburg, Montpellier, PaloAlto, Pittsburgh, Rochester, Singapore, Szeged, Warsaw
latex_theme=CambridgeUS
# define a template
latex_template=/Users/gabe/.emacs.d/beamer_template.tex

slide_f:${f} $(latex_template)
	Rscript -e "rmarkdown::render('${f}','beamer_presentation')"
	mv  $(addsuffix .pdf,$(basename ${f})) slides/$(addsuffix .pdf,$(basename ${f}))
	mv  $(addsuffix .tex,$(basename ${f})) input/$(addsuffix .tex,$(basename ${f}))
	# if [ condition ]; then action; fi 注意条件放在[ ] 中，两边留空格，
	# 且所有放在一行，或用 \ 连接
	if [ -d  $(addsuffix _files,$(basename ${f})) ]; then \
	cp -R  $(addsuffix _files/,$(basename ${f})) input/$(addsuffix _files/,$(basename ${f})); \
	rm -rf  $(addsuffix _files/,$(basename ${f})); \
	fi

# compile rmd to handout latex pdf
handout_f: ${f}
	cp ${f} $(addsuffix -handout.Rmd,$(basename ${f}))
	perl -pi -w -e 's/----//g;' $(addsuffix -handout.Rmd,$(basename ${f}))
	# 将\note{word notes} 替代为word notes
	perl -pi -w  -e 's/\\note{(.+)?}/$1/g;' $(addsuffix -handout.Rmd,$(basename ${f}))
	Rscript -e "rmarkdown::render('$(addsuffix -handout.Rmd,$(basename ${f}))','pdf_document')"
	mv  $(addsuffix -handout.pdf,$(basename ${f})) handout/$(addsuffix -handout.pdf,$(basename ${f}))
	mv  $(addsuffix -handout.Rmd,$(basename ${f})) input/$(addsuffix -handout.Rmd,$(basename ${f}))
	mv  $(addsuffix -handout.tex,$(basename ${f})) input/$(addsuffix -handout.tex,$(basename ${f}))
	if [ -d $(addsuffix -handout_files,$(basename ${f})) ]; then \
		cp -R  $(addsuffix -handout_files/,$(basename ${f})) input/$(addsuffix -handout_files/,$(basename ${f})); \
		rm -rf  $(addsuffix -handout_files/,$(basename ${f})); \
	fi

# compile Rmd to ioslide html slides
ioslide_f: ${f}
	Rscript -e "rmarkdown::render('${f}','ioslides_presentation')"
	mv  $(addsuffix .html,$(basename ${f})) ioslides/$(addsuffix .html,$(basename ${f}))
	
# compile a Rmd file to three format together
# usage: make all_f f="demo.Rmd"

all_f: slide_f handout_f ioslide_f




########################################################
# compile all rmd in a directory to slides,handout,ioslide

# usage: make pdf
# usage: make html
# todo: make handout
#########################################################


# rules for all Rmd files 
%.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<','beamer_presentation')"
	mv $@ slides/$@
	mv  $(addsuffix .tex,$(basename $<)) input/$(addsuffix .tex,$(basename $<))
	if [ -d $(addsuffix _files,$(basename $<)) ]; then \
		cp -R  $(addsuffix _files/,$(basename $<)) input/$(addsuffix _files/,$(basename $<)); \
		rm -rf  $(addsuffix _files/,$(basename $<})); \
	fi


# handout.pdf all together

# $(handout_pdf): $(INPUTDIR)/%-handout.Rmd: %.Rmd
# 	cp $< %@
# 	perl -pi -w -e 's/----//g;' $@
# 	cp -R include/ $(INPUTDIR)/include/
# 	Rscript -e "rmarkdown::render('$@','pdf_document')"
	


%.html: %.Rmd
	Rscript -e "rmarkdown::render('$<','ioslides_presentation')"
	mv $@ ioslides/$@


# other make commands
read: $(PDFS)
	open $< &

read-html: $(HTML)
	open $<

clean:
	rm -rf *.log *.out *.nav *.aux *.toc *.snm *.bbl *.blg *.tex *.vrb *.*~ hddir

distclean: clean
	rm -rf *.pdf *.html
