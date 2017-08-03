center_scale <- function(x) {
    scale(x, scale = FALSE)
}

library(ggplot2)
HL.Subcontinental.Supervised.WithGIH.pca.evec <- read.table("HL.Subcontinental.Supervised.WithGIH.pca.evec.mapped", quote="\"")
x = center_scale(HL.Subcontinental.Supervised.WithGIH.pca.evec[,3:22])
y=as.data.frame(x)
z=cbind(HL.Subcontinental.Supervised.WithGIH.pca.evec[,1:2],HL.Subcontinental.Supervised.WithGIH.pca.evec[,23],y)
tiff("New_HL_PCA_Coloured.tiff",height=700,width=850)
HL.Subcontinental.Supervised.WithGIH.pca.evec$Population=HL.Subcontinental.Supervised.WithGIH.pca.evec$V1
ggplot(z) + geom_point(aes(x=V3,y=V4,fill=V1),size=4,shape=21,colour="grey40",alpha=0.9) + theme_classic()  + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),  axis.text.x = element_text(size=20), axis.text.y = element_text(size=20),axis.title.x = element_text(size=20,face="bold"), axis.title.y = element_text(size=20,face="bold"),legend.justification=c(1,1), legend.position=c(0.4,0.35),legend.text = element_text(size=20),legend.title = element_text(size=20)) + scale_fill_manual(values=c("blue","orange1","cornflowerblue","burlywood2",'red','indianred2',"forestgreen","deeppink3","darkseagreen"),name="H/L Subcontinental Group",labels=c("Africa","other Caribbean Island","Central/South America","Dominican Republic","Europe","Mexico","Native American","Puerto Rico","US Mainland")) + xlab("PC1 (46.8%)") + ylab("PC2 (20.1%)")

dev.off()
