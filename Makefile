TARGET=example
ASCIIDOC=asciidoc
ASCIIDOC_DBLATEX_STY=asciidoc-dblatex-custom.sty
ASCIIDOC_OPTS=-v
DBLATEX_OPTS=-P doc.publisher.show=0 -s $(ASCIIDOC_DBLATEX_STY)
PWD=$(shell pwd)
XML_CATALOG=$(PWD)/docbook-catalog/catalog.xml

.PHONY: clean html xml pdf

html: $(TARGET).html

xml: $(TARGET).xml

pdf: $(TARGET).pdf

%.html: %.txt
	$(ASCIIDOC) $(ASCIIDOC_OPTS) -o $@ $<
	
%.xml: %.txt
	export XML_CATALOG_FILES=$(XML_CATALOG);\
	$(ASCIIDOC) -b docbook -d article $(ASCIIDOC_OPTS) $<

%.pdf: %.xml %-revhistory.xml
	export XML_CATALOG_FILES=$(XML_CATALOG);\
	a2x --verbose --icons --asciidoc-opts="$(ASCIIDOC_OPTS)" --dblatex-opts="$(DBLATEX_OPTS)" -f pdf $<

clean:
	rm -f *~ $(TARGET).xml $(TARGET).pdf $(TARGET).html

