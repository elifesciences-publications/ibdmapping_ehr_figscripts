library(ggplot2)

PuertoRican_Chr9_ihs=read.table("PuertoRican_Chr9.ihs.out",sep="\t",header=F)
PuertoRican_Chr9_ihs$MB=PuertoRican_Chr9_ihs$V2/1000000

tiff("iHS_chr9_IBDRegion.tiff",height=600,width=600)

ggplot(data=PuertoRican_Chr9_ihs) + geom_point(aes(x=MB,y=V6)) + scale_x_continuous(limits=c(112,120),"Physical Position on chromosome 9 (Mb)") + scale_y_continuous("iHS") + theme_classic()   + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA), axis.text.x = element_text(size=14), axis.text.y = element_text(size=20),axis.title.x = element_text(size=16), axis.title.y = element_text(size=20)) 
dev.off()
