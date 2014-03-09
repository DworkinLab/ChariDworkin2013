###Analyses of Quantified Wings for sdETX4.2.data MALES###

### Data input, check and fix####
setwd("./")

sdETX4.data <- read.csv ("./sdETX4_males_modidfiers.csv", h=T)
head(sdETX4.data)
tail(sdETX4.data)
str(sdETX4.data)
sdETX4.data$Deletion <- as.factor(sdETX4.data$Deletion)
sdETX4.data$Dummy <- ifelse(sdETX4.data$Deletion=="6326", "Control","Deletion" ) # Creates dummy variable
sdETX4.data$Dummy <- as.factor(sdETX4.data$Dummy)

#### Does Block have an effect especially with respect to control crosses?###
## To answer this question, create a linear model with Centroid Size of the control crosses as a function of Background and Block ##

data.control.6326 <- sdETX4.data [sdETX4.data$Deletion=="6326",]## Indexing the control data##

control.blockeffect.model <- lm (Centroid_Size ~ Background*Batch, data= data.control.6326)

anova(control.blockeffect.model)
summary(control.blockeffect.model)
## Shwows that the Centroid sizes are different with respect to background but not between blocks i.e. no block effect ##


#### Getting Means and Std Errors ####

deletion.means1 <- t(with(sdETX4.data, tapply(Centroid_Size, INDEX=list(Background, Deletion), FUN=mean )))# function for getting line means for centroid sizes

sem <- function(x){sd(x)/sqrt(length(x))}# function for calculating standard errors

deletion.sem1 <- t(with(sdETX4.data, tapply(Centroid_Size, INDEX=list(Background, Deletion), FUN=sem)))# std. errors for each line


## combining the deletion names and the means##
deletion.list <- levels(sdETX4.data$Deletion)

deletion.list
deletion.means1
del.mean.combined.sdETX4 <- data.frame(deletion.list, deletion.means1)
del.mean.sorted <- del.mean.combined.sdETX4[order(del.mean.combined.sdETX4[,2]),]# sorting means based on Ore values
del.mean.sorted

write.csv(del.mean.sorted, file="sdETx4_mod_means.csv")


#### Modelling for Significance ####
data.1 <- sdETX4.data [sdETX4.data$Deletion=="6326" | sdETX4.data$Deletion=="7840",]
test.1.ore <- lm(Centroid_Size ~ Dummy, data=data.1, subset=Background=="ORE")
summary(test.1.ore)

test.1.sam <- lm(Centroid_Size ~ Dummy, data=data.1, subset=Background=="SAM")
summary(test.1.sam)

test.1.both <- lm(Centroid_Size ~ Background*Dummy, data=data.1 )
summary(test.1.both)



#### Plotting with CI####
require (sciplot)

del.mean.sig.ETX4 <- read.csv ("./sdETX4_mod_means.csv", h=T)
str(del.mean.sig.ETX4)


plot(del.mean.sig.ETX4[,3,-1], ylim=c(0.5, 2.1), col="red", type="p", xaxt="n", ann=F, xlim=c(1,44), pch=19)
# plotting by removing the default x-axis (xaxt="n") and creating our own x-axis by using axis function #


axis(side=1, at=1:44, tick=F, labels=F)
text (1:44, par("usr")[3]-.03, srt=45, adj=1,labels=del.mean.sig.ETX4$Deletion_List, xpd=T, cex=0.6)

title(main= "Quantitative effects of Modifiers on Wing Size in Samarkand and Oregon-R Genetic Backgrounds", cex.main=1)
title(xlab="Deletion lines", line=3.5)
title(ylab="Wing Size", line=3.2)



### axis and axis labels at 45 degrees### 

points(del.mean.sig.ETX4[,4], col="blue", pch=19)
# adding the other set of values in this case ORE values

abline(h=1.8722, col="blue", lwd=2)
abline(h=(1.8722 + 2*0.0111), col="blue", lwd=1, lty=3)
abline(h=(1.8722 - 2*0.0111), col="blue", lwd=1, lty=3)
abline(h=1.3313, col="red", lwd=2)
abline(h=(1.3313 + 2*0.0788), col="red", lwd=1, lty=3)
abline(h=(1.3313 - 2*0.0788), col="red", lwd=1, lty=3)


legend(x="bottomright",xjust=1, legend = c("Samarkand", "Oregon-R"),col=c("blue", "red"), text.col=c("blue", "red"), pch=19, bty="n")

