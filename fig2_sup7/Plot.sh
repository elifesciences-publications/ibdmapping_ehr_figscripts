for i in {1..22}

do

echo 'OMNI_Chr'${i}'_DASH_Depth <- read.table("OMNI_Chr'${i}'_DASH_Depth.MB.txt", quote="\"")'
#echo 'tiff("DASH_Depth_Chr'${i}'.tiff",height=800,width=1000)'
echo 'd'${i}' <- ggplot(data=OMNI_Chr'${i}'_DASH_Depth) + geom_point(aes(x=V1,y=V6)) + theme_classic()  + geom_hline(yintercept = 80.13548, linetype=2,colour="red",size=2.5) + scale_x_continuous(labels=comma,"Physical Position (Mb)") + scale_y_continuous(labels=comma,"DASH Cluster Size") + labs(title="Chromosome '${i}'") + guides(colour=FALSE) + theme(panel.grid.major = element_blank(),
legend.position = "none",                                                                                                                                                                 panel.grid.minor = element_blank(),
panel.background = element_blank(), 
legend.text = element_text(size=20),
legend.title = element_text(size=24),
axis.text.x = element_text(size=24),
axis.text.y = element_text(size=24),  
axis.title.x = element_text(size=22),
axis.title.y = element_text(size=20),
plot.title = element_text(size=24),
panel.border = element_rect(colour = "black",size=1,fill=NA))'

#echo 'dev.off()'
done

 
