VPATH = lib
vpath %.yaml .:_spec
vpath default.% lib/pandoc-templates

POSTS = $(wildcard _posts/*.md)
INCLUDES = $(wildcard _includes/*.html)
PANDOC/LATEX := docker run -u "`id -u`:`id -g`" \
	-v "`pwd`:/data" -v "`pwd`/_assets/fonts:/usr/share/fonts" \
	pandoc/latex:2.11.2

build : 
	docker run -v "`pwd`:/srv/jekyll" \
		jekyll/jekyll:3.8.5 /bin/bash -c \
		"chmod 777 /srv/jekyll && jekyll build"

serve :
	docker run -h 127.0.0.1 -p 4000:4000 \
		-v "`pwd`:/srv/jekyll" jekyll/jekyll:3.8.5 \
		/bin/bash -c "chmod 777 /srv/jekyll && jekyll serve"

2020-11-25-recomenda-vilanova-delft.pdf : letter.yaml _drafts/2020-11-25-recomenda-vilanova-delft.md
	$(PANDOC/LATEX) -o $@ -d $^

# vim: set shiftwidth=2 :
