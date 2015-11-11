# Cuihua Gu
# 2015-10-14
# 

Input=$1 # insert file
OutPref=$2
refFile=$3
OutDir=`dirname $OutPref`
mkdir -p ${OutDir}/FreClu/
pref=`basename $OutPref`
#FreClu=/mnt/Storage2/home/tuser/guch/MIR34/Code/FreClu/source_inputData
#FreClu2=/mnt/Storage2/home/tuser/guch/MIR34/Code/FreClu/source_clustering

# -------------1. Grep seed sequence from insert input file
grep 'TGGCAGTG' $Input > $OutPref.seed.insert

# -------------2. Convert insert to fa
python ~/bin/insertToFq.py $OutPref.seed.insert $refFile  $OutPref.seed.insert.fq

# -------------3. seed location
#./14.Oct.seedLoci.sh $OutPref.seed.insert $OutPref.seed

# -------------4. FreClu
#currentDir=`pwd`
#cd ${OutDir}/FreClu
#cp $FreClu2/normal_distribution ./
#sed '$s/$/\nbufferline/' $OutPref.seed.insert.fq > $OutDir/FreClu/$pref.seed.insert.fq2
#java -cp ${FreClu} QV_format1_fastq $OutDir/FreClu/$pref.seed.insert.fq2
#java -cp ${FreClu} Radix_DNAseq $OutDir/FreClu/$pref.seed.insert.fq2_seq-prb.txt
#java -cp ${FreClu} Merge_randomModel $OutDir/FreClu/$pref.seed.insert.fq2_seq-prb.txt_RadixSort_DNAseq
#java -cp ${FreClu} Radix_num $OutDir/FreClu/$pref.seed.insert.fq2_seq-prb.txt_RadixSort_DNAseq_merge_randomModel
#grep N $OutDir/FreClu/$pref.seed.insert.fq2_seq-prb.txt_RadixSort_DNAseq_merge_randomModel_RadixSortReverseBy3|cut -f1 > temp
#weedLines temp $OutDir/FreClu/$pref.seed.insert.fq2_seq-prb.txt_RadixSort_DNAseq_merge_randomModel_RadixSortReverseBy3 $OutDir/FreClu/$pref.seed.insert.fq2_seq-prb.txt_RadixSort_DNAseq_merge_randomModel_RadixSortReverseBy3_noN
#java -cp ${FreClu2} ClusteringOfShortTags_searchReverse_hash_open -i $OutDir/FreClu/$pref.seed.insert.fq2_seq-prb.txt_RadixSort_DNAseq_merge_randomModel_RadixSortReverseBy3_noN
#rm temp normal_distribution
#rm $OutDir/FreClu/$pref.seed.insert.fq2*
#cd $currentDir

# -------------5. Cut off the seedread frenquency
#awk '{if($3>=5){print $0}}' $OutDir/FreClu/clusterOutput.txt > $OutDir/FreClu/clusterOutput_filter.txt
#cut -f1 $OutDir/FreClu/clusterOutput_filter.txt >> clusterOutput_filter_seqList
