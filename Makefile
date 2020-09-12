SHELL=bash
BASENAME=slides
SLIDES=slides/*.md
# use 'gsed' on macOS (BSD sed can't deal w/ newlines in replacement string)
SED=$(if $(shell which gsed &>/dev/null && echo 1),gsed,sed)

# metadata title block for Pandoc (handout) output
PANDOCMETA=meta.yml

# default target: print help message
help:
	@#echo "                  (set CLOBBER=1 to write to 'slides.md' instead)";
	@echo; \
	echo "Usage:"; \
	echo; \
	echo "  make cat      - cat all slides into 'slides.md'"; \
	echo "  make webpage  - make an HTML web page"; \
	echo "  make handout  - make a PDF handout"; \
	echo "  make clean    - remove generated *.md, *.html, *.pdf files"; \
	echo

# concatenate all the slides together and write to 'slides.md'
#
# this can be used as a starting point for a cleaned-up 'slides.md', if at
# some point the slides and handout start to diverge a lot
#
# the automatic variable '$^' means "all dependencies for this recipe"
cat: $(SLIDES)
	@#if [ -f "$(BASENAME)-cat.md" ]; then \
	#	echo "File '$(BASENAME)-cat.md' exists; refusing to overwrite." >&2; \
	#	exit 1; \
	#fi
	@#if (( $(CLOBBER) )); then \
	#	cat $(PANDOCMETA) $(SLIDES) | $(SED) 's/^## /\n\n&/' \
	#		> $(BASENAME).md; \
	#else \
	#	cat $(PANDOCMETA) $(SLIDES) | $(SED) 's/^## /\n\n&/' \
	#		> $(BASENAME)-cat.md; \
	#fi
	cat $(PANDOCMETA) $(SLIDES) \
		| $(SED) 's/^## /\n\n&/' \
		> $(BASENAME).md; \

# make an HTML version of 'slides.md' using Pandoc
webpage: cat
	pandoc -f markdown -t html -o index.html $(BASENAME).md

# make a PDF version of 'slides.md' using Pandoc
handout: cat
	@#cat $(filter-out slides/00%, $(wildcard $(SLIDES)))
	cat $(SLIDES) \
		| $(SED) 's/^## /\n\n&/' \
		| pandoc --metadata-file=$(PANDOCMETA) -f markdown -t pdf \
			--pdf-engine=xelatex -o $(BASENAME).pdf

# nicknames for 'webpage'
html: webpage

# a nickname for 'handout'
pdf: handout

# remove generated files
clean:
	@#-rm $(BASENAME)-cat.md $(BASENAME).html 2>/dev/null
	-rm $(BASENAME).md $(BASENAME).html 2>/dev/null

reallyclean: clean
	-rm $(BASENAME).pdf 2>/dev/null


# these targets have no filesystem dependencies;
# see: https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: html pdf clean reallyclean
