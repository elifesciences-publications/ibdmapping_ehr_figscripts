library(ggplot2)
library(scales)
True_Hom_ROH <- read.table("True_Hom_ROH.R_Input", quote="\"")
True_Hom_ROH$Individual=as.character(True_Hom_ROH$V1)
tiff("haplospan.zoomin.tiff",height=500,width=1200)
#ggplot() + geom_rect(data=True_Hom_ROH,aes(xmin=V3,xmax=V4,ymin=V1,ymax=V2),fill="lightyellow2",color="black") + theme_classic() + scale_x_continuous(labels=comma) + theme(panel.border = element_rect(colour = "black",size=1,fill=NA),axis.text.y=element_blank()) + xlab("Physical Position (bp)") + ylim(values=c(1.5,6.25)) + coord_cartesian(xlim=c(112000000,120000000))

ggplot() + geom_rect(data=True_Hom_ROH,aes(xmin=V4,xmax=V5,ymin=V2,ymax=V3,fill=Individual),color="black") + theme_classic() + scale_x_continuous(labels=comma) + theme(panel.border = element_rect(colour = "black",size=1,fill=NA),axis.text.y=element_blank()) + scale_x_continuous("Physical Position (Mb)",labels=c("112","114","116","118","120")) + ylim(values=c(1.5,6.25)) + coord_cartesian(xlim=c(112000000,120000000)) + scale_fill_manual(values=c("lightyellow3","lightseagreen","coral")) + geom_vline(aes(xintercept=116880031),linetype=2,colour="deepskyblue3",size=1.2) + geom_vline(aes(xintercept=117019801),linetype=2,size=1.2,colour="deepskyblue3") + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),legend.justification=c(1,1), legend.position=c(0.2,1), axis.text.x = element_text(size=28), axis.text.y = element_text(size=28),axis.title.x = element_text(size=28,face="bold"), axis.title.y = element_text(size=28,face="bold"),legend.text = element_text(size=24),legend.title = element_text(size=26,face="bold"))  + guides(colour = guide_legend(override.aes = list(size=3)))


dev.off()
