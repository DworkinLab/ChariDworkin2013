# README file for scripts and data for Chari & Dworkin 2013

contact `dworkin "at" mcmaster.ca` for more information about the files or scripts associated with these data and scripts. A static copy is also available on [DRYAD](http://datadryad.org/resource/doi:10.5061/dryad.4dt7c)

Data and script relating to:

Please Cite:
Chari, S., Dworkin, I. (2013). The conditional nature of genetic interactions: the consequences of wild-type backgrounds on mutational interactions in a genome-wide modifier screen. PLoS Genetics 9(8) DOI: 10.1371/journal.pgen.1003661
[http://dx.plos.org/10.1371/journal.pgen.1003661]

If you are using the data, please also consider citing the DRYAD data package.
doi:10.5061/dryad.4dt7c


All scripts can be read using R version 2.14.2 (which was used for analysis)


## Abstract:
The phenotypic outcome of a mutation cannot be simply mapped onto the underlying DNA variant. Instead, the phenotype is a function of the allele, the genetic background in which it occurs and the environment where the mutational effects are expressed. While the influence of genetic background on the expressivity of individual mutations is recognized, its consequences on the interactions between genes, or the genetic network they form is largely unknown. The description of genetic networks is essential for much of biology; yet if, and how the topologies of such networks are influenced by background is unknown. Furthermore, a comprehensive examination of the background dependent nature of genetic interactions may lead to identification of novel modifiers of biological processes. Previous work in *Drosophila melanogaster* demonstrated that wild-type genetic background influences the effects of an allele of *scalloped* (*sd*), with respect to both its principal consequence on wing development and its interactions with a mutation in *optomotor blind*. In this study we address whether the background dependence of mutational interactions is a general property of genetic systems by performing a genome wide dominant modifier screen of the *sd<sup>E3</sup>* allele in two wild-type genetic backgrounds using molecularly defined deletions. We demonstrate that ~74% of all modifiers of the *sd<sup>E3</sup>* phenotype are background-dependent due in part to differential sensitivity to genetic perturbation. These background dependent interactions include some with qualitative differences in the phenotypic outcome, as well as instances of sign epistasis. This suggests that genetic interactions are often contingent on genetic background, with flexibility in genetic networks due to segregating variation in populations. Such background dependent effects can substantially alter conclusions about how genes influence biological processes, the potential for genetic screens in alternative wild-type backgrounds identifying new loci that contribute to trait expression, and the inferences of the topology of genetic networks.



## File: GenomeWide_sdE3_ModifierScreen_data.csv

Column Headers: 
Stock_Number	-	Bloomington Stock Center stock number for the deletion used
Deletion	-	Official Deletion nomenclature for the relevant deletion lines used (see Deficiencies section in Bloomington Stock Center website http://flystocks.bio.indiana.edu/bloomhome.htm)
Background	-	Background in which the cross was performed (ORE- Oregon-R or SAM- Samarkand)
Block	-	Block numbers in which the crosses were setup
Raw_Phenotype	-	Semiquantitative wing category spectrum from A (Wild-type looking wing) to J (very small, vestigial looking wing) assigned to wing phenotypes 
			(see supplementary figure 1A for visual description for each category)
Numeric_Phenotype	-	Semiquantitative wing phenotype score for each of the above categories from A=1 to J=10
Deletion_Set	-	The deletion identity i.e. whether the deletions used belonged to the BSC, DrosDel or Exelixis deletion collections.


## Deletion size versus severity of effect
Folder: Deletion size v/s Severity	
Files:  Drosdel_semiqt_means.csv
	Exelixis_semiqt_means.csv
	delsize_severity.r

Column Headers:
deletion_list	-	List of deletion stock numbers for chromosome arms 2R and 3L for the DrosDel collection (Drosdel_semiqt_means.csv) and 2L, 2R and 3L for Exelixis collection (Exelixis_semiqt_means.csv)
ORE	-	Mean semiquantitative wing score for the Oregon-R sd[E3] crosses using the above deletions
SAM	-	Mean semiquantitative wing score for the Samarkand sd[E3] crosses using the above deletions
deletion_size	-	Deletion size for the above deletion lines (For DrosDel lines see www.drosdel.org.uk and for Exelixis lines see Parks et al.,2004)

Script: 
delsize_severity.r	-	This generates the plot for supplemental figure 5 in the paper and determines correlation between wing size and deletion severity using the above datasets.

## Analysis of backcross lines
Folder: Long and Short Crosses
Files: Long_Short.csv
       L1_sam.csv
       S1_S3_ore.csv
       Long_Short.r

Long_Short.csv	-	Full data for crosses using 32 out of 44 confirmed and quantified deletions in both Long wing lines lines generated by repeated backcrossing of the long wing phenotype in the short wing or Oregon-R background and Short wing lines generated by repeated backcrossing of the short wing phenotype in the long or Samarkand background.
Column Headers:
Deletion	-	List of confirmed and quantified deletions used for crossing with the long and short lines
Background	-	Background in which the crosses were performed i.e.
			  SAM- Samarkand 
			  ORE- Oregon-R 
			  S1- Short wing line replicate 1
			  S3- Short wing line replicate 3
			  L1- Long wing line replicate 1
Sex	-	Sex of flies scored for the wing phenotype
Block	-	Block numbers in which the crosses were setup
Numeric_Phenotype	-	Semiquantitative wing phenotype score

 L1_sam.csv and S1_S3_ore.csv	-	Data containing mean wing scores for crosses using 32 out of 44 confirmed and quantified deletions in Long line & Samarkand background and Short lines and Oregon-R background used for calculating the correlations respectively.
Column Headers:
deletion.list	-	List of confirmed and quantified deletions used for crossing
SAM	-	Mean wing scores for crosses in the Samarkand background
L1	-	Mean wing scores for crosses in the Long backcross line used
ORE	-	Mean wing scores for crosses in the Oregon-R background
S1 & S3	-	Mean wing scores for crosses in the Short backcross lines used

Script: 
Long_Short.r	-	Used for the determination of mean wing scores and generation of correlation between crosses in Long line & Samarkand background and Short lines and Oregon-R background respectively.


## Analysis of phenotypic reaction norms for known modifier genes
Folder: Reaction Norms for known genes
Files: genes_rxn_norm.csv
       rscript_rxn_norm.r

Column Headers:
Stock_Number	-	Bloomington Stock Center stock number for the deletion used
Deletion	-	Official Deletion nomenclature for the relevant deletion lines used (see Deficiencies section in Bloomington Stock Center website http://flystocks.bio.indiana.edu/bloomhome.htm)
Rxn_Norm	-	Unique identifier describing the cross performed
Cromosome	-	Chromosome arm on which the gene/ deletion is located (2L, 2R, 3L or 3R)
Background	-	Background in which the cross was performed (ORE- Oregon-R or SAM- Samarkand)
Block	-	Block numbers in which the crosses were setup
Numeric_Phenotype	-	Semiquantitative wing phenotype score
Deletion_Set	-	The deletion identity i.e. whther the deletions used belonged to the DrosDel or Exelixis deletion collections
Gene	-	Genes contained in these deletions.

Script:
rscript_rxn_norm.r	-	Generates the reaction norms for supplemental figure 3B and some more reaction norms not included in the paper.

## sdE3 modifier screen
Folder: sdE3 modifier screen
Sub-Folder: Hemizygous Males
Files: modifier_proportion.csv
       sdE3_males_modifier.csv
       sdE3_mod_means.csv
       rscript_sdE3_males.r

File: modifier_proportion.csv	-	Data for generating the bar graph for proportion of background dependent v/s independent modifiers or Figure 2 in the paper.
Each column contains percent of background dependent modifiers and independent modifiers per Chromosome arm and the deletion collection (DD- DrosDel or Ex- Exlexisis) i.e. 2L_DD represents percent of background dependent and independent modifiers on Chromosome arm 2L when crossed to deletions from DrosDel collection. These percentages were calculated manually from GenomeWide_sdE3_ModifierScreen_data.csv.

File: sdE3_males_modifier.csv	-	Data for crosses of 44 confirmed and quantified deletions using 6 landmarks as scored in males hemizygous for sd[E3] and heterozygous for the deletion.
Column Headers:
ID	-	Identifier for the background, mutation, sex, deletion number and block in which the cross was setup
Background	-	Background in which the cross was performed (ORE- Oregon-R or SAM- Samarkand)	
Mutation	-	Gene in which the sensitizing mutation was introduced, in this case scalloped (sd) gene
Sex	-	Sex of flies scored for the wing phenotype
Block	-	Block numbers in which the crosses were setup
Deletion	-	Bloomington Stock Center stock number for the deletions used
Centroid_Size	-	Wing Centroid sizes for the wings from the crosses.

File: sdE3_mod_means.csv	-	Data containing means for wing centroid size as well as semiquantitative scores for crosses with the above 44 confirmed and quantified deletions in males.
Column Headers:
Deletion_List	-	Official Deletion nomenclature for the relevant deletion lines used (see Deficiencies section in Bloomington Stock Center website http://flystocks.bio.indiana.edu/bloomhome.htm)
Stock	-	Bloomington Stock Center stock number for the deletion used
ORE	-	Mean wing centroid sizes for crosses in the Oregon-R background
Significance_ORE	-	Whether a deletion cross produced a significantly modified phenotype as compared to the control cross based on a linear model in the Oregon-R background symbolized as 
					a= No apriori modification expected or observed
					b= NO modification expected based on semiquantitative wing scores but modification observed in the wing centroid size
					n= Apriori modification expected based on semiquantitative wing scores but no modification observed in the wing centroid size
					y= Apriori modification expected and observed
SAM	-	Mean wing centroid sizes for crosses in the Samarkand background
Significance_Sam	-	Whether a deletion cross produced a significantly modified phenotype as compared to the control cross based on a linear model in the Samarkand background symbolized as 
					a= No apriori modification expected or observed
					b= NO modification expected based on semiquantitative wing scores but modification observed in the wing centroid size
					n= Apriori modification expected based on semiquantitative wing scores but no modification observed in the wing centroid size
					y= Apriori modification expected and observed
Del_Size	-	Deletion size for the above deletion lines (For DrosDel lines see www.drosdel.org.uk and for Exelixis lines see Parks et al.,2004)
Semiqt_ORE	-	Mean semiquantitative wing score for the Oregon-R sd[E3] crosses using the above deletions
Semiqt_SAM	-	Mean semiquantitative wing score for the Samarkand sd[E3] crosses using the above deletions

Script: 
rscript_sdE3_males.r	-	Generates sdE3_mod_means.csv from sdE3_males_modifier.csv and provides linear model for calculating significance
			-	Generates the bar graph for proportion of background dependent v/s independent modifiers or Figure 2 in the paper
			-	Plots the quantitative effects of modifiers using the means or Figure 4 in the paper.


## Scripts and Data for the quantification and replication of the sdE3 modifier screen
Folder: sd[E3] modifier screen
Sub-Folder: Heterozygous Females
Files: sdE3_females.csv
       sdE3_mod_means_F.csv
       rscript_sdE3_females.r

File: sdE3_females.csv	-	Data for crosses of 44 confirmed and quantified deletions using 6 landmarks as scored in females heterozygous for both sd[E3] and for the deletion.
Column Headers:
ID	-	Identifier for the background, mutation, sex, deletion number and block in which the cross was setup
Background	-	Background in which the cross was performed (ORE- Oregon-R or SAM- Samarkand)	
Mutation	-	Gene in which the sensitizing mutation was introduced, in this case scalloped (sd) gene
Sex	-	Sex of flies scored for the wing phenotype
Block	-	Block numbers in which the crosses were setup
Deletion	-	Bloomington Stock Center stock number for the deletions used
Centroid_Size	-	Wing Centroid sizes for the wings from the crosses.

File: sdE3_mod_means_F.csv	-	Data containing means for wing centroid size for crosses with the above 44 confirmed and quantified deletions in females.
Column Headers:
Deletion_List	-	Official Deletion nomenclature for the relevant deletion lines used (see Deficiencies section in Bloomington Stock Center website http://flystocks.bio.indiana.edu/bloomhome.htm)
Stock	-	Bloomington Stock Center stock number for the deletion used
ORE	-	Mean wing centroid sizes for crosses in the Oregon-R background
Significance_ORE	-	Whether a deletion cross produced a significantly modified phenotype as compared to the control cross based on a linear model in the Oregon-R background symbolized as 
					n= No phenotypic modification observed
					y= Modification observed
SAM	-	Mean wing centroid sizes for crosses in the Samarkand background
Significance_Sam	-	Whether a deletion cross produced a significantly modified phenotype as compared to the control cross based on a linear model in the Samarkand background symbolized as 
					n= No phenotypic modification observed
					y= Modification observed

Script: 
rscript_sdE3_males.r	-	Generates sdE3_mod_means_F.csv from sdE3_females.csv and provides linear model for calculating significance
			-	Plots the quantitative effects of modifiers using the means in females or supplementary figure 6 in the paper

## Scripts and Data for quantification using the sdETX4 allele
Folder: sdETX4 modifier screen
Files: sdETX4_males_modifier.csv
       sdETX4_mod_means.csv
       rscript_sdETX4_males.r

File: sdETX4_males_modifier.csv		-	Data for crosses of 39 out of 44 confirmed and quantified deletions using 6 landmarks as scored in males hemizygous for sd[ETx4] and heterozygous for the deletion.
Column Headers:
Background	-	Background in which the cross was performed (ORE- Oregon-R or SAM- Samarkand)	
Mutation	-	Gene in which the sensitizing mutation was introduced, in this case scalloped (sd) gene
Sex	-	Sex of flies scored for the wing phenotype
Block	-	Block numbers in which the crosses were setup
Deletion	-	Bloomington Stock Center stock number for the deletions used
Centroid_Size	-	Wing Centroid sizes for the wings from the crosses.

File: sdETX4_mod_means_.csv	-	Data containing means for wing centroid size for crosses with the above 39 confirmed and quantified deletions in males.
Column Headers:
Stock	-	Bloomington Stock Center stock number for the deletion used
Deletion_List	-	Official Deletion nomenclature for the relevant deletion lines used (see Deficiencies section in Bloomington Stock Center website http://flystocks.bio.indiana.edu/bloomhome.htm)
ORE	-	Mean wing centroid sizes for crosses in the Oregon-R background
SAM	-	Mean wing centroid sizes for crosses in the Samarkand background

Script:
 rscript_sdETX4_males.r	-	Generates sdETX4_mod_means.csv from sdETX4_males_modifier.csv.
			-	Plots the quantitative effects of modifiers using the means in males or supplementary figure 7B in the paper

