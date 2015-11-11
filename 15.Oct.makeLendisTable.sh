echo -e "18\n19\n20\n21\n22\n23\n24\n25\n26\n27\n28\n29\n30\n31\n32\n33\n34\n35\n36\n37\n38\n39\n40\n41\n42\n43\n44\n45\n46\n47\n48\n49\n50" > seedreadLengthList.txt
for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
	seedLendis=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.seedreads.len
	unmapLendis=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.x_rRNA.x_hairpin.hg19v1a.un.len
	outPut=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.seed_unmapped.lendis.table
	awk -f merge_two_files.awk ${seedLendis} lengthList.txt|sed 's/ /\t/g'|cut -f2 > temp
 	awk -f merge_two_files.awk ${unmapLendis} lengthList.txt|sed 's/ /\t/g'|cut -f2 > temp2
 	paste temp temp2 > temp4
 	paste lengthList.txt temp4 > ${outPut}
 	rm temp*

	# plot
	Rscript plotLendisTable.R ${outPut} /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.seed_unmapped.lendis.table.pdf /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.seed.lendis.pdf
done
