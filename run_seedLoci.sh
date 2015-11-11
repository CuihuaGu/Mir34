for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
./14.Oct.seedLoci.sh /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.seed.insert /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.seedreads
done

lenDist() {
	inp=$1
	oup=$2
	awk '{for(i=1;i<=$2;i++){printf(length($1)"\n")}}' $inp|sort -n|uniq -c|sed 's/^ *//g'|awk -F ' ' '{printf($2"\t"$1"\n")}' > $oup.len
}

for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
lenDist /mnt/Storage2/home/tuser/guch/MIR34/Output/piPipes_out/$i/input_read_files/$i.x_rRNA.x_hairpin.hg19v1a.un.insert /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.x_rRNA.x_hairpin.hg19v1a.un
done
