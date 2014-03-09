##### Analyses for FEMALES using 6 landmarks (ones used for scoring hemizygous mutant males) ####


sd.data.f6 <- read.csv ("./Desktop/sdE3_females.csv", h=T)

head(sd.data.f6)
tail(sd.data.f6)
str(sd.data.f6)
sd.data.f6$Deletion <- as.factor(sd.data.f6$Deletion)
sd.data.f6$Dummy <- ifelse(sd.data.f6$Deletion=="6326", "Control","Deletion" ) # Creates dummy variable
sd.data.f6$Dummy <- as.factor(sd.data.f6$Dummy)

#### Does Block have an effect especially with respect to control crosses?###
## To answer this question, create a linear model with Centroid Size of the control crosses as a function of Background and Block ##

data.control.6326 <- sd.data.f6 [sd.data.f6$Deletion=="6326",]## Indexing the control data##

control.blockeffect.model <- lm (Centroid_Size ~ Background*Block, data= data.control.6326)

anova(control.blockeffect.model)
summary(control.blockeffect.model)
## Shwows that the Centroid sizes are different with respect to background but not between blocks i.e. no block effect ##

#### Getting Means and Std Errors ####

deletion.means1 <- t(with(sd.data.f6, tapply(Centroid_Size, INDEX=list(Background, Deletion), FUN=mean )))# function for getting line means for centroid sizes


sem <- function(x){sd(x)/sqrt(length(x))}# function for calculating standard errors

deletion.sem1 <- with(sd.data.f6, tapply(Centroid_Size, INDEX=list(Background, Deletion), FUN=sem))# std. errors for each line

deletion.sem <- t(deletion.sem1)

## combining the deletion names and the means##
deletion.list <- levels(sd.data.f6$Deletion)

deletion.list
deletion.means1
del.mean.combined.f6 <- data.frame(deletion.list, deletion.means1)
del.mean.sorted <- del.mean.combined.f6[order(del.mean.combined.f6[,2]),]# sorting means based on Ore values
del.mean.sorted

write.csv(del.mean.sorted, file="sdE3_mod_means_F.csv")

#### Modelling for Significance ####

data.1 <- sd.data.f6 [sd.data.f6$Deletion=="6326" | sd.data.f6$Deletion=="7611",]
test.1.ore <- lm(Centroid_Size ~ Dummy, data=data.1, subset=Background=="ORE")
summary(test.1.ore)

test.1.sam <- lm(Centroid_Size ~ Dummy, data=data.1, subset=Background=="SAM")
summary(test.1.sam)

test.1.both <- lm(Centroid_Size ~ Background*Dummy, data=data.1 )
summary(test.1.both)

rm(data.1)
data.1

### Do this for all the 44 deletion crosses and add the significance to the 'sdE3_mod_mean.csv' file for further use ###


## Plotting with CI###

require (sciplot)

del.mean.sig.f6 <- read.csv ("./sdE3_mod_means_F.csv", h=T)
str(del.mean.sig.f6)
del.mean.sig.f6$Deletion_List <- as.factor(del.mean.sig.f6$Deletion_List)

plot(del.mean.sig.f6[,3,-1], ylim=c(2, 2.45), col="red", type="p", xaxt="n", ann=F, xlim=c(1,44), pch=c(21,19)[del.mean.sig.f6$Significance_ORE])
# plotting by removing the default x-axis (xaxt="n") and creating our own x-axis by using axis function #


axis(side=1, at=1:44, tick=F, labels=F)
text (1:44, par("usr")[3]-.01, srt=45, adj=1,labels=del.mean.sig.f6$deletion.list, xpd=T, cex=0.6)

title(main= "Quantitative effects of Modifiers on Heterozygous Female Wing Size in Samarkand and Oregon-R Genetic Backgrounds", cex.main=1)
title(xlab="Deletion lines", line=3.5)
title(ylab="Wing Size", line=3)


### axis and axis labels at 45 degrees### 

points(del.mean.sig.f6[,5], col="blue", pch=c(21,19)[del.mean.sig.f6$Significance_SAM])
# adding the other set of values in this case SAM values

abline(h=(2.251), col="blue", lwd=2)
abline(h=(2.251 + 2*0.00763), col="blue", lwd=1, lty=3)
abline(h=(2.251 - 2*0.00763), col="blue", lwd=1, lty=3)
abline(h=(2.3228), col="red", lwd=2)
abline(h=(2.3228 + 2*0.01853), col="red", lwd=1, lty=3)
abline(h=(2.3228 - 2*0.01853), col="red", lwd=1, lty=3)


legend(x="bottomright",xjust=1, legend = c("Samarkand", "Oregon-R","No Effect Observed", "Phenotypic Modification observed"), col= c("blue","red","black","black"),text.col=c("blue", "red","black","black"), pch=c(22,22,21,19), bty="n")


###Correlation & Coeff of Variation ###
with(del.mean.sig.f6, cor.test(ORE,SAM)) ## 0.77 CI: 0.62, 0.87
cv<- function(x) sd(x)/mean(x)
cv(del.mean.sig.f6[,3]) # cv in ORE 0.03
cv(del.mean.sig.f6[,5]) # cv in SAM 0.032




