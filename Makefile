VPATH = lib
vpath %.csl lib/styles
vpath %.yaml .:spec
vpath default.% lib/pandoc-templates

POSTS = $(wildcard _posts/*.md)
INCLUDES = $(wildcard _includes/*.html)

serve :
	docker run --rm -h 127.0.0.1 -p 4000:4000 \
		-v "`pwd`:/srv/jekyll" jekyll/jekyll:3.8.5 \
		/bin/bash -c "chmod 777 /srv/jekyll && jekyll serve"

build : 
	docker run --rm -v "`pwd`:/srv/jekyll" \
		jekyll/jekyll:3.8.5 /bin/bash -c \
		"chmod 777 /srv/jekyll && jekyll build --future"

# vim: set shiftwidth=2 :
