FILENAME=kursach

all: clean build run

build:
	latexmk -jobname=FILENAME -auxdir=./build/ -outdir=./build/ -pdf -synctex=1 main.tex

run:
	open ./build/FILENAME.pdf &

clean:
	rm -rf ./build
	
docker:
	docker build -t docker-latex .
	docker run -ti -v ${PWD}:/ docker-latex bash -c "make build"
