# How many significant interactions

setwd("./")

deletion_results <- read.csv("raw_deletion_results.csv", header=T)
str(deletion_results)


# 
hist(deletion_results$p.interaction)

#how best to adjust, or should we adjust?
adjusted_Pvalues_holm <- p.adjust(deletion_results$p.interaction, method="holm")
adjusted_Pvalues_FDR <- p.adjust(deletion_results$p.interaction, method="fdr")
adjusted_Pvalues_hommel <- p.adjust(deletion_results$p.interaction, method="hommel")

length(deletion_results$p.interaction[deletion_results$p.interaction <= 0.05])
length(adjusted_Pvalues_holm[adjusted_Pvalues_holm <= 0.05])
length(adjusted_Pvalues_FDR[adjusted_Pvalues_FDR <= 0.05])
length(adjusted_Pvalues_hommel[adjusted_Pvalues_hommel <= 0.05])


# un-adjusted p-value
nrow(deletion_results) # 612 (filtered for sample size)
# with unadjusted p-value how many times is deletion significant, and interaction non-significant?
with(deletion_results, nrow(deletion_results[p.deletion <= 0.05 & p.interaction >0.05,])) # 71

# with unadjusted p-value how many times is deletion and interaction significant?
with(deletion_results, nrow(deletion_results[p.deletion <= 0.05 & p.interaction <= 0.05,])) # 130

# with unadjusted p-value how many times is deletion non-significant and interaction significant?
with(deletion_results, nrow(deletion_results[p.deletion > 0.05 & p.interaction <= 0.05,])) # 137 

# with unadjusted p-value how many times is deletion or interaction significant?
with(deletion_results, nrow(deletion_results[p.deletion <= 0.05 | p.interaction <= 0.05,])) # 338

# Proportion of background dependent modifiers (i.e. with significant interaction terms)
267/338


# Do the same for FDR
Pvalues_FDR_interaction <- p.adjust(deletion_results$p.interaction, method="fdr")
Pvalues_FDR_deletion <- p.adjust(deletion_results$p.deletion, method="fdr")

FDR_comp <- cbind(Pvalues_FDR_interaction,Pvalues_FDR_deletion , deparse.level=0)
colnames(FDR_comp) <- c("interaction", "deletion")

# with unadjusted p-value how many times is deletion significant, and interaction non-significant?
nrow(FDR_comp[FDR_comp[,2] <= 0.05 & FDR_comp[,1] > 0.05,]) #61

# with unadjusted p-value how many times is deletion and interaction significant?
nrow(FDR_comp[FDR_comp[,2] <= 0.05 & FDR_comp[,1] <= 0.05,]) #95

# with unadjusted p-value how many times is deletion non-significant and interaction significant?
nrow(FDR_comp[FDR_comp[,2] > 0.05 & FDR_comp[,1] <= 0.05,]) #126

# with unadjusted p-value how many times is deletion or interaction significant?
nrow(FDR_comp[FDR_comp[,2] <= 0.05 | FDR_comp[,1] <= 0.05,]) #282

# Proportion of background dependent modifiers (i.e. with significant interaction terms)
(95+126)/282 # 0.78

# Do the same for holm
Pvalues_holm_interaction <- p.adjust(deletion_results$p.interaction, method="holm")
Pvalues_holm_deletion <- p.adjust(deletion_results$p.deletion, method="holm")

holm_comp <- cbind(Pvalues_holm_interaction,Pvalues_holm_deletion , deparse.level=0)
colnames(holm_comp) <- c("interaction", "deletion")

# with unadjusted p-value how many times is deletion significant, and interaction non-significant?
nrow(holm_comp[holm_comp[,2] <= 0.05 & holm_comp[,1] > 0.05,]) #47

# with unadjusted p-value how many times is deletion and interaction significant?
nrow(holm_comp[holm_comp[,2] <= 0.05 & holm_comp[,1] <= 0.05,]) #28

# with unadjusted p-value how many times is deletion non-significant and interaction significant?
nrow(holm_comp[holm_comp[,2] > 0.05 & holm_comp[,1] <= 0.05,]) #71

# with unadjusted p-value how many times is deletion or interaction significant?
nrow(holm_comp[holm_comp[,2] <= 0.05 | holm_comp[,1] <= 0.05,]) #146

# Proportion of background dependent modifiers (i.e. with significant interaction terms)
(28+71)/146 # 0.68