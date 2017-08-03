library(scales)
library(ggplot2)
R_IBD_Region_ibd <- read.table("R_IBD_input.IBD.MB", quote="\"")
R_IBD_Region_Zoom <- read.table("R_IBD_input.zoomout.MB", quote="\"")

tiff("Homozygotes_LAC_IBD.Min.Anno.tiff",height=600,width=1500)
ggplot() + geom_rect(data=R_IBD_Region_Zoom,aes(xmin=V4,xmax=V5,ymin=V1,ymax=V2,fill=V6),alpha=0.4) +  scale_x_continuous(limits=c(107,120),labels=comma) + geom_rect(data=R_IBD_Region_ibd,aes(xmin=V4,xmax=V5,ymin=V1,ymax=V2,fill=V6),alpha=1,color="black") + theme_bw() + scale_fill_manual(values=c("dodgerblue","indianred3","seagreen","grey"),name="Local Ancestry",labels=c("African","European","Native American","Undetermined")) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),axis.text.x = element_text(size=20), axis.text.y = element_text(size=20),axis.title.x = element_text(size=20), axis.title.y = element_text(size=20),legend.text = element_text(size=20),legend.title=element_text(size=20),legend.justification=c(1,1), legend.position=c(0.15,0.25),legend.text = element_text(size=20),axis.ticks.y=element_blank(),legend.title = element_text(size=20),legend.background = element_rect(colour = "black"),panel.border = element_rect(colour = "black",size=1,fill=NA)) + xlab("Chr9 (Mb)") + ylab("Individual Haplotype")  + geom_vline(aes(xintercept=116.88),linetype=2,size=0.5,colour="grey10") + geom_vline(aes(xintercept=117.019801),linetype=2,size=0.5,colour="grey10")
dev.off()
