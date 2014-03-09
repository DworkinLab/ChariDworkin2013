###Analyses of Quantified Wings for MALES###

### Data input, check and fix####
setwd("./")

sd.data <- read.csv ("sdE3_males_modifiers.csv", h=T)

head(sd.data)
tail(sd.data)
str(sd.data)
sd.data$Deletion <- as.factor(sd.data$Deletion)
sd.data$Dummy <- ifelse(sd.data$Deletion=="6326", "Control","Deletion" ) # Creates dummy variable
sd.data$Dummy <- as.factor(sd.data$Dummy)

#### Does Block have an effect especially with respect to control crosses?###
## To answer this question, create a linear model with Centroid Size of the control crosses as a function of Background and Block ##

data.control.6326 <- sd.data [sd.data$Deletion=="6326",]## Indexing the control data##

control.blockeffect.model <- lm (Centroid_Size ~ Background*Block, data= data.control.6326)

anova(control.blockeffect.model)
summary(control.blockeffect.model)
## Shwows that the Centroid sizes are different with respect to background but not between blocks i.e. no block effect ##


#### Getting Means and Std Errors ####

deletion.means <- t(with(sd.data, tapply(Centroid_Size, INDEX=list(Background, Deletion), FUN=mean )))# function for getting line means for centroid sizes and arranging them in columns


sem <- function(x){sd(x)/sqrt(length(x))}# function for calculating standard errors

deletion.sem1 <- t(with(sd.data, tapply(Centroid_Size, INDEX=list(Background, Deletion), FUN=sem)))# std. errors for each line

## combining the deletion names and the means##
deletion.list <- levels(sd.data$Deletion)

deletion.list
deletion.means
del.mean.combined <- data.frame(deletion.list, deletion.means)
del.mean.sorted <- del.mean.combined[order(del.mean.combined[,2]),]# sorting means based on Ore values
del.mean.sorted

write.csv(del.mean.sorted, file="sdE3_mod_mean.csv")


#### Modelling for Significance ####
data.1 <- sd.data [sd.data$Deletion=="6326" | sd.data$Deletion=="7840",]
test.1.ore <- lm(Centroid_Size ~ Dummy, data=data.1, subset=Background=="ORE")
summary(test.1.ore)

test.1.sam <- lm(Centroid_Size ~ Dummy, data=data.1, subset=Background=="SAM")
summary(test.1.sam)

test.1.both <- lm(Centroid_Size ~ Background*Dummy, data=data.1 )
summary(test.1.both)

### Do this for all the 44 deletion crosses and add the significance to the 'sdE3_mod_mean.csv' file for further use ###


#### Plotting with CI####
require (sciplot)

del.mean.sig <- read.csv ("sdE3_mod_means.csv", h=T)
str(del.mean.sig)


plot(del.mean.sig[,3,-1], ylim=c(0.5, 2.1), col="red", type="p", xaxt="n", ann=F, xlim=c(1,45), pch=c(24,17,21,19)[del.mean.sig$Significance_ORE])
# plotting by removing the default x-axis (xaxt="n") and creating our own x-axis by using axis function #


axis(side=1, at=1:44, tick=F, labels=F)
text (1:44, par("usr")[3]-.03, srt=45, adj=1,labels=del.mean.sig$Deletion_list, xpd=T, cex=0.6)

title(main= "Quantitative effects of Modifiers on Wing Size in Samarkand and Oregon-R Genetic Backgrounds", cex.main=1)
title(xlab="Deletion lines", line=3.5)
title(ylab="Wing Size", line=3.2)



### axis and axis labels at 45 degrees### 

points(del.mean.sig[,5], col="blue", pch=c(24,17,21,19)[del.mean.sig$Significance_SAM])
# adding the other set of values in this case ORE values

abline(h=1.8722, col="blue", lwd=2)
abline(h=(1.8722 + 2*0.0111), col="blue", lwd=1, lty=3)
abline(h=(1.8722 - 2*0.0111), col="blue", lwd=1, lty=3)
abline(h=1.3313, col="red", lwd=2)
abline(h=(1.3313 + 2*0.0788), col="red", lwd=1, lty=3)
abline(h=(1.3313 - 2*0.0788), col="red", lwd=1, lty=3)


legend (x="bottomright",xjust= 1.0, legend = c("Samarkand", "Oregon-R","No Effect Expected or Observed", "Modification observed but not expected", "Modification expected but not observed", "Modification Expected and Observed" ),col=c("blue", "red", "black","black", "black","black"), text.col=c("blue", "red","black","black","black","black"), pch=c(22,22,24,17,21,19), bty="n")

###Correlation & Coeff of Variation ###
with(del.mean.sig, cor.test(ORE,SAM)) ## 0.66 CI: 0.46, 0.80
cv<- function(x) sd(x)/mean(x)
cv(del.mean.sig[,2]) # cv in ORE 0.34
cv(del.mean.sig[,5]) # cv in SAM 0.15


## Bar plot for the modifier proportion ##

### The percent of background dependent v/s independent modifiers for all the data was calculated and just the numbers, stored as a separate file 'mp.csv' ###

mp.data <- read.csv ("modifier_proportion.csv", h=T)
modprop.data <- as.matrix(mp.data)

barplot (modprop.data, col= c("dark blue", "Grey"), names.arg= c("2L_DD", "2L_EX", "2R_DD", "2R_EX", "3L_DD", "3L_EX", "3R_DD", "3R_EX"), xlab="Chromosome Arm and Deletion", ylab="Modifier Proportion in %")

legend(x="topright",xjust=0, legend= c("Background Specific", "Background Independent"), fill= c("dark blue", "gray"), border=c("black","black") )
