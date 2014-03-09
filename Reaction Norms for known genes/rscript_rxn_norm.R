sd.rxn.norm.data <- read.csv ("./genes_rxn_norm.csv",h=T)
str(sd.rxn.norm.data)


sd.dll.data <- subset(sd.rxn.norm.data, Gene=="Dll")
str (sd.dll.data)

sd.wg.data <- subset(sd.rxn.norm.data, Gene=="wg")
str(sd.wg.data)

sd.salm.data <- subset(sd.rxn.norm.data, Gene=="salm")
str(sd.salm.data)

sd.yki.data <- subset(sd.rxn.norm.data, Gene=="yki")
str(sd.yki.data)

sd.vg.data <- subset(sd.rxn.norm.data, Gene=="vg")
sd.vg.data.dd <- subset(sd.vg.data, Deletion_Set=="DrosDel")
sd.vg.data.ex <- subset(sd.vg.data, Deletion_Set=="Exelixis")
sd.vg.data.pb <- subset(sd.vg.data, Deletion_Set=="Exelixispbac")
sd.vg.data.os <- subset(sd.vg.data, Deletion_Set==c("Oregon-R","Samarkand"))


### Plotting Wing Area vs Background #####
require(sciplot)

par(mfrow=c(2,2)) 


lineplot.CI(factor(sd.dll.data$Rxn_Norm), sd.dll.data$Numeric_Phenotype, group=sd.dll.data$Background, fixed=T,legend=F, ci.fun= function(x) c(mean(x)-1.97*se(x), mean(x)+1.97*se(x)),ylim=c(3.5,7.5), xlab= "Genotype", ylab="Semiquantitative Wing Score", main="A",col=c("red","blue"),pch=c(16,16),lty=c(1,1), cex.main=1)
legend (x="topright", xjust=0,yjust=0, legend= c("Oregon-R","Samarkand"), col=c("red","blue"),pch=c(16,16),lty=c(1,1),bty="n", cex=0.8)

lineplot.CI(factor(sd.wg.data$Rxn_Norm), sd.wg.data$Numeric_Phenotype, group=sd.wg.data$Background, fixed=T,legend=F, ci.fun= function(x) c(mean(x)-1.97*se(x), mean(x)+1.97*se(x)),ylim=c(2,7.5), xlab= "Genotype", ylab="Semiquantitative Wing Score", main="B",col=c("red","blue"),pch=c(16,16),lty=c(1,1), cex.main=1)
legend (x="topright", xjust=0,yjust=0, legend= c("Oregon-R","Samarkand"), col=c("red","blue"),pch=c(16,16),lty=c(1,1),bty="n", cex=0.8)

lineplot.CI(factor(sd.salm.data$Rxn_Norm), sd.salm.data$Numeric_Phenotype, group=sd.salm.data$Background, fixed=T,legend=F, ci.fun= function(x) c(mean(x)-1.97*se(x), mean(x)+1.97*se(x)),ylim=c(3.5,7.5), xlab= "Genotype", ylab="Semiquantitative Wing Score", main="C",col=c("red","blue"),pch=c(16,16),lty=c(1,1), cex.main=1)
legend (x="topright", xjust=0,yjust=0, legend= c("Oregon-R","Samarkand"), col=c("red","blue"),pch=c(16,16),lty=c(1,1),bty="n", cex=0.8)

lineplot.CI(factor(sd.yki.data$Rxn_Norm), sd.yki.data$Numeric_Phenotype, group=sd.yki.data$Background, fixed=T,legend=F, ci.fun= function(x) c(mean(x)-1.97*se(x), mean(x)+1.97*se(x)),ylim=c(3.5,7.5), xlab= "Genotype", ylab="Semiquantitative Wing Score", main="D",col=c("red","blue"),pch=c(16,16),lty=c(1,1), cex.main=1)
legend (x="topright", xjust=0,yjust=0, legend= c("Oregon-R","Samarkand"), col=c("red","blue"),pch=c(16,16),lty=c(1,1),bty="n", cex=0.8)

par(mfrow=c(2,2)) 
lineplot.CI(factor(sd.vg.data.dd$Rxn_Norm), sd.vg.data.dd$Numeric_Phenotype, group=sd.vg.data.dd$Background, fixed=T,legend=F, ci.fun= function(x) c(mean(x)-1.97*se(x), mean(x)+1.97*se(x)),ylim=c(2,7.5), xlab= "Genotype", ylab="Semiquantitative Wing Score", main="A",col=c("red","blue"),pch=c(16,16),lty=c(1,1), cex.main=1)
legend (x="topright", xjust=0,yjust=0, legend= c("Oregon-R","Samarkand"), col=c("red","blue"),pch=c(16,16),lty=c(1,1),bty="n", cex=0.8)

lineplot.CI(factor(sd.vg.data.ex$Rxn_Norm), sd.vg.data.ex$Numeric_Phenotype, group=sd.vg.data.ex$Background, fixed=T,legend=F, ci.fun= function(x) c(mean(x)-1.97*se(x), mean(x)+1.97*se(x)),ylim=c(2,7.5), xlab= "Genotype", ylab="Semiquantitative Wing Score", main="B",col=c("red","blue"),pch=c(16,16),lty=c(1,1), cex.main=1)
legend (x="topright", xjust=0,yjust=0, legend= c("Oregon-R","Samarkand"), col=c("red","blue"),pch=c(16,16),lty=c(1,1),bty="n", cex=0.8)

lineplot.CI(factor(sd.vg.data.pb$Rxn_Norm), sd.vg.data.pb$Numeric_Phenotype, group=sd.vg.data.pb$Background, fixed=T,legend=F, ci.fun= function(x) c(mean(x)-1.97*se(x), mean(x)+1.97*se(x)),ylim=c(2,7.5), xlab= "Genotype", ylab="Semiquantitative Wing Score", main="C",col=c("red","blue"),pch=c(16,16),lty=c(1,1), cex.main=1)
legend (x="topright", xjust=0,yjust=0, legend= c("Oregon-R","Samarkand"), col=c("red","blue"),pch=c(16,16),lty=c(1,1),bty="n", cex=0.8)

lineplot.CI(factor(sd.vg.data.os$Rxn_Norm), sd.vg.data.os$Numeric_Phenotype, group=sd.vg.data.os$Background, fixed=T,legend=F, ci.fun= function(x) c(mean(x)-1.97*se(x), mean(x)+1.97*se(x)),ylim=c(2,7.5), xlab= "Genotype", ylab="Semiquantitative Wing Score", main="D",col=c("red","blue"),pch=c(16,16),lty=c(1,1), cex.main=1)
legend (x="topright", xjust=0,yjust=0, legend= c("Oregon-R","Samarkand"), col=c("red","blue"),pch=c(16,16),lty=c(1,1),bty="n", cex=0.8)
