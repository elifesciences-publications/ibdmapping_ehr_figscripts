library(ggplot2)
TLD_HLStrat <- read.table("TLD_HLStrat", quote="\"")
TLD_HLStrat$Population <- factor(TLD_HLStrat$V1,levels=c("AJ","PuertoRican","US_Mainland","Dominican","Mexican","NonAJ","CentralSouth_American","AA","Other_Caribbean"))
tiff("TLD_HLstrat.tiff",height=550,width=700)
ggplot(data=TLD_HLStrat) + geom_line(aes(x=V2,y=V3,colour=Population)) + xlim(values=c(3,20)) + theme_classic() + ylim(values=c(0,0.02)) + xlab("IBD Tract Length (cM)") + ylab("Population Level Sharing") + scale_colour_manual(values=c("steelblue1","firebrick4","#FDAE61","lightsalmon1","#FFFFBF","deeppink1","#ABDDA4","#66C2A5","#3288BD"),labels=c("AJ","Puerto Rico","US Mainland","Dominican Republic","Mexico","NonAJ EA","Central/South America","AA","other Caribbean Island")) + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),legend.justification=c(1,1), legend.position=c(0.9,0.9),legend.text = element_text(size=20),legend.title = element_text(size=20),axis.text.x = element_text(size=16), axis.text.y = element_text(size=14),axis.title.x = element_text(size=16,face="bold"), axis.title.y = element_text(size=16,face="bold")) + guides(colour = guide_legend(override.aes = list(size=3)))
## labels=c("AJ","Puerto Rico","US Mainland","Dominican Republic","Mexico","NonAJ EA","Central/South America","AA","other Caribbean Island")
dev.off()
 