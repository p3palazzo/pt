VPATH = lib
vpath %.csl lib/styles
vpath %.yaml .:spec
vpath default.% lib/pandoc-templates

HTML = $(wildcard *.html)
POSTS = $(wildcard _posts/*.md)
INCLUDES = $(wildcard _includes/*.html)

serve: build
	bundle exec jekyll serve

build: $(POSTS) $(HTML) bundle
	bundle exec jekyll build

bundle : .vendor/bundle
	gem install bundler
	-bundle config set path '.vendor/bundle'
	bundle install

# vim: set shiftwidth=2 :
