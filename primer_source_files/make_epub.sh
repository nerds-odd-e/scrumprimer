#!/usr/bin/env bash

src="scrum_primer_v2.0"

pandoc -s -S -f markdown+pipe_tables \
    --epub-cover-image=cover_image.png \
    ${src}.md -o ${src}.epub

