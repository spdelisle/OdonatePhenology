library('phytools')


####### Phylogeny Plot ####
x<-as.matrix(read.csv("justb.csv",row.names=1))[,1]
tree<- read.tree(file = "DeLisle49SPPhylogeny.txt")
num<-seq(1:49)
tree$tip.label<-num
plotTree.barplot(tree,x, tip.label=FALSE, args.barplot=list(col=sapply(x,
                                                     function(x) if(x>=0) "blue" else "red"),
                                          xlim=c(-15,6)))


#phylogenetic signal
sig<-phylosig(tree, x, method="lambda", test=TRUE)
sig



