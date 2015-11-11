for i in D15-4067-1422D.CA_RA.fastq D15-4067-1433A.CA_RA.fastq D15-4067-1437A.CA_RA.fastq D15-4068-1437A.CA_RA.fastq D15-4069-1422D.CA_RA.fastq D15-4069-1437A.CA_RA.fastq D15-4070-1422D.CA_RA.fastq D15-4070-1433A.CA_RA.fastq D15-4070-1437A.CA_RA.fastq
do
sh ~/bin/fastq_len_filter.sh /mnt/Storage2/home/liyx/MIR34/Data/Priva/150520And_RA/$i 18 /mnt/Storage2/home/tuser/guch/MIR34/Output/LenFilter/$i.17
done
