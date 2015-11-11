# Cuihua Gu
# Calculate nt freq in each position

import sys

insertFile=sys.argv[1]
outputFile=sys.argv[2]
seed="TGGCAGTG"
length=22

#----------------1. Function
def calcNum(insertFile,seed):
	d = {}
	for j in range(0,14):d[j+1]=[0,0,0,0,0]
	f = open(insertFile,"r")
	for line in f.readlines():
		line=line.rstrip("\n").split("\t")
		#print line
		for i in range(0,int(line[1])):
			seq=line[0].split(seed)[1]+"NNNNNNNNNNNNNNNNNNNNNN"
			#print seq
			for j in range(0,14):
				if seq[j]=="A":
					d[j+1][0]=d[j+1][0]+1
				elif seq[j]=="T":
					d[j+1][1]=d[j+1][1]+1
				elif seq[j]=="C":
					d[j+1][2]=d[j+1][2]+1
				elif seq[j]=="G":
					d[j+1][3]=d[j+1][3]+1
				elif seq[j]=="N":
					d[j+1][4]=d[j+1][4]+1
	f.close()
	return d

res = calcNum(insertFile,seed)
fout = open(outputFile,"w")
fout.write("A\tT\tC\tG\tN\n")
for i in range(0,14):
	tmp = [str(ele) for ele in res[i+1]]
	fout.write("\t".join(tmp)+"\n")
fout.close()
