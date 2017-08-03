library("ggplot2")
Height_Comparison <- read.table("Height.Data.PuertoRican_Only.age_stripped.txt", quote="\"")

Height_F_in=Height_Comparison[which(Height_Comparison$V3== 'Female'),]
Height_M_in=Height_Comparison[which(Height_Comparison$V3== 'Male'),]

F_line=mean(Height_F_in$V4) - (2 * sd(Height_F_in$V4))
M_line=mean(Height_M_in$V4) - (2 * sd(Height_M_in$V4))

F_outlier=Height_F_in[which(Height_F_in$V4 <= F_line),]
M_outlier=Height_M_in[which(Height_M_in$V4 <= M_line),]

Height_Comparison$Sex=Height_Comparison$V3

tiff("PuertoRican_Height_Distribution.tiff",height=600,width=700)
ggplot(data=Height_Comparison) + geom_violin(aes(x=as.factor(Sex),y=V4,fill=Sex),position=position_dodge(width=1)) + geom_boxplot(aes(x=as.factor(Sex),y=V4,colour=Sex),width=.2,position = position_dodge(width = 1),outlier.colour = NULL,outlier.size=3) + theme_classic() + scale_colour_manual(values=c("firebrick","skyblue3")) + scale_fill_manual(values=c("firebrick","skyblue3")) + scale_x_discrete("Sex",labels=c("Female","Male")) + guides(colour = guide_legend(override.aes = list(size=2))) + geom_segment(aes(x = 0.75, y = F_line, xend = 1.25, yend = F_line),linetype=2)  + geom_segment(aes(x = 1.75, y = M_line, xend = 2.25, yend = M_line),linetype=2) + annotate("text",x=0.8,y=73,label="n=1662",colour="black",size=8) + annotate("text",x=1.75,y=77,label="n=960",colour="black",size=8) +  theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),legend.justification=c(1,1), legend.position=c(0.95,0.2),legend.text = element_text(size=20),legend.title = element_text(size=20),axis.text.x = element_text(size=22), axis.text.y = element_text(size=22),axis.title.x = element_text(size=22,face="bold"), axis.title.y = element_text(size=22,face="bold")) + ylab("Height (Inches)")
dev.off()
