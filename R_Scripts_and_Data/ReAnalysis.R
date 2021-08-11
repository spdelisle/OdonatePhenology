
library(MCMCglmm)
### odonate super tree 
load("/Users/stephen/Documents/Phenology /revised_R/trees/tree.rda")

makeTransparent = function(..., alpha=0.5) {
  
  if(alpha<0 | alpha>1) stop("alpha must be between 0 and 1")
  
  alpha = floor(255*alpha)  
  newColor = col2rgb(col=unlist(list(...)), alpha=FALSE)
  
  .makeTransparent = function(col, alpha) {
    rgb(red=col[1], green=col[2], blue=col[3], alpha=alpha, maxColorValue=255)
  }
  
  newColor = apply(newColor, 2, .makeTransparent, alpha=alpha)
  
  return(newColor)
  
}
library('phytools')
library(geiger)
library(ape)
tr<-read.tree("DeLisle49SPPhylogeny.txt") ##old tree, just loading to get tip names
names<-tr$tip.label
small_tree<-keep.tip(tree, names)
#write.tree(small_tree, "delisle_et_al_tree.txt")
small_tree<-read.tree("delisle_et_al_tree.txt")
nums<-seq(1:49)
small_tree_n<-small_tree
small_tree_n$tip.label<-nums


dat<-read.csv("swedish_odonate_temperature.csv", header = TRUE)
dat$yearf<-as.factor(dat$year)
dat$yearlat<-paste0(dat$yearf, dat$lat_binned)
#boxplot(y~lat_binned, data = dat) #plot lat vs bin
##latitude values over 65 binned together in " " 
dat$lat_binned<-as.factor(dat$lat_binned)
dat$rownum<-as.factor(dat$rownum)




G=list(G1=list(V=diag(2), nu=.2), 
       G2=list(V=diag(2), nu=.2))
R=list(V=diag(2), nu=.002)
B = list(mu = c(0,0,0,0,0,0),  V=diag(6)*100000)
prior=list(R=R, G=G, B=B)
set.seed(1)

#test on one species
#Full_model <- MCMCglmm(cbind(day, one20) ~ trait + trait:y+ trait:year-1, 
#                      random = ~us(trait):lat_binned + us(trait):yearlat, rcov = 
#                        ~ us(trait):rownum,  prior = prior, data = dat1, 
#                      family = c(rep("gaussian", 2)), verbose = FALSE)

#modevcv<-posterior.mode(Full_model$VCV)
#matrix(modevcv[1:4], 2, 2)
#matrix(modevcv[5:8], 2, 2)
#matrix(modevcv[9:12], 2, 2)

#modefixed<-posterior.mode(Full_model$Sol)
#B_est<-modefixed[3]/modefixed[4]
#B_est
#b_est<-modevcv[6]/modevcv[8]

#B_post<- matrix(, nrow=nrow(Full_model$Sol), ncol=1)
#for(i in 1:(nrow(Full_model$Sol))){
#  B_post[i,]<-Full_model$Sol[i,3]/Full_model$Sol[i,4]
#}
#hist(B_post)

#b_post<- matrix(, nrow=nrow(Full_model$VCV), ncol=1)
#for(i in 1:(nrow(Full_model$VCV))){
#  b_post[i,]<-Full_model$VCV[i,6]/Full_model$VCV[i,8]
#}
#dif<-b_post-B_post
#hist(dif)


######### loop through all species
models <- vector(mode = "list", length = 49)
for(i in 1:49){
small_dat<-subset(dat, name==i)
set.seed(1)
models[[i]]<- MCMCglmm(cbind(day, one20) ~ trait + trait:y+ trait:year-1, 
            random = ~us(trait):lat_binned + us(trait):yearlat, rcov = 
              ~ us(trait):rownum,  prior = prior, data = small_dat, 
            family = c(rep("gaussian", 2)), verbose = FALSE)
}
#save(models, file = "models_Aug4.RData")
load("/Users/stephen/Documents/Phenology /revised_R/models_Aug4.RData")

