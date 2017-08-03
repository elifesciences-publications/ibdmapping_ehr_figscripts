library(qqman)

library("data.table")
library(qqman)
x=fread("OMNI.PR.Recessive.Height.MAC2.INFO0.3.txt.NA.RM.ranked",header=F)

png("PR_Recessive_GWAS_QQ_Plot.png",height=600,width=600)
qq(x$V16,cex=3,cex.lab=1.8,cex.axis=1.8,ylab="",xlab="",ylim=c(0,14),xlim=c(0,5))
title(ylab="Observed -log10(P)", line=2.5, cex.lab=1.8,xlab="Expected -log10(P)")
box(lwd=2) 
dev.off()

