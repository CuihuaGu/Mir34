args = commandArgs(T)
input=args[1]
output=args[2]
pref=args[3]
library(RColorBrewer)
colour=brewer.pal(4, "RdYlGn")
d=read.table(input,header=T)
d2=as.matrix(t(d))
colnames(d2)=seq(1,14)
pdf(output)
barplot(d2,col=colour,border=F,ylim=c(0,sum(d2[,1])*1.1),main=pref)
legend("topright",col=colour,c("A","T","C","G"),pch=15,horiz=T,bty="n")
dev.off()
