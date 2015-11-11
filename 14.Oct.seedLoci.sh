#!/bin/bash
# Cuihua Gu
# 2015-10-14
# Find location of seed reads
# $1=input insert file
# $2=output file name
locFreq() {
	inp=$1
	oup=$2
	strindex() { 
  		x="${1%%$2*}"
  		[[ $x = $1 ]] && echo -1 || echo ${#x}
	}
	export -f strindex
	awk '{system("bash -c '\''strindex "$1" TGGCAGTG '\''")}' $inp > $oup.loci 
	cut -f2 $inp > $oup.freq
	paste $oup.loci $oup.freq > $oup.tmp
	awk '{for(i=1;i<=$2;i++){printf($1"\n")}}' $oup.tmp|sort -n|uniq -c|sed 's/^ *//g'|awk -F ' ' '{printf($2"\t"$1"\n")}' > $oup.seedLoci
	rm $oup.loci $oup.freq $oup.tmp
}

lenDist() {
	inp=$1
	oup=$2
	awk '{for(i=1;i<=$2;i++){printf(length($1)"\n")}}' $inp|sort -n|uniq -c|sed 's/^ *//g'|awk -F ' ' '{printf($2"\t"$1"\n")}' > $oup.len
}

locFreq $1 $2
lenDist $1 $2
