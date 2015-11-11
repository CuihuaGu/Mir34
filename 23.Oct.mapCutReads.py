# cut reads into two based on seed sequence:TGGCAGTG
import sys

insertFile=sys.argv[1]
seedSequence=sys.argv[3]
output=sys.argv[2]
#insertFile="D15-4067-1422D.CA_RA.seed.insert"
#seedSequence="TGGCAGTG"

def splitSequence(fi,s):
        dict={}
        f = open(fi,"r")
        for line in f.readlines():
                line = line.rstrip("\n").split("\t")
                seq = line[0].split(s)
                name = line[0]
                seq1=seq[0]
                if len(seq[1])>14:
                        seq2=seq[1][14:]
                else:
                        seq2=''
                if seq1!='' or seq2!='':
                        dict[name]=[seq1,seq2,line[1]]
        f.close()
        return dict

def calcDist(str1,str2,rl): # str1 short reads
        mismatch=0
        l = len(str1)
        if l==0:
                return mismatch
        else:
                if rl=="r":
                        for i in range(0,l):
                                if str1[i]!=str2[i]:
                                        mismatch += 1
                        if mismatch >= float(l) *  0.1:
                                return -1
                        else:
                                return mismatch
                elif rl=="l":
                        str2 = str2[-l:-1]+str2[-1]
                        for i in range(0,l):
                                if str1[i]!=str2[i]:
                                        mismatch += 1
                        if mismatch >= float(l) *  0.1:
                                return -1
                        else:
                                return mismatch

def mapping(sr):
        dict = {}
        left50ref = "GCGGGCGCCTCAGCCTGGGCTGGCCAGCTGTGAGTAATTCTTTGGCAGTG"
        right30ref = "TGTGAGTATTAGCTAAGGAAGCAATCAGCA"
        for key in sr.keys():
                leftD = calcDist(sr[key][0],left50ref,"l")
                rightD = calcDist(sr[key][1],right30ref,"r")
                dict[key]=[leftD,rightD,sr[key][2]]
        return dict

shortReads = splitSequence(insertFile,seedSequence)
res = mapping(shortReads)

fout = open(output,"w")
fout.write("sequence"+"\t"+"leftMapping"+"\t"+"rightMapping"+"\n")
for key in res:
        for i in range(0,int(res[key][2])):
                fout.write(key+"\t"+str(res[key][0])+"\t"+str(res[key][1])+"\n")
fout.close()



