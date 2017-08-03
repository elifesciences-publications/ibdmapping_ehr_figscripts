PuertoRican_GERMLINE <- read.delim("PuertoRican_GERMLINE.ne")
PuertoRican_GERMLINE_50=PuertoRican_GERMLINE[which(PuertoRican_GERMLINE$GEN<=25 & PuertoRican_GERMLINE$GEN>=4),]
library(ggplot2)
library(scales)
tiff("PuertoRican_GERMLINE.ne.25gen.tiff",height=600,width=700)
ggplot(data=PuertoRican_GERMLINE_50) + geom_line(aes(x=GEN,y=NE),colour="steelblue4") + geom_ribbon(data=PuertoRican_GERMLINE_50,aes(x=GEN,ymin=LWR.95.CI,ymax=UPR.95.CI),alpha=0.3,fill="steelblue4") + theme_classic() + scale_y_log10(labels=comma) + xlab("Generations Ago") + ylab("log10(Ne)") + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA),legend.justification=c(1,1), legend.position=c(0.9,0.9),legend.text = element_text(size=20),legend.title = element_text(size=20),axis.text.x = element_text(size=16), axis.text.y = element_text(size=14),axis.title.x = element_text(size=16,face="bold"), axis.title.y = element_text(size=16,face="bold"))
dev.off()
