
slide.md:
	./mkslide.sh
show:
	PYENV_VERSION=3.6.15 lookatme -e file_loader slide.md
clean:
	rm slide.md
