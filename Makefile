.PHONY : build serve clean
build  :
	bundle exec jekyll build

serve  :
	bundle exec jekyll serve

clean :
	-rm -rf _site/* _book/*
