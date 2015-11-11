# Cuihua Gu
# 2015-11-2
# process seed.insert.splitBySeed.mappable.insert.table to see its hairpin structure
# INPUT:
	# 0. File="/mnt/Storage2/home/tuser/guch/MIR34/Code/seed.insert.splitBySeed.mappable.insert.table_above3"
	# 1. RNAcofoldOutput="~/bin/ViennaRNA-2.1.8/Progs/tmp"
# OUTPUT:
	# 

#awk 'NR!=1{printf(">"$1"\n"$1"&GGAAGCAATCAGCAAGTATACTGCCCT\n")}' seed.insert.splitBySeed.mappable.insert.table_1-2 > /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/RNAcofold.1-2
#awk 'NR!=1{printf(">"$1"\n"$1"&GGAAGCAATCAGCAAGTATACTGCCCT\n")}' seed.insert.splitBySeed.mappable.insert.table_2-3 > /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/RNAcofold.2-3
#awk 'NR!=1{printf(">"$1"\n"$1"&GGAAGCAATCAGCAAGTATACTGCCCT\n")}' seed.insert.splitBySeed.mappable.insert.table_above3 > /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/RNAcofold.above3
#awk 'NR!=1{printf(">"$1"\n"$1"&GGAAGCAATCAGCAAGTATACTGCCCT\n")}' seed.insert.splitBySeed.mappable.insert.table_below1 > /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/RNAcofold.below1
#cat /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/RNAcofold.1-2 | ./RNAcofold > /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.1-2.out
#cat /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/RNAcofold.2-3 | ./RNAcofold > /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.2-3.out
#cat /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/RNAcofold.above3 | ./RNAcofold > /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.above3.out
#cat /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/RNAcofold.below1 | ./RNAcofold > /mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.below1.out


import sys
from collections import Counter
# -----------------------1. INPUT
RNAcofoldOutput = sys.argv[1]
#RNAcofoldOutput="/mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.above3.out"
#RNAcofoldOutput="/mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.2-3.out"
#RNAcofoldOutput="/mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.1-2.out"
#RNAcofoldOutput="/mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.below1.out"
output = sys.argv[2]
# -----------------------2. FUNCTION
def readRNAcofoldOut(F):
	f = open(F,"r")
	count = 0
	count2 = 0
	d = {}
	for line in f.readlines():
		if count % 3 == 0:
			if line.lstrip('>').rstrip('\n').split("TGGCAGTG")[0]!='':
				count2 = count2+1
			else:
				name = line.lstrip('>').rstrip('\n')
				d[name] = []
		elif count % 3 == 1:
			pass
		elif count % 3 == 2:
			line = line.rstrip(")\n").split(" (")
			tmp = line[0].split("&")
			d[name].append(tmp[0])
			d[name].append(tmp[1])
			d[name].append(line[1])
		count = count + 1
	print count2
	f.close()
	return d

def mismatchLoci(li,l):
	score = [0 for i in range(0,l)]
	mismatch_len = []
	for ele in li:
		ele = ele+"NNNNNNNNNNNNNNN"
		tmp = list(ele[0:l])
		mis = 0
		for i in range(0,l):
			if tmp[i]==".":
				mis = mis + 1
				score[i] = score[i]+1
			elif tmp[i]=="(" or tmp[i]==")":
				pass
		mismatch_len.append(mis)
	return score,mismatch_len

def mismatchAtLoci(li,l):
	#score = [0 for i in range(0,l)]
	#mismatch_len = []
	res = []
	for ele in li:
		ele = ele+"NNNNNNNNNNNNNNN"
		tmp = list(ele[0:l])
		#mis = 0
		tmp = '\t'.join(tmp)
		res.append(tmp)
	return res


d = readRNAcofoldOut(RNAcofoldOutput)
li = []
li2 = []
energy = []
for key in d:
	li.append(d[key][0])
	li2.append(d[key][1])
	energy.append(d[key][2])

score,mismatch_len=mismatchLoci(li,25)
#score2,mismatch_len2=mismatchLoci(li2,27)
res=mismatchAtLoci(li,25)
score = [str(ele) for ele in score]
mismatch_len = [str(ele) for ele in mismatch_len]

f = open(output+".score.txt","w")
f.write('\t'.join(score))
f = open(output+".mismatch_len.txt","w")
f.write('\t'.join(mismatch_len))
f = open(output+".energy.txt","w")
f.write('\t'.join(energy))
f = open(output+".table","w")
f.write('\n'.join(res))
#print RNAcofoldOutput+":"
#print score 
#print Counter(mismatch_len)
#print energy














