for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
Input=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedTrinity/$i/bowtie/$i.bowtie.v3a.freq
awk -f merge_two_files.awk ${Input} seedMapping_HairpinList.txt|sed 's/ /\t/g'|cut -f2 > $i.temp
done
paste seedMapping_HairpinList.txt *.temp > seedReads.bowtie_v3a_tohairpin.table




