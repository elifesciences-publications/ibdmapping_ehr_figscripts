center_scale <- function(x) {
     scale(x, scale = FALSE)
 }

library(ggplot2)
library(RColorBrewer)
x=read.delim("HL.PCA.mapped.collapsed.FINAL",sep="",header=F)

rescale=center_scale(x[,2:6])
y=as.data.frame(rescale)
z=cbind(x[,1],y)
tiff("PCA_HL.OMNI.tiff",height=700,width=850)
colnames(z)[1] <- "V1"
z$Region=z$V1
pr=z[which(z$V1 == 'PuertoRico'),]

ggplot(data=z) + geom_point(aes(x=V2,y=V3,fill=Region),shape=21,alpha=0.85,size=4,colour="grey30") + theme_classic() + scale_fill_manual(values=c("#E6F598","#D53E4F","#FDAE61","#FEE08B","#66C2A5","#ABDDA4","#3288BD","#F46D43"))  + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),  axis.text.x = element_text(size=15), axis.text.y = element_text(size=15),axis.title.x = element_text(size=20,face="bold"), axis.title.y = element_text(size=20,face="bold"),legend.justification=c(1,1), legend.position=c(0.35,0.95),legend.text = element_text(size=20),legend.title = element_text(size=20)) + xlab("PC1") + ylab("PC2") + geom_point(data=pr,aes(x=V2,y=V3),shape=21,alpha=0.85,size=4,colour="grey30",fill="#ABDDA4")
dev.off()