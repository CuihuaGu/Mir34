# plot barplot
library(ggplot2)
library(RColorBrewer)

args <- commandArgs(T)
input=args[1]
output=args[2]
output2=args[3]
addTrans <- function(color,trans)
{
  # This function adds transparancy to a color.
  # Define transparancy with an integer between 0 and 255
  # 0 being fully transparant and 255 being fully visable
  # Works with either color and trans a vector of equal length,
  # or one of the two of length 1.

  if (length(color)!=length(trans)&!any(c(length(color),length(trans))==1)) stop("Vector lengths not correct")
  if (length(color)==1 & length(trans)>1) color <- rep(color,length(trans))
  if (length(trans)==1 & length(color)>1) trans <- rep(trans,length(color))

  num2hex <- function(x)
  {
    hex <- unlist(strsplit("0123456789ABCDEF",split=""))
    return(paste(hex[(x-x%%16)/16+1],hex[x%%16+1],sep=""))
  }
  rgb <- rbind(col2rgb(color),trans)
  res <- paste("#",apply(apply(rgb,2,num2hex),2,paste,collapse=""),sep="")
  return(res)
}

d=read.table(input,header=F)
#colnames(d)=c("Length","seedReads","genomeReads","allReads")
colnames(d)=c("Length","seedReads","unmappedReads")

col3=addTrans(colorRampPalette(brewer.pal(9,"Blues"))(6)[6],200)
col2=colorRampPalette(brewer.pal(9,"Blues"))(6)[6]
col1=addTrans(colorRampPalette(brewer.pal(9,"Blues"))(6)[4],200)

d2=d
#d2[,3]=d2[,3]/100

pdf(output)
myplot = ggplot(data=d2, aes(x=Length, y=unmappedReads)) + 
geom_bar(stat="identity", fill=col1, colour=col1)+
geom_bar(data=d, aes(x=Length, y=seedReads),
         stat="identity", fill=col3, colour=col3)
myplot + theme(panel.background = element_blank()) +ggtitle("Read length distribution of seedReads and genomeMappingreads")
dev.off()

pdf(output2)
myplot = ggplot(data=d, aes(x=Length, y=seedReads)) +
geom_bar(stat="identity", fill=col2, colour=col2)
myplot + theme(panel.background = element_blank()) +ggtitle("Read length distribution of seedReads")
dev.off()