posterior_modes<-matrix(, nrow=49, ncol=7)
  for(i in 1:49){
posterior_modes[i,1] <-posterior.mode(models[[i]]$Sol)[3]/posterior.mode(models[[i]]$Sol)[4]
posterior_modes[i,2]<-posterior.mode(models[[i]]$VCV)[6]/posterior.mode(models[[i]]$VCV)[8]
small_dat<-subset(dat, name==i)
posterior_modes[i,3]<-mean(small_dat$y)
posterior_modes[i,4]<-mean(small_dat$one20)
posterior_modes[i,5]<-abs(posterior.mode(models[[i]]$VCV)[6]/posterior.mode(models[[i]]$VCV)[8]-posterior.mode(models[[i]]$Sol)[3]/posterior.mode(models[[i]]$Sol)[4])
#posterior_modes[i,6]<-(posterior.mode(models[[i]]$VCV)[5]+posterior.mode(models[[i]]$VCV)[8])*((posterior.mode(models[[i]]$VCV)[6]/(sqrt(posterior.mode(models[[i]]$VCV)[8])*sqrt(posterior.mode(models[[i]]$VCV)[5])))^2)/(posterior.mode(models[[i]]$VCV)[1]+posterior.mode(models[[i]]$VCV)[4]+posterior.mode(models[[i]]$VCV)[5]+posterior.mode(models[[i]]$VCV)[8]+posterior.mode(models[[i]]$VCV)[9]+posterior.mode(models[[i]]$VCV)[12])
posterior_modes[i,6]<-(posterior.mode(models[[i]]$VCV)[5])*((posterior.mode(models[[i]]$VCV)[6]/(sqrt(posterior.mode(models[[i]]$VCV)[8])*sqrt(posterior.mode(models[[i]]$VCV)[5])))^2)/(posterior.mode(models[[i]]$VCV)[1]+posterior.mode(models[[i]]$VCV)[5]+posterior.mode(models[[i]]$VCV)[9])
posterior_modes[i,7]<-mean(small_dat$day)
}

post_modes<-data.frame(posterior_modes)
colnames(post_modes)[1] <- "B"
colnames(post_modes)[2] <- "b"
colnames(post_modes)[3] <- "lat"
colnames(post_modes)[4] <- "temp"
colnames(post_modes)[5] <- "diff"
colnames(post_modes)[6] <- "Rsq"
colnames(post_modes)[7] <- "day"
post_modes$AbsBbB<-abs(post_modes$B-post_modes$b)/abs(post_modes$B)

variances<- vector(mode = "list", length = 49)
for(j in 1:49){temp<- matrix(, nrow = 1000, ncol = 5)
for(i in 1:1000){
temp[i, 1]<-(models[[j]]$Sol)[i,3]/(models[[j]]$Sol)[i,4]
temp[i, 2]<-(models[[j]]$VCV)[i,6]/(models[[j]]$VCV)[i,8]
temp[i, 3]<-(models[[j]]$VCV[i,5])*((models[[j]]$VCV[i,6]/(sqrt(models[[j]]$VCV[i,8])*sqrt(models[[j]]$VCV[i,5])))^2)/(models[[j]]$VCV[i,1]+models[[j]]$VCV[i,5]+models[[j]]$VCV[i,9])
temp[i, 4]<-abs((models[[j]]$VCV)[i,6]/(models[[j]]$VCV)[i,8]-(models[[j]]$Sol)[i,3]/(models[[j]]$Sol)[i,4])
temp[i, 5]<-abs(temp[i, 1]-temp[i, 2])/abs(temp[i, 1])
}
variances[[j]]<-temp
}

for(j in 1:49){
post_modes$VarRsq[j]<-var(variances[[j]][,3])
post_modes$VarDiff[j]<-var(variances[[j]][,4])
post_modes$VarB[j]<-var(variances[[j]][,1])
post_modes$Varb[j]<-var(variances[[j]][,2])
post_modes$VarAbsBbB[j]<-var(variances[[j]][,5])
}


