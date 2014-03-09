
ls.data <- read.csv("./Long_Short.csv", h=T) ## Reading in the data

str(ls.data)
ls.data$Deletion <- as.factor(ls.data$Deletion) ### checking and fixing

ls.means <- t(with(ls.data, tapply(Numeric_Phenotype, INDEX=list(Background, Deletion), FUN=mean )))# function for getting line means for semiquantitative measures

deletion.list <- levels(ls.data$Deletion)

ls.mean.combined <- data.frame(deletion.list, ls.means)### dataframe of the deletions and means

ls.mean.combined # There are 32/44 deletions in both short and long

write.table(ls.mean.combined, file="ls.mean.combined") #### creating a text file of the table, making a csv file and splitting it into 'ls.mean.short' and 'ls.mean.long' for analyzing further ####


### Reading data for short replicates and performing a Pearson's correlation test between mean wing size for crosses in oregon background and crosses in Short lines ###
ls.mean.short <- read.csv("~/Desktop/S1_S3_ore.csv", h=T)

with(ls.mean.short, cor.test(S1,ORE))## Correlation ~82% CI(0.66,0.91)

with(ls.mean.short, cor.test(S3,ORE))## Correlation ~80% CI (0.62,0.90)

with(ls.mean.short, cor.test(S1,S3))## Correlation ~85% CI (0.70,0.92)

### Reading data for Long replicate and performing a Pearson's correlation test between mean wing size for crosses in oregon background and crosses in Long lines ###
ls.mean.long <- read.csv("~/Desktop/L1_sam.csv", h=T)

with(ls.mean.long, cor.test(L1,SAM))## correlation ~86% CI(0.73 , 0.93)