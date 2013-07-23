asciidoc-dblatex-customization-example
======================================

This is an example of some possible customizations for asciidoc dblatex
backend. It features:

* *Letter paper size* -- How to override the default A4 paper size in dblatex.
* *Custom cover page* -- Cover page with company logo and custom layout.
* *Custom fonts* -- Such as using Charter as roman font and Inconsolata as monospace font.
* *White background in code listings* -- Overriding default dblatex color/grey background.

Overrides and configurations are placed into custom
`asciidoc-dblatex-custom.sty` style file. Take a look into supplied `Makefile`
for `a2x` command example. Run `make clean pdf` to build PDF from asciidoc
source `example.txt`. The output should look like `output/example.pdf`.

Tested on OS X and Ubuntu with asciidoc v8.6.8, TexLive 2012 and dblatex v0.3.4.

