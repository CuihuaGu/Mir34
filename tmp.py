import sys
from itertools import combinations
inputf = sys.argv[1]

def findLocation(F,li):
	f = open(F,'r')
	L = []
	for line in f.readlines():
		L.append(line.rstrip('\n').split('\t'))
	for num in li:
		temp = 0
		for ele in L:
			for i in num:
				if ele[i]==".":
					temp = temp+1
					break
		if float(temp)/float(len(L))>0.9:
			print "FOUND!!"
			print num,temp,len(L)	
	f.close()


def generateLi(i,j,r):
	inputn = range(i,j)
	output = sum([map(list, combinations(inputn, i)) for i in r], [])
	return output


li = generateLi(1,25,[4])
#out = findLocation(inputf,li)

inputf="/mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.above3.table"
print inputf
out = findLocation(inputf,li)

inputf="/mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.2-3.table"
print inputf
out = findLocation(inputf,li)

inputf="/mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.1-2.table"
print inputf
out = findLocation(inputf,li)

inputf="/mnt/Storage2/home/tuser/guch/MIR34/Output/RNAcofold/out/RNAcofold.below1.table"
print inputf
out = findLocation(inputf,li)
