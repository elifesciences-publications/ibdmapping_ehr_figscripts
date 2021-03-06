library("gap")
GLM=read.delim("Firth.Out.FINAL.txt.mapped",sep="\t",header=F)
png("Firth_PHEWAS_QQ.png",height=850,width=850)
gcontrol2(GLM$V4,pch=20,col=("steelblue"),lcol="steelblue4",cex=1.5,cex.lab=1.5,cex.axis=1.5)
dev.off()
l=gcontrol2(GLM$V4)
l1=as.data.frame(as.table(print(l$lambda)))
l1$Var1="Overall_Additive"
write.table(l1,"Lambda_Firth.txt")
