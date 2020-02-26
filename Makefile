PREFIX = /Users/jheppler/.pandoc
BIB = /Users/jheppler/Dropbox/acad/bib/master.bib
CSL = chicago
OUTPUTDIR = public
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

deploy:
	rsync --omit-dir-times --exclude-from=rsync-excludes \
		--checksum -avz \
		--itemize-changes \
		public/ reclaim:~/public_html/courses/bootcampr.2020/ | egrep -v '^\.'
