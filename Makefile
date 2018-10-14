all: build run

build:
	latexmk -auxdir=./build/ -outdir=./build/ -pdf -synctex=1 main.tex
run:
	open ./build/main.pdf &
clean:
	rm -rf ./build
