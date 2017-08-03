x=read.table("RelateAdmix.DMSHA.References.3.Q.mapped",header=F)
dfs=split(x,x$V1)
df2 = dfs[sapply(dfs, function(x) dim(x)[1]) > 0]
list2env(df2, envir= .GlobalEnv)
names(which(sapply(df2, is.data.frame))) 
index_1=unlist(lapply(df2,function(x){nrow(x)}))
to_remove=which(index_1==1)
cat(names(index_1)[to_remove])
df2_subset=df2[-to_remove]

list2env(df2, envir= .GlobalEnv)
newmat=c()
z=matrix(data=0,nrow=5,ncol=ncol(AMERICA))

newmat=rbind(AFR,z,EUR,z,AMERICA)
tiff("ADMIXTURE_K3_OMNI_RelateAdmix_REFS.tiff",height=300,width=800)
barplot(t(newmat[,3:5]),border=NA,space=0,col=c("forestgreen","firebrick","blue"), ylab='k3', xaxt= 'n')
dev.off()