### Sort data to match tree
post_modes$species<-nums
rownames(post_modes)<-post_modes$species
is_tip <- small_tree_n$edge[,2] <= length(small_tree_n$tip.label)
ordered_tips <- small_tree_n$edge[is_tip, 2]
post_modes<-post_modes[match(small_tree_n$tip.label[ordered_tips], post_modes$species),]



inv.phylo<-inverseA(small_tree_n,nodes="TIPS",scale=TRUE)

prior2 <- list(R = list(V = diag(1), nu = 0.002),
               G = list(G1=list(V=1,nu=0.002), G2 = list(V = diag(1), fix = 1)))



#m1ABd<- MCMCglmm(AbsBbB~lat, family = "gaussian", data = post_modes, 
 #               random =~species + idh(VarAbsBbB):units, ginverse=list(species=inv.phylo$Ainv), prior = prior2,
 #               verbose = FALSE)

#drop_outlier there is a huge outlier in this measure 
post_modes_dropout<-post_modes
post_modes_dropout[post_modes_dropout$AbsBbB>1500,]=NA

post_modes_dropout<-post_modes_dropout[complete.cases(post_modes_dropout), ]

m1ABd<- MCMCglmm(AbsBbB~lat, family = "gaussian", data = post_modes_dropout, 
                                random =~species + idh(VarAbsBbB):units, ginverse=list(species=inv.phylo$Ainv), prior = prior2,
                                verbose = FALSE)



m1me<- MCMCglmm(Rsq~lat, family = "exponential", data = post_modes, 
              random =~species + idh(VarRsq):units, ginverse=list(species=inv.phylo$Ainv), prior = prior2,
              verbose = FALSE)

m1b<- MCMCglmm(b~lat, family = "gaussian", data = post_modes, 
               random =~species + idh(Varb):units, ginverse=list(species=inv.phylo$Ainv), prior = prior2,
               verbose = FALSE)

m1bd<- MCMCglmm(b~day, family = "gaussian", data = post_modes, 
                random =~species + idh(Varb):units, ginverse=list(species=inv.phylo$Ainv), prior = prior2,
                verbose = FALSE)


sink(file = "PhylogeneticModelOutput.txt")
summary(m1bd)
summary(m1b)
summary(m1ABd)
summary(m1me)
sink(file = NULL)

#### Figure
par(mfrow=c(2,2), font.axis = 2)
### Panel A
x<-seq(140, 245, length=49)
sols<-summary(m1bd)$solutions
y<-sols["(Intercept)",1]+x*sols["day",1]
t<-data.frame(y, x)
bluet<-makeTransparent("blue", alpha=0.05)

plot(0, 140, xlim=c(140, 245), ylim=c(-3, 5), main=expression(bold(A)), ylab = expression(bold("Reaction norm, b")), xlab = expression(bold("Mean phenology (day)"))) 
for(i in 1:1000){
  yt<-m1bd$Sol[i,]["(Intercept)"]+x*m1bd$Sol[i,]["day"]
  tt<-data.frame(yt, x)
  lines(tt$x,(tt$yt),col=bluet,lwd=1)
}
points(post_modes$day, post_modes$b, col="black", pch=19)
lines(t$x,(t$y),col="red",lwd=3)




###Panel B
sols<-summary(m1b)$solutions
x<-seq(55.5, 62, length=49)
y<-sols["(Intercept)",1]+x*sols["lat",1]
t<-data.frame(y, x)
bluet<-makeTransparent("blue", alpha=0.05)

plot(0, 55.5, xlim=c(55.5, 62), ylim=c(-3, 5), main=expression(bold(B)), ylab = expression(bold("Reaction norm, b")), xlab = expression(bold(Latitude))) 
for(i in 1:1000){
  yt<-m1b$Sol[i,]["(Intercept)"]+x*m1b$Sol[i,]["lat"]
  tt<-data.frame(yt, x)
  lines(tt$x,(tt$yt),col=bluet,lwd=1)
}
points(post_modes$lat, post_modes$b, col="black", pch=19)
lines(t$x,(t$y),col="red",lwd=3)

