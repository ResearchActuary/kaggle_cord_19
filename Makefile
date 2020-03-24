
DATA_FILES = $(wildcard data/*.R)
DATA_RDA = $(DATA_FILES:R=rda)

all:$(DATA_RDA)

data/%.rda:data/%.R
	Rscript -e "source('$<')"

main.docx:main.Rmd $(DATA_RDA)
	Rscript -e "rmarkdown::render('$<')"

clean:
	rm -f $(DATA_RDA)
	rm -f main.docx
