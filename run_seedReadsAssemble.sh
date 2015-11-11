#for i in D15-4067-1422D.CA_RA 
for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
Input=/mnt/Storage2/home/tuser/guch/MIR34/Output/piPipes_out/${i}/input_read_files/${i}.x_rRNA.x_hairpin.hg19v1a.un.insert
Out=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/${i}/${i}
Ref=/mnt/Storage2/home/tuser/guch/MIR34/Output/LenFilter/${i}.fastq.17
mkdir -p `dirname $Out`
sh /mnt/Storage2/home/tuser/guch/MIR34/Code/14.Oct.seedReadsAssemble.sh ${Input} ${Out} ${Ref}
done