###PANEL C
sols<-summary(m1ABd)$solutions
x<-seq(55.5, 62, length=49)
y<-sols["(Intercept)",1]+x*sols["lat",1]
t<-data.frame(y, x)
bluet<-makeTransparent("blue", alpha=0.05)
plot(0, 55.5, xlim=c(55.5, 62), ylim=c(0, 4.5), main=expression(bold(C)), ylab = expression(bold("|B-b|/|B|")), xlab = expression(bold(Latitude))) 
for(i in 1:1000){
  yt<-m1ABd$Sol[i,]["(Intercept)"]+x*m1ABd$Sol[i,]["lat"]
  tt<-data.frame(yt, x)
  lines(tt$x,(tt$yt),col=bluet,lwd=1)
}
points(post_modes$lat, post_modes$AbsBbB, col="black", pch=19)
lines(t$x,(t$y),col="red",lwd=3)
abline(h=1, col="green", lwd=3)



###PANEL D
sols<-summary(m1me)$solutions
x<-seq(55.5, 62, length=49)
y<-sols["(Intercept)",1]+x*sols["lat",1]
t<-data.frame(y, x)
bluet<-makeTransparent("blue", alpha=0.05)

plot(0, 55.5, xlim=c(55.5, 62), ylim=c(0, .1), main=expression(bold(D)), ylab = expression(bold("Phenological variance explained by b")), xlab = expression(bold(Latitude))) 
for(i in 1:1000){
  yt<-m1me$Sol[i,]["(Intercept)"]+x*m1me$Sol[i,]["lat"]
  tt<-data.frame(yt, x)
  lines(tt$x,exp(-tt$yt),col=bluet,lwd=1)
}
points(post_modes$lat, post_modes$Rsq, col="black", pch=19)
lines(t$x,exp(-t$y),col="red",lwd=3)





#m1Diff<- MCMCglmm(diff~lat, family = "exponential", data = post_modes, 
#               random =~species + idh(VarDiff):units, ginverse=list(species=inv.phylo$Ainv), prior = prior2,
#               verbose = FALSE)
#summary(m1Diff)




#### Phylogenetic signal of b 

dev.off()
b<-post_modes$b
plotTree.barplot(small_tree_n, b, tip.label=FALSE, args.barplot=list(col=sapply(b,
                                                                       function(b) if(b>=0) "blue" else "red"),
                                                            xlim=c(-4,6),  xlab = expression(bold("Inferred reaction norm"))))

dev.off()
b_lambda<- MCMCglmm(b ~ 1, family = "gaussian", data = post_modes, 
                random =~species + idh(Varb):units, ginverse=list(species=inv.phylo$Ainv), prior = prior2,
                verbose = FALSE)

prior3<- list(R = list(V = diag(1), nu = 0.002),
        G = list(G1 = list(V = diag(1), fix = 1)))
b_lambda_reduced<- MCMCglmm(b ~ 1, family = "gaussian", data = post_modes, 
                    random =~idh(Varb):units, ginverse=list(species=inv.phylo$Ainv), prior = prior3,
                    verbose = FALSE)
sink(file = "LambdaDIC_Difference.txt")
b_lambda_reduced$DIC-b_lambda$DIC
sink(file = NULL)
estimate<-summary(b_lambda)$Gcovariances[1,1]/(summary(b_lambda)$Gcovariances[1,1]+summary(b_lambda)$Rcovariances[1,1])
est_dist<-vector(, length= 1000)
  for(i in 1:1000){
    est_dist[i]<-b_lambda$VCV[i,1]/(b_lambda$VCV[i,1]+b_lambda$VCV[i,3])
  }
par(font.axis = 2)
hist(est_dist, main = "Posterior Phylogenetic Heritability", xlab = expression(bold("Var(phylo)/Var(total)")),  ylab = expression(bold("Frequency")))
abline(v=estimate, col= "red", lwd=3)


plot(abs(post_modes$B-post_modes$b), abs(post_modes$B), xlim = c(0, 50), ylim = c(0, 50))
abline(a= 0, b=1)
hist(abs(post_modes$B-post_modes$b)-abs(post_modes$B))
post_modes$AbsBbB<-abs(post_modes$B-post_modes$b)-abs(post_modes$B)
plot(post_modes$lat, post_modes$AbsBbB)




