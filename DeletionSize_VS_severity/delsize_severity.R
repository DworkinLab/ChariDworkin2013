### Effects of deletion size on phenotypic severity i.e. semiquantitative scores for 349/ 723 mutations ###

### Reading the data ####
drosdel.mean.data <- read.csv ("./Drosdel_semiqt_means.csv")

exelixis.mean.data <- read.csv ("./Exelixis_semiqt_means.csv")

### Performing Pearson's Correlation Test between Size of the mutation and severity of effect size on the wing per background per deletion collection ####

with (drosdel.mean.data, cor.test (ORE, deletion_Size)) ### -0.067 CI: -0.26,0.13
with (exelixis.mean.data, cor.test (ORE, deletion_size)) ### -0.061 CI: -0.18,0.06

with (exelixis.mean.data, cor.test (SAM, deletion_size)) ### -0.092 CI: -0.21,0.031
with (drosdel.mean.data, cor.test (SAM, deletion_Size)) ### -0.084 CI: -0.27,0.11

### Plotting effect size on the wing as a function of deletion per background per deletion collection ####
 
par(mfrow=c(2,2))
plot(ORE~deletion_Size,xlab= "Deletion Size for DrosDel Collection",ylab= "Mean Wing Size in Oregon-R", data=drosdel.mean.data)

plot(SAM~deletion_Size,xlab= "Deletion Size for DrosDel Collection",ylab= "Mean Wing Size in Samarkand", data=drosdel.mean.data)

plot(ORE~deletion_size, xlab= "Deletion Size for Exelixis Collection",ylab= "Mean Wing Size in Oregon-R", data=exelixis.mean.data)

plot(SAM~deletion_size,xlab= "Deletion Size for Exelixis Collection",ylab= "Mean Wing Size in Samarkand", data=exelixis.mean.data)

