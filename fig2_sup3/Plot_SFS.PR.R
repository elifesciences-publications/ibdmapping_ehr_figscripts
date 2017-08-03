ALL_3cM_DASH <- read.table("PR.3cM.DASH.frq", header=TRUE, quote="\"")

options(scipen=10)
tiff("SFS_IBD_PR.tiff",height=800,width=950)
hist(ALL_3cM_DASH$MAF,breaks=40,col="deepskyblue4", xlab="Haplotypic Frequency",ylab="Count",main=NULL,cex.lab=1.5,cex.axis=1.5)
dev.off()

