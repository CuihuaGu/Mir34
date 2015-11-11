for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
python 23.Oct.cutReads.py /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/${i}/${i}.seed.insert /mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/${i}/${i}.seed.insert.splitBySeed.fa TGGCAGTG
done
