library("ggplot2")
library("RColorBrewer")
spectpal = colorRampPalette(brewer.pal(11, "Spectral"))(16)

FIRTH=read.delim("Firth.Out.FINAL.txt.mapped",sep="\t",header=F)
SPATEST=read.delim("SPAtest.Out.PCA.txt.FINAL.mapped",sep="\t",header=F)
GCTA=read.delim("GCTA.PHEWAS.OUT.FINAL.txt.mapped",sep="\t",header=F)

FIRTH$fdr=p.adjust(FIRTH$V4,method="fdr")
GCTA$fdr=p.adjust(GCTA$V10,method="fdr")
SPATEST$fdr=p.adjust(SPATEST$V4,method="fdr")

GCTA_SIG=GCTA[which(GCTA$fdr < 0.05),]
SPATEST_SIG=SPATEST[which(SPATEST$fdr < 0.05),]
FIRTH_SIG=FIRTH[which(FIRTH$fdr < 0.05),]

tiff("SPATEST_PHEWAS.tiff",height=500,width=1000)
ggplot(data=SPATEST) + geom_jitter(aes(x=V17,y=-log10(V4),fill=V17),shape=21,size=4.5) + theme_classic() + xlab("Disease Category") + ylab("-log10(P)") + theme(panel.border = element_rect(colour = "black",size=1,fill=NA),axis.text.x = element_text(angle = 45, hjust = 1)) + guides(fill=FALSE)  +  scale_fill_manual(values=spectpal) + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA), axis.text.x = element_text(size=14), axis.text.y = element_text(size=20),axis.title.x = element_text(size=14), axis.title.y = element_text(size=20)) + scale_y_continuous(limits=c(0,14))
dev.off()

tiff("GCTA_PHEWAS.tiff",height=500,width=1000)
ggplot(data=GCTA) + geom_jitter(aes(x=V21,y=-log10(V10),fill=V21),shape=21,size=4.5) + theme_classic() + xlab("Disease Category") + ylab("-log10(P)") + theme(panel.border = element_rect(colour = "black",size=1,fill=NA),axis.text.x = element_text(angle = 45, hjust = 1)) + guides(fill=FALSE) + geom_hline(aes(yintercept=-log10(2.95e-04)),colour="firebrick",linetype=2) +  scale_fill_manual(values=spectpal) + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA), axis.text.x = element_text(size=14), axis.text.y = element_text(size=20),axis.title.x = element_text(size=14), axis.title.y = element_text(size=20)) + scale_y_continuous(limits=c(0,14))
dev.off()

tiff("FIRTH_PHEWAS.tiff",height=500,width=1000)
ggplot(data=FIRTH) + geom_jitter(aes(x=V18,y=-log10(V4),fill=V18),shape=21,size=4.5) + theme_classic() + xlab("Disease Category") + ylab("-log10(P)") + theme(panel.border = element_rect(colour = "black",size=1,fill=NA),axis.text.x = element_text(angle = 45, hjust = 1)) + guides(fill=FALSE) + geom_hline(aes(yintercept=-log10(8.3e-03)),colour="firebrick",linetype=2) +  scale_fill_manual(values=spectpal)  + theme(panel.grid.major = element_blank(),panel.border = element_rect(colour = "black",size=1,fill=NA), axis.text.x = element_text(size=14), axis.text.y = element_text(size=20),axis.title.x = element_text(size=16), axis.title.y = element_text(size=20)) + scale_y_continuous(limits=c(0,14))
dev.off()