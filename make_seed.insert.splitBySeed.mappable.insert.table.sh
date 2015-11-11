for i in D15-4067-1422D.CA_RA D15-4067-1433A.CA_RA D15-4067-1437A.CA_RA D15-4068-1422D.CA_RA D15-4068-1433A.CA_RA D15-4068-1437A.CA_RA D15-4069-1422D.CA_RA D15-4069-1433A.CA_RA D15-4069-1437A.CA_RA D15-4070-1422D.CA_RA D15-4070-1433A.CA_RA D15-4070-1437A.CA_RA
do
Input=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/$i/$i.seed.insert.splitBySeed.mappable.insert
Ref=/mnt/Storage2/home/tuser/guch/MIR34/Output/seedContaining/seed.insert.splitBySeed.mappable.insert.list
awk -f merge_two_files.awk ${Input} ${Ref}|sed 's/ /\t/g'|cut -f2 > $i.temp
done
rm D15-4069-1437A.CA_RA.temp
rm D15-4070-1433A.CA_RA.temp

awk '{print "0"}' ${Ref} > D15-4069-1437A.CA_RA.temp
awk '{print "0"}' ${Ref} > D15-4070-1433A.CA_RA.temp

paste ${Ref} *.temp > seed.insert.splitBySeed.mappable.insert.table

rm *.temp
