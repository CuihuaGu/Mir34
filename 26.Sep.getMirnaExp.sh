# 2015-9-26
# Cuihua Gu
# Get miRNhsa expression value from piPipes output

pref=$1 #/mnt/Storage2/home/tuser/guch/MIR34/Output/piPipes_out
out=$2 #/mnt/Storage2/home/tuser/guch/MIR34/Output/mirnaExpr
mkdir -p $out $out/tmp


getExpNor()
{
	hairpinFile=$1
	outpref=$2
	norMethod=$3 # miRNhsa/genome
	norFile=$4
	cut -f1,4 ${hairpinFile} > ${outpref}.tmp
	awk 'END {
  	PROCINFO["sorted_in"] = "@ind_str_asc"
  	for (E in a)
    	print E, a[E]
    	}
	{ a[$1] += $2 }' ${outpref}.tmp|sed 's/ /\t/g' > ${outpref}.tmp2
	if [ $norMethod=="miRNhsa" ];then
		facto=`head -n3 $norFile|tail -n1|cut -f2`
		awk -v var="$facto" '{printf($1"\t"$2/var*1000000"\n")}' ${outpref}.tmp2 > ${outpref}.tmp3
	elif [ $norMethod=="genome" ];then
		facto=`head -n4 $norFile|tail -n1|cut -f2`
		awk -v var="$facto" '{printf($1"\t"$2/var*1000000"\n")}' ${outpref}.tmp2 > ${outpref}.tmp3
	else
		mv ${outpref}.tmp2 ${outpref}.tmp3
	fi
	mv ${outpref}.tmp3 $outpref.tobepaste
	rm ${outpref}.tmp ${outpref}.tmp2
}

getExp()
{
	hairpinFile=$1
	outpref=$2
	cut -f1,4 ${hairpinFile} > ${outpref}.tmp
	awk 'END {
  	PROCINFO["sorted_in"] = "@ind_str_asc"
  	for (E in a)
    	print E, a[E]
    	}
	{ a[$1] += $2 }' ${outpref}.tmp|sed 's/ /\t/g' > ${outpref}.tmp2
	mv ${outpref}.tmp2 $outpref.tobepaste
	rm ${outpref}.tmp
}


for mid in `ls $pref`
do
	hairpinFile=$pref/$mid/hairpins_mapping/$mid.x_rRNA.hairpin.v1m1.bed2
	outpref=$out/tmp/$mid
	#norMethod=miRNhsa
	#norFile=$pref/$mid/$mid.basic_stats
	getExp $hairpinFile $outpref #$norMethod $norFile
	awk -f /mnt/Storage2/home/tuser/guch/MIR34/Code/merge_two_files.awk $outpref.tobepaste /mnt/Storage2/home/tuser/guch/MIR34/Output/mirnaExpr/tmp/mir_list|sed 's/ /\t/g'|cut -f2 > $outpref.tobepaste2
done

paste /mnt/Storage2/home/tuser/guch/MIR34/Output/mirnaExpr/tmp/*.tobepaste2 > /mnt/Storage2/home/tuser/guch/MIR34/Output/mirnaExpr/piPipes.MirnaExpr.txt


