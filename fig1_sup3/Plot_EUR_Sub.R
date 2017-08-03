library(ggplot2)


center_scale <- function(x) {
    scale(x, scale = FALSE)
}

EA_REFs.fixed <- read.table("EA.Subcontinental.pca.mapped", quote="\"")


x = center_scale(EA_REFs.fixed[,2:21])
y=as.data.frame(x)
EA_REFs.fixed=cbind(EA_REFs.fixed$V1,y)
colnames(EA_REFs.fixed)[1] <- "V1"


dfs=split(EA_REFs.fixed,EA_REFs.fixed$V1)
df2 = dfs[sapply(dfs, function(x) dim(x)[1]) > 0]
list2env(df2, envir= .GlobalEnv)

tiff("EA_Subcontinental_PC1vsPC2.tiff",height=700,width=700)
ggplot(data=EA_REFs.fixed) + geom_point(aes(x=V2,y=V3,fill=V1),size=2,shape=21,colour="grey20") + theme_classic() + scale_fill_manual(values=c("indianred2","ivory3","skyblue3","darkseagreen","deeppink","navajowhite1"),name="Population",labels=c("Ashkenazi Jewish","BioMe European American","Finland","United Kingdom","Spain","Italy")) + geom_point(data=AJ,aes(x=V2,y=V3),fill="indianred2",size=2,shape=21) + geom_point(data=FIN,aes(x=V2,y=V3),fill="skyblue3",size=2,shape=21) + geom_point(data=GBR,aes(x=V2,y=V3),fill="darkseagreen",size=2,shape=21) + geom_point(data=IBS,aes(x=V2,y=V3),fill="deeppink",size=2,shape=21) + geom_point(data=TSI,aes(x=V2,y=V3),fill="navajowhite1",size=2,shape=21)  + xlab("PC1 (16.4%)") + ylab("PC2 (9.1%)") + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),  axis.text.x = element_text(size=18), axis.text.y = element_text(size=18),axis.title.x = element_text(size=18,face="bold"), axis.title.y = element_text(size=18,face="bold"),legend.justification=c(1,1), legend.position=c(0.45,0.99),legend.text = element_text(size=18),legend.title = element_text(size=20))
dev.off()

