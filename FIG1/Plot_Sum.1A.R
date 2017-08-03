library(ggplot2)
### note update outlier colour only works with some R versions
update_geom_defaults("point", list(colour = NULL))
Plot_Sum_Sharing <- read.table("Plot_Sum_Sharing", quote="\"")
tiff("Sum_Sharing_violin.tiff",height=900,width=850)
ggplot(data=Plot_Sum_Sharing) + geom_violin(aes(x=V1,y=V3),width=1.8,fill="lightsteelblue3")  + theme_classic() + scale_y_log10("Log10(Sum IBD sharing) (cM)") + scale_x_discrete("BioMe participants",labels=c("AA","AJ","HL","NonAJ EA")) + geom_boxplot(aes(x=V1,y=V3),width=.075,colour="darkcyan")  + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),  axis.text.x = element_text(size=16), axis.text.y = element_text(size=16),axis.title.x = element_text(size=16,face="bold"), axis.title.y = element_text(size=16,face="bold"))

update_geom_defaults("point", list(colour = "black"))
dev.off()
