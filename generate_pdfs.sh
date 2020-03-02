#!/bin/bash

# The PDFs are generated on my machine using the following versions of pandoc and wkhtmltopdf

### PANDOC
# https://github.com/jgm/pandoc/releases/download/2.9.2/pandoc-2.9.2-1-amd64.deb
# amartin@MU00192564:~$ pandoc --version
# pandoc 2.9.2
# Compiled with pandoc-types 1.20, texmath 0.12.0.1, skylighting 0.8.3.2

### WKHTMLTOPDF
# https://zoomadmin.com/HowToInstall/UbuntuPackage/xfonts-75dpi
#https://launchpad.net/~ubuntu-security/+archive/ubuntu/ppa/+build/15108504/+files/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
#https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb
#amartin@MU00192564:~$ wkhtmltopdf --version
#wkhtmltopdf 0.12.5

for page in "programming_languages.md Unix-CLI.md Git.md"
do
  pandoc $page.md --from=gfm -t html --output $page.html
  wkhtmltopdf --footer-right "Page [page] of [toPage]" $page.html $page.pdf 
  rm -f $page.html
done
#pandoc programming_languages.md --from=gfm --pdf-engine=wkhtmltopdf --output programming_languages.pdf
#pandoc Unix-CLI.md --from=gfm --pdf-engine=wkhtmltopdf --output Unix-CLI.pdf
#pandoc Git.md --from=gfm --pdf-engine=wkhtmltopdf --output Git.pdf
