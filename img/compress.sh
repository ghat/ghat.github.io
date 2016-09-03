#!/bin/bash -xv 
OUTPUT_WIDTH=900x900
if [[ $1 =~ ^[0-9]+x[0-9]+$ ]] ; then
    OUTPUT_WIDTH=$1
    shift ; 
fi
mogrify -verbose -path ./ -filter Triangle -define filter:support=2 -thumbnail $OUTPUT_WIDTH -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB -strip $*

