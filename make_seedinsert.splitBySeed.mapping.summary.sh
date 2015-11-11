echo -e Sample"\t"score0"\t"score-1"\t"score-2 >> seedinsert.splitBySeed.mapping.summary
for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
input=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.seed.insert.splitBySeed.mapping.table
temp1=`awk 'NR!=1{if($2+$3==0){print $0}}' ${input}|wc -l`
temp2=`awk 'NR!=1{if($2+$3==-1){print $0}}' ${input}|wc -l`
temp3=`awk 'NR!=1{if($2+$3==-2){print $0}}' ${input}|wc -l`
echo -e ${i}"\t"${temp1}"\t"${temp2}"\t"${temp3} >> seedinsert.splitBySeed.mapping.summary
done

