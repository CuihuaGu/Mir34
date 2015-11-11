for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
mkdir -p /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/bowtie
fq=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/${i}.seed.insert.fq
fqout=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/${i}.seed.21-25nt.fq
sh /mnt/Storage2/home/tuser/guch/MIR34/Code/fastq_len_filter.sh $fq 21 25 $fqout

bowtie /mnt/Storage2/home/tuser/guch/MIR34/lib/plasmid -q $fqout -v 1 -a -p 8 >  /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/bowtie/$i.21-25nt.bowtie.v1a.output 2>/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/bowtie/$i.21-25nt.bowtie.v1a.log
bowtie /mnt/Storage2/home/tuser/guch/MIR34/lib/plasmid -q $fq -v 1 -a -p 8 >  /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/bowtie/${i}.all.bowtie.v1a.output 2>/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/bowtie/${i}.all.bowtie.v1a.log

done
