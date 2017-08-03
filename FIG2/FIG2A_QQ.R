library(qqman)
x <- read.table("PR_3Copies.linear.recessive.5PCs.assoc.linear.FINAL", header=F, quote="\"")
tiff("FIG2A_QQ_Plot.tiff",height=600,width=600)
qq(x$V9,cex=3,cex.lab=1.8,cex.axis=1.8,ylab="",xlab="",ylim=c(0,14),xlim=c(0,5))
title(ylab="Observed -log10(P)", line=2.5, cex.lab=1.8,xlab="Expected -log10(P)")
box(lwd=2) 
dev.off()

