
all: build run

.PHONY: build clean

build:
	latexmk -jobname=kursach -auxdir=./build/ -outdir=./build/ -pdf -synctex=1 main.tex

run:
	open ./build/kursach.pdf &

clean:
	rm -rf ./build
	
docker:
	docker build -t docker-latex .
	docker run -ti -v ${PWD}:/Kursach:Z docker-latex bash -c "make build"
