library(ggplot2)

center_scale <- function(x) {
    scale(x, scale = FALSE)
}

AA.Subcontinental.Supervised.WithGIH.pca.evec <- read.table("AA.Subcontinental.Supervised.WithGIH.pca.evec.mapped", quote="\"")
x = center_scale(AA.Subcontinental.Supervised.WithGIH.pca.evec[,2:21])
y=as.data.frame(x)
AA.Subcontinental.Supervised.WithGIH.pca.evec=cbind(AA.Subcontinental.Supervised.WithGIH.pca.evec[,1],y)
colnames(AA.Subcontinental.Supervised.WithGIH.pca.evec)[1] <- "V1"
tiff("AA_Subcontinental_PC1vsPC2.tiff",height=700,width=700)
ggplot(data=AA.Subcontinental.Supervised.WithGIH.pca.evec) +  geom_point(aes(x=V2,y=V3,fill=V1),size=3,shape=21,colour="grey30") + theme_classic() + scale_fill_manual(values=c("grey80","red","gold","seagreen","blue"),name="Population",labels=c("BioMe African American","European","South Asian","Native American","African"))  + xlab("PC1 (46.8%)") + ylab("PC2 (20.1%)") + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),  axis.text.x = element_text(size=20), axis.text.y = element_text(size=20),axis.title.x = element_text(size=20,face="bold"), axis.title.y = element_text(size=20,face="bold"),legend.justification=c(1,1), legend.position=c(0.45,0.35),legend.text = element_text(size=20),legend.title = element_text(size=20))

dev.off()
