# cut reads into two based on seed sequence:TGGCAGTG
import sys

insertFile=sys.argv[1]
seedSequence=sys.argv[3]
output=sys.argv[2]

def splitSequence(fi,fo,s):
	f = open(fi,"r")
	fout = open(fo,"w")
	for line in f.readlines():
		line = line.rstrip("\n").split("\t")
		seq = line[0].split(s)
		name = line[0]
		seq1=seq[0]+s
		if len(seq[1])>14:
			seq2=seq[1][14:]
		else:
			seq2=''
		if seq1==s and seq2!='':
			name=line[0]+"/22"
			for i in range(0,int(line[1])):
				fout.write(">"+name+"\n"+seq2+"\n")
		elif seq2=='' and seq1!=s:
			name=line[0]+"/11"
			for i in range(0,int(line[1])):
				fout.write(">"+name+"\n"+seq1+"\n")
		elif seq2=='' and seq1==s:
			pass
		else:
			name1=line[0]+"/1"
			name2=line[0]+"/2"
			for i in range(0,int(line[1])):
				fout.write(">"+name1+"\n"+seq1+"\n>"+name2+"\n"+seq2+"\n")
	f.close()
	fout.close()

splitSequence(insertFile,output,seedSequence)


