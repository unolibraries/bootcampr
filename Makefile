PREFIX = /Users/jheppler/.pandoc
BIB = /Users/jheppler/Dropbox/acad/bib/master.bib
CSL = chicago
OUTPUTDIR = public_html
HTML_FILES := $(patsubst %.Rmd, %.html ,$(wildcard *.Rmd))

.PHONY : all

all: serve

clean:
	rm -rf public/
	find content -type f -name '*.html' -delete

build:
	Rscript -e "blogdown::build_site()"

serve: build
	Rscript -e "blogdown::serve_site()"
