#!/usr/bin/env bash
#
# see http://pandoc.org if you don't have pandoc

src="en_scrumprimer_20"

pandoc --standalone --toc --smart -f markdown+pipe_tables \
    --epub-cover-image=figs/cover_image.png \
    ${src}.md -o ${src}.epub

