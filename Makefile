# Global variables and setup {{{1
# ================
VPATH = _lib
vpath %.yaml .:_spec
vpath %.csl .:_csl
vpath default.% .:_lib
vpath reference.% .:_lib

DEFAULTS := defaults.yaml _metadata.yaml _bibliography/references.bib
JEKYLL-VERSION := 4.2.0
PANDOC-VERSION := 2.14.1
JEKYLL/PANDOC := docker run --rm -v "`pwd`:/srv/jekyll" \
	-h "0.0.0.0:127.0.0.1" -p "4000:4000" \
	palazzo/jekyll-tufte:$(JEKYLL-VERSION)-$(PANDOC-VERSION)
PANDOC/CROSSREF := docker run --rm -v "`pwd`:/data" \
	-u "`id -u`:`id -g`" pandoc/crossref:$(PANDOC-VERSION)
PANDOC/LATEX := docker run --rm -v "`pwd`:/data" \
	-v "`pwd`/assets/fonts:/usr/share/fonts" \
	-u "`id -u`:`id -g`" palazzo/pandoc-ebgaramond:$(PANDOC-VERSION)

# Targets and recipes {{{1
# ===================
%.pdf : %.md $(DEFAULTS) \
	| _csl/chicago-fullnote-bibliography-with-ibid.csl
	$(PANDOC/LATEX) -d _spec/defaults.yaml -o $@ $<
	@echo "$< > $@"

_book/letter/%.pdf : _letter/%.md letter.yaml _metadata.yaml
	@mkdir -p $(@D)
	@$(PANDOC/LATEX) -d _spec/letter.yaml -o $@ $<
	@echo "$< > $@"

%.docx : %.md $(DEFAULTS) reference.docx \
	| _csl/chicago-fullnote-bibliography-with-ibid.csl
	$(PANDOC/CROSSREF) -d _spec/defaults.yaml -o $@ $<
	@echo "$< > $@"

.PHONY : _site
_site : 
	@$(JEKYLL/PANDOC) /bin/bash -c \
	"chmod 777 /srv/jekyll && jekyll build"

_csl/%.csl : _csl
	@cd $(@D) && git checkout master -- $(@F)
	@echo "Checked out $(@F)."

# Install and cleanup {{{1
# ===================
.PHONY : serve
serve : 
	@$(JEKYLL/PANDOC) jekyll serve --future

.PHONY : _csl
_csl :
	@echo "Fetching CSL styles..."
	@test -e $@ || \
		git clone --depth=1 --filter=blob:none --no-checkout \
		https://github.com/citation-style-language/styles.git \
		$@

.PHONY : clean
clean :
	-rm -rf _book/* _site _csl

# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
