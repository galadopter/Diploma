
all: build run

.PHONY: build clean

build:
	latexmk -jobname=diploma -auxdir=./build/ -outdir=./build/ -pdf -synctex=1 main.tex

run:
	open ./build/diploma.pdf &

clean:
	rm -rf ./build
	
docker:
	docker build -t docker-latex .
	docker run -ti -v ${PWD}:/Diploma:Z docker-latex bash -c "make build"
