R1fq=$1
minlen=$2
maxlen=$3
outpref=$4
awk -v min=$minlen -v max=$maxlen '{if(NR%4==2) if(length($0)>=min && length($0)<=max) print NR"\n"NR-1"\n"NR+1"\n"NR+2}' $R1fq >  $outpref.temp.lines
sort -n $outpref.temp.lines | uniq > $outpref.temp.lines2
awk 'NR==FNR{l[$0];next;} (FNR in l)' $outpref.temp.lines2 $R1fq > $outpref
rm $outpref.temp.lines $outpref.temp.lines2
