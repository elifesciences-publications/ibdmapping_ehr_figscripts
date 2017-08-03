library(ggplot2)
library(scales)
##R_inputIBD_Point <- read.table("R_inputIBD_Point_Homozygotes", quote="\"") <- this file not provided due to presence of potentially de-identifying information
R_inputIBD_Boxplot <- read.table("PR.Only_Boxplot", quote="\"")
#R_inputIBD_Point$CopyNumber=as.character(R_inputIBD_Point$V5)
R_inputIBD_Boxplot$CopyNumber=as.character(R_inputIBD_Boxplot$V4)
#R_inputIBD_Point$Sex=R_inputIBD_Point$V2
R_inputIBD_Boxplot$Sex=R_inputIBD_Boxplot$V2


## following line removed due to potentially de-identifying information
## +  geom_point(data=R_inputIBD_Point,aes(x=CopyNumber,y=V4,colour=Sex),size=6,position=position_dodge(width=0.5))

tiff("effectSize.new.tiff",height=700,width=800)
ggplot() + geom_violin(data=R_inputIBD_Boxplot,aes(x=CopyNumber,y=V3,fill=Sex),position=position_dodge(width=1)) + geom_boxplot(data=R_inputIBD_Boxplot,aes(x=CopyNumber,y=V3,colour=Sex),width=.2,position = position_dodge(width = 1),outlier.colour = NULL,outlier.size=5) +  xlab("Number of 9q32 IBD Haplotypes") + ylab("Height (Inches)") + scale_fill_manual(values=c("firebrick","skyblue3")) + scale_colour_manual(values=c("firebrick","skyblue3"))  + theme_classic() + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),legend.justification=c(1,1), legend.position=c(1,1), axis.text.x = element_text(size=22), axis.text.y = element_text(size=22),axis.title.x = element_text(size=22,face="bold"), axis.title.y = element_text(size=22,face="bold"),legend.text = element_text(size=30),legend.title = element_text(size=30))  + guides(colour = guide_legend(override.aes = list(size=3)))
dev.off()