#### Ischnura analysis
isch<-read.csv("IschObsData.csv", header = TRUE)
isch$yearf<-as.factor(isch$year)
isch$lat_binned<-isch$lat
isch$yearlat<-paste0(isch$yearf, isch$lat_binned)
isch$lat_binned<-as.factor(isch$lat_binned)
isch$rownum<-as.factor(isch$rownum)

isch_model<- MCMCglmm(cbind(day, one20) ~ trait + trait:y+ trait:year-1, 
                       random = ~us(trait):lat_binned + us(trait):yearlat, rcov = 
                         ~ us(trait):rownum,  prior = prior, data = isch, 
                       family = c(rep("gaussian", 2)), verbose = FALSE)

IschBest <-posterior.mode(isch_model$Sol)[3]/posterior.mode(isch_model$Sol)[4]
Ischbest <-posterior.mode(isch_model$VCV)[6]/posterior.mode(isch_model$VCV)[8]
IschPost<-matrix(, nrow = 1000, ncol = 2)
for(i in 1:1000){
  IschPost[i,1]<-isch_model$Sol[i,3]/isch_model$Sol[i,4]
  IschPost[i,2]<-isch_model$VCV[i,6]/isch_model$VCV[i,8]
}
bluet2<-makeTransparent("blue", alpha=0.5)
blackt<-makeTransparent("black", alpha=0.8)
hist(IschPost[,1], breaks = 15, col = blackt, xlim= c(-20, 2), ylim = c(0, 200), main = "", ylab = expression(bold("Frequency")), xlab=expression(bold("Estimate")))
hist(IschPost[,2], breaks = 13, add = TRUE, col = bluet2)
abline(v=-17, col= "blue", lwd = 3)
abline(v=-10, col= "black", lwd = 3)



#### April temp analysis

modelsApril <- vector(mode = "list", length = 49)
for(i in 1:49){
  small_dat<-subset(dat, name==i)
  set.seed(1)
  modelsApril[[i]]<- MCMCglmm(cbind(day, april) ~ trait + trait:y+ trait:year-1, 
                         random = ~us(trait):lat_binned + us(trait):yearlat, rcov = 
                           ~ us(trait):rownum,  prior = prior, data = small_dat, 
                         family = c(rep("gaussian", 2)), verbose = FALSE)
}

#save(modelsApril, file = "modelsApril_Aug10.RData")
modelcompare<-matrix(, nrow=49, ncol=4)
for(j in 1:49){
modelcompare[j,1]<- models[[j]]$DIC
modelcompare[j,2]<- modelsApril[[j]]$DIC
modelcompare[j,3]<-(models[[j]]$VCV[i,5])*((models[[j]]$VCV[i,6]/(sqrt(models[[j]]$VCV[i,8])*sqrt(models[[j]]$VCV[i,5])))^2)/(models[[j]]$VCV[i,1]+models[[j]]$VCV[i,5]+models[[j]]$VCV[i,9])
modelcompare[j,4]<-(modelsApril[[j]]$VCV[i,5])*((modelsApril[[j]]$VCV[i,6]/(sqrt(modelsApril[[j]]$VCV[i,8])*sqrt(modelsApril[[j]]$VCV[i,5])))^2)/(modelsApril[[j]]$VCV[i,1]+modelsApril[[j]]$VCV[i,5]+modelsApril[[j]]$VCV[i,9])
}


boxplot(modelcompare[,1]/modelcompare[,2], ylab = expression(bold("120 day DIC / April DIC")))
abline(h = 1, lwd = 2)

boxplot(modelcompare[,1]-modelcompare[,2], ylab = expression(bold("120 day DIC - April DIC")))
mean(modelcompare[,1]-modelcompare[,2])
d<-modelcompare[,1]-modelcompare[,2]
t.test(d)

write.csv(post_modes, file = "datafortables1.csv")



