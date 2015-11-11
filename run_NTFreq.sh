for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
	awk 'NR!=1{if($2+$3==0){print $1}}' /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/${i}.seed.insert.splitBySeed.mapping.table|sort -n|uniq -c|sed 's/^ *//g'|awk -F ' ' '{printf($2"\t"$1"\n")}' > /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/${i}.seed.insert.splitBySeed.mappable.insert
	python 26.Oct.calcNTFreq.py /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/${i}.seed.insert.splitBySeed.mappable.insert /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/${i}.seed.insert.splitBySeed.mappable.ntFreq
	Rscript plotNTFrea.R /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/${i}.seed.insert.splitBySeed.mappable.ntFreq /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/${i}.seed.insert.splitBySeed.mappable.ntFreq.pdf ${i}
done
