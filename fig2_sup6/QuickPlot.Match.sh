for i in {1..22}

do

echo 'ipm.combo.phased.pruned2_chr'${i}'.IBD.depth <- read.table("ipm-combo-phased-pruned2_chr'${i}'.IBD-depth.MB.txt", quote="\"")'
#echo 'tiff("QC_MatchFiles_Chromosome'${i}'.Line.tiff", height=600,width=800)'
echo 'p'${i}' <- ggplot(data=ipm.combo.phased.pruned2_chr'${i}'.IBD.depth) + geom_point(aes(x=V1,y=V3)) + theme_classic()  + geom_hline(yintercept = (3 * sd(ipm.combo.phased.pruned2_chr'${i}'.IBD.depth$V3) + mean(ipm.combo.phased.pruned2_chr'${i}'.IBD.depth$V3)), linetype=2,colour="firebrick",size=2.5) + geom_hline(yintercept = (mean(ipm.combo.phased.pruned2_chr'${i}'.IBD.depth$V3 - (3 * sd(ipm.combo.phased.pruned2_chr'${i}'.IBD.depth$V3)))), linetype=2,colour="firebrick",size=2.5) + scale_x_continuous(labels=comma,"Physical Position (Mb)") + scale_y_continuous(labels=comma,"Depth of Pairwise IBD Sharing") + labs(title="Chromosome '${i}'")  + guides(colour=FALSE) + theme(panel.grid.major = element_blank(),
legend.position = "none",                                                                                                                                                                 panel.grid.minor = element_blank(),
panel.background = element_blank(), 
legend.text = element_text(size=20),
legend.title = element_text(size=20),
axis.text.x = element_text(size=24),
axis.text.y = element_text(size=24),  
axis.title.x = element_text(size=24),
axis.title.y = element_text(size=24),
plot.title = element_text(size=24),
panel.border = element_rect(colour = "black",size=1,fill=NA))'

#echo 'dev.off()'
done

