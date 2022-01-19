library(tidyverse)
library(dplyr)


dir <- "C:/Users/User/OneDrive/Documents/OregonStateUniversity/Coral_Projects/GreatBarrierReef/Pdae_Project/AF_Paper/ResponseToEditors/"
setwd(dir)

#####AB  Finds all significant SNPs that were genotyped in other families
ABsigFE <- semi_join(sig_AB, FE_FinalBaseCall, by = c("Tag"))

list <- (intersect(sig_AB["Tag"], FE_FinalBaseCall["Tag"]))
union(sig_AB["Tag"], FE_FinalBaseCall["Tag"])

ABsigAC <- semi_join(sig_AB, AC_FinalBaseCall, by = c("Tag"))
ABsigAF <- semi_join(sig_AB, AF_FinalBaseCall, by = c("Tag"))
ABsigBA <- semi_join(sig_AB, BA_FinalBaseCall, by = c("Tag"))
ABsigBD <- semi_join(sig_AB, BD_FinalBaseCall, by = c("Tag"))
ABsigCB <- semi_join(sig_AB, CB_FinalBaseCall, by = c("Tag"))
ABsigCD <- semi_join(sig_AB, CD_FinalBaseCall, by = c("Tag"))
ABsigCE <- semi_join(sig_AB, CE_FinalBaseCall, by = c("Tag"))
ABsigFA <- semi_join(sig_AB, FA_FinalBaseCall, by = c("Tag"))


#####AC  Finds all significant SNPs that were genotyped in other families
ACsigAB <- semi_join(sig_AC, AB_FinalBaseCall, by = c("Tag"))
ACsigAF <- semi_join(sig_AC, AF_FinalBaseCall, by = c("Tag"))
ACsigBA <- semi_join(sig_AC, BA_FinalBaseCall, by = c("Tag"))
ACsigBD <- semi_join(sig_AC, BD_FinalBaseCall, by = c("Tag"))
ACsigCB <- semi_join(sig_AC, CB_FinalBaseCall, by = c("Tag"))
ACsigCD <- semi_join(sig_AC, CD_FinalBaseCall, by = c("Tag"))
ACsigCE <- semi_join(sig_AC, CE_FinalBaseCall, by = c("Tag"))
ACsigFA <- semi_join(sig_AC, FA_FinalBaseCall, by = c("Tag"))
ACsigFE <- semi_join(sig_AC, FE_FinalBaseCall, by = c("Tag"))


#####AF  Finds all significant SNPs that were genotyped in other families
AFsigAB <- semi_join(sig_AF, AB_FinalBaseCall, by = c("Tag"))
AFsigAC <- semi_join(sig_AF, AC_FinalBaseCall, by = c("Tag"))
AFsigBA <- semi_join(sig_AF, BA_FinalBaseCall, by = c("Tag"))
AFsigBD <- semi_join(sig_AF, BD_FinalBaseCall, by = c("Tag"))
AFsigCB <- semi_join(sig_AF, CB_FinalBaseCall, by = c("Tag"))
AFsigCD <- semi_join(sig_AF, CD_FinalBaseCall, by = c("Tag"))
AFsigCE <- semi_join(sig_AF, CE_FinalBaseCall, by = c("Tag"))
AFsigFA <- semi_join(sig_AF, FA_FinalBaseCall, by = c("Tag"))
AFsigFE <- semi_join(sig_AF, FE_FinalBaseCall, by = c("Tag"))


#####BA  Finds all significant SNPs that were genotyped in other families
BAsigAB <- semi_join(sig_BA, AB_FinalBaseCall, by = c("Tag"))
BAsigAC <- semi_join(sig_BA, AC_FinalBaseCall, by = c("Tag"))
BAsigAF <- semi_join(sig_BA, AF_FinalBaseCall, by = c("Tag"))
BAsigBD <- semi_join(sig_BA, BD_FinalBaseCall, by = c("Tag"))
BAsigCB <- semi_join(sig_BA, CB_FinalBaseCall, by = c("Tag"))
BAsigCD <- semi_join(sig_BA, CD_FinalBaseCall, by = c("Tag"))
BAsigCE <- semi_join(sig_BA, CE_FinalBaseCall, by = c("Tag"))
BAsigFA <- semi_join(sig_BA, FA_FinalBaseCall, by = c("Tag"))
BAsigFE <- semi_join(sig_BA, FE_FinalBaseCall, by = c("Tag"))


#####BD  Finds all significant SNPs that were genotyped in other families
BDsigAB <- semi_join(sig_BD, AB_FinalBaseCall, by = c("Tag"))
BDsigAC <- semi_join(sig_BD, AC_FinalBaseCall, by = c("Tag"))
BDsigAF <- semi_join(sig_BD, AF_FinalBaseCall, by = c("Tag"))
BDsigBA <- semi_join(sig_BD, BA_FinalBaseCall, by = c("Tag"))
BDsigCB <- semi_join(sig_BD, CB_FinalBaseCall, by = c("Tag"))
BDsigCD <- semi_join(sig_BD, CD_FinalBaseCall, by = c("Tag"))
BDsigCE <- semi_join(sig_BD, CE_FinalBaseCall, by = c("Tag"))
BDsigFA <- semi_join(sig_BD, FA_FinalBaseCall, by = c("Tag"))
BDsigFE <- semi_join(sig_BD, FE_FinalBaseCall, by = c("Tag"))


#####CB  Finds all significant SNPs that were genotyped in other families
CBsigAB <- semi_join(sig_CB, AB_FinalBaseCall, by = c("Tag"))
CBsigAC <- semi_join(sig_CB, AC_FinalBaseCall, by = c("Tag"))
CBsigAF <- semi_join(sig_CB, AF_FinalBaseCall, by = c("Tag"))
CBsigBA <- semi_join(sig_CB, BA_FinalBaseCall, by = c("Tag"))
CBsigBD <- semi_join(sig_CB, BD_FinalBaseCall, by = c("Tag"))
CBsigCD <- semi_join(sig_CB, CD_FinalBaseCall, by = c("Tag"))
CBsigCE <- semi_join(sig_CB, CE_FinalBaseCall, by = c("Tag"))
CBsigFA <- semi_join(sig_CB, FA_FinalBaseCall, by = c("Tag"))
CBsigFE <- semi_join(sig_CB, FE_FinalBaseCall, by = c("Tag"))


#####CD  Finds all significant SNPs that were genotyped in other families
CDsigAB <- semi_join(sig_CD, AB_FinalBaseCall, by = c("Tag"))
CDsigAC <- semi_join(sig_CD, AC_FinalBaseCall, by = c("Tag"))
CDsigAF <- semi_join(sig_CD, AF_FinalBaseCall, by = c("Tag"))
CDsigBA <- semi_join(sig_CD, BA_FinalBaseCall, by = c("Tag"))
CDsigBD <- semi_join(sig_CD, BD_FinalBaseCall, by = c("Tag"))
CDsigCB <- semi_join(sig_CD, CB_FinalBaseCall, by = c("Tag"))
CDsigCE <- semi_join(sig_CD, CE_FinalBaseCall, by = c("Tag"))
CDsigFA <- semi_join(sig_CD, FA_FinalBaseCall, by = c("Tag"))
CDsigFE <- semi_join(sig_CD, FE_FinalBaseCall, by = c("Tag"))


#####CE  Finds all significant SNPs that were genotyped in other families
CEsigAB <- semi_join(sig_CE, AB_FinalBaseCall, by = c("Tag"))
CEsigAC <- semi_join(sig_CE, AC_FinalBaseCall, by = c("Tag"))
CEsigAF <- semi_join(sig_CE, AF_FinalBaseCall, by = c("Tag"))
CEsigBA <- semi_join(sig_CE, BA_FinalBaseCall, by = c("Tag"))
CEsigBD <- semi_join(sig_CE, BD_FinalBaseCall, by = c("Tag"))
CEsigCB <- semi_join(sig_CE, CB_FinalBaseCall, by = c("Tag"))
CEsigCD <- semi_join(sig_CE, CD_FinalBaseCall, by = c("Tag"))
CEsigFA <- semi_join(sig_CE, FA_FinalBaseCall, by = c("Tag"))
CEsigFE <- semi_join(sig_CE, FE_FinalBaseCall, by = c("Tag"))


#####FA  Finds all significant SNPs that were genotyped in other families
FAsigAB <- semi_join(sig_FA, AB_FinalBaseCall, by = c("Tag"))
FAsigAC <- semi_join(sig_FA, AC_FinalBaseCall, by = c("Tag"))
FAsigAF <- semi_join(sig_FA, AF_FinalBaseCall, by = c("Tag"))
FAsigBA <- semi_join(sig_FA, BA_FinalBaseCall, by = c("Tag"))
FAsigBD <- semi_join(sig_FA, BD_FinalBaseCall, by = c("Tag"))
FAsigCB <- semi_join(sig_FA, CB_FinalBaseCall, by = c("Tag"))
FAsigCD <- semi_join(sig_FA, CD_FinalBaseCall, by = c("Tag"))
FAsigCE <- semi_join(sig_FA, CE_FinalBaseCall, by = c("Tag"))
FAsigFE <- semi_join(sig_FA, FE_FinalBaseCall, by = c("Tag"))


#####FE  Finds all significant SNPs that were genotyped in other families
FEsigAB <- semi_join(sig_FE, AB_FinalBaseCall, by = c("Tag"))
FEsigAC <- semi_join(sig_FE, AC_FinalBaseCall, by = c("Tag"))
FEsigAF <- semi_join(sig_FE, AF_FinalBaseCall, by = c("Tag"))
FEsigBA <- semi_join(sig_FE, BA_FinalBaseCall, by = c("Tag"))
FEsigBD <- semi_join(sig_FE, BD_FinalBaseCall, by = c("Tag"))
FEsigCB <- semi_join(sig_FE, CB_FinalBaseCall, by = c("Tag"))
FEsigCD <- semi_join(sig_FE, CD_FinalBaseCall, by = c("Tag"))
FEsigCE <- semi_join(sig_FE, CE_FinalBaseCall, by = c("Tag"))
FEsigFA <- semi_join(sig_FE, FA_FinalBaseCall, by = c("Tag"))


library(ggplot2)
# Makes the figures
ggplot(SigInInsigPerFam, aes(x=Sig, y=Percent, fill=Insig)) + geom_bar(position = "dodge", stat = "identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####AB_FIG####
ggplot(ABtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####AF_FIG####
ggplot(AFtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####BA_FIG####
ggplot(BAtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####BC_FIG####
ggplot(BCtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####CA_FIG####
ggplot(CAtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####DB_FIG####
ggplot(DBtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####DC_FIG####
ggplot(DCtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####EC_FIG####
ggplot(ECtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####EF_FIG####
ggplot(EFtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

####FA_FIG####
ggplot(FAtoAll, aes(x=Insig, y=Percent, fill=Insig)) + geom_bar(stat="identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Identified") + xlab("Family Name")

############################# Need to find those tags genotyped in all the crosses and compare ########################################

#####AB  Finds all genotyped SNPs that were genotyped in other families
ABinsigFE <- semi_join(AB_FinalBaseCall, FE_FinalBaseCall, by = c("Tag"))
ABinsigAC <- semi_join(AB_FinalBaseCall, AC_FinalBaseCall, by = c("Tag"))
ABinsigAF <- semi_join(AB_FinalBaseCall, AF_FinalBaseCall, by = c("Tag"))
ABinsigBA <- semi_join(AB_FinalBaseCall, BA_FinalBaseCall, by = c("Tag"))
ABinsigBD <- semi_join(AB_FinalBaseCall, BD_FinalBaseCall, by = c("Tag"))
ABinsigCB <- semi_join(AB_FinalBaseCall, CB_FinalBaseCall, by = c("Tag"))
ABinsigCD <- semi_join(AB_FinalBaseCall, CD_FinalBaseCall, by = c("Tag"))
ABinsigCE <- semi_join(AB_FinalBaseCall, CE_FinalBaseCall, by = c("Tag"))
ABinsigFA <- semi_join(AB_FinalBaseCall, FA_FinalBaseCall, by = c("Tag"))


#####AC  Finds all genotyped SNPs that were genotyped in other families
ACinsigAB <- semi_join(AC_FinalBaseCall, AB_FinalBaseCall, by = c("Tag"))
ACinsigAF <- semi_join(AC_FinalBaseCall, AF_FinalBaseCall, by = c("Tag"))
ACinsigBA <- semi_join(AC_FinalBaseCall, BA_FinalBaseCall, by = c("Tag"))
ACinsigBD <- semi_join(AC_FinalBaseCall, BD_FinalBaseCall, by = c("Tag"))
ACinsigCB <- semi_join(AC_FinalBaseCall, CB_FinalBaseCall, by = c("Tag"))
ACinsigCD <- semi_join(AC_FinalBaseCall, CD_FinalBaseCall, by = c("Tag"))
ACinsigCE <- semi_join(AC_FinalBaseCall, CE_FinalBaseCall, by = c("Tag"))
ACinsigFA <- semi_join(AC_FinalBaseCall, FA_FinalBaseCall, by = c("Tag"))
ACinsigFE <- semi_join(AC_FinalBaseCall, FE_FinalBaseCall, by = c("Tag"))


#####AF  Finds all genotyped SNPs that were genotyped in other families
AFinsigAB <- semi_join(AF_FinalBaseCall, AB_FinalBaseCall, by = c("Tag"))
AFinsigAC <- semi_join(AF_FinalBaseCall, AC_FinalBaseCall, by = c("Tag"))
AFinsigBA <- semi_join(AF_FinalBaseCall, BA_FinalBaseCall, by = c("Tag"))
AFinsigBD <- semi_join(AF_FinalBaseCall, BD_FinalBaseCall, by = c("Tag"))
AFinsigCB <- semi_join(AF_FinalBaseCall, CB_FinalBaseCall, by = c("Tag"))
AFinsigCD <- semi_join(AF_FinalBaseCall, CD_FinalBaseCall, by = c("Tag"))
AFinsigCE <- semi_join(AF_FinalBaseCall, CE_FinalBaseCall, by = c("Tag"))
AFinsigFA <- semi_join(AF_FinalBaseCall, FA_FinalBaseCall, by = c("Tag"))
AFinsigFE <- semi_join(AF_FinalBaseCall, FE_FinalBaseCall, by = c("Tag"))


#####BA  Finds all genotyped SNPs that were genotyped in other families
BAinsigAB <- semi_join(BA_FinalBaseCall, AB_FinalBaseCall, by = c("Tag"))
BAinsigAC <- semi_join(BA_FinalBaseCall, AC_FinalBaseCall, by = c("Tag"))
BAinsigAF <- semi_join(BA_FinalBaseCall, AF_FinalBaseCall, by = c("Tag"))
BAinsigBD <- semi_join(BA_FinalBaseCall, BD_FinalBaseCall, by = c("Tag"))
BAinsigCB <- semi_join(BA_FinalBaseCall, CB_FinalBaseCall, by = c("Tag"))
BAinsigCD <- semi_join(BA_FinalBaseCall, CD_FinalBaseCall, by = c("Tag"))
BAinsigCE <- semi_join(BA_FinalBaseCall, CE_FinalBaseCall, by = c("Tag"))
BAinsigFA <- semi_join(BA_FinalBaseCall, FA_FinalBaseCall, by = c("Tag"))
BAinsigFE <- semi_join(BA_FinalBaseCall, FE_FinalBaseCall, by = c("Tag"))


#####BD  Finds all genotyped SNPs that were genotyped in other families
BDinsigAB <- semi_join(BD_FinalBaseCall, AB_FinalBaseCall, by = c("Tag"))
BDinsigAC <- semi_join(BD_FinalBaseCall, AC_FinalBaseCall, by = c("Tag"))
BDinsigAF <- semi_join(BD_FinalBaseCall, AF_FinalBaseCall, by = c("Tag"))
BDinsigBA <- semi_join(BD_FinalBaseCall, BA_FinalBaseCall, by = c("Tag"))
BDinsigCB <- semi_join(BD_FinalBaseCall, CB_FinalBaseCall, by = c("Tag"))
BDinsigCD <- semi_join(BD_FinalBaseCall, CD_FinalBaseCall, by = c("Tag"))
BDinsigCE <- semi_join(BD_FinalBaseCall, CE_FinalBaseCall, by = c("Tag"))
BDinsigFA <- semi_join(BD_FinalBaseCall, FA_FinalBaseCall, by = c("Tag"))
BDinsigFE <- semi_join(BD_FinalBaseCall, FE_FinalBaseCall, by = c("Tag"))


#####CB  Finds all genotyped SNPs that were genotyped in other families
CBinsigAB <- semi_join(CB_FinalBaseCall, AB_FinalBaseCall, by = c("Tag"))
CBinsigAC <- semi_join(CB_FinalBaseCall, AC_FinalBaseCall, by = c("Tag"))
CBinsigAF <- semi_join(CB_FinalBaseCall, AF_FinalBaseCall, by = c("Tag"))
CBinsigBA <- semi_join(CB_FinalBaseCall, BA_FinalBaseCall, by = c("Tag"))
CBinsigBD <- semi_join(CB_FinalBaseCall, BD_FinalBaseCall, by = c("Tag"))
CBinsigCD <- semi_join(CB_FinalBaseCall, CD_FinalBaseCall, by = c("Tag"))
CBinsigCE <- semi_join(CB_FinalBaseCall, CE_FinalBaseCall, by = c("Tag"))
CBinsigFA <- semi_join(CB_FinalBaseCall, FA_FinalBaseCall, by = c("Tag"))
CBinsigFE <- semi_join(CB_FinalBaseCall, FE_FinalBaseCall, by = c("Tag"))


#####CD  Finds all genotyped SNPs that were genotyped in other families
CDinsigAB <- semi_join(CD_FinalBaseCall, AB_FinalBaseCall, by = c("Tag"))
CDinsigAC <- semi_join(CD_FinalBaseCall, AC_FinalBaseCall, by = c("Tag"))
CDinsigAF <- semi_join(CD_FinalBaseCall, AF_FinalBaseCall, by = c("Tag"))
CDinsigBA <- semi_join(CD_FinalBaseCall, BA_FinalBaseCall, by = c("Tag"))
CDinsigBD <- semi_join(CD_FinalBaseCall, BD_FinalBaseCall, by = c("Tag"))
CDinsigCB <- semi_join(CD_FinalBaseCall, CB_FinalBaseCall, by = c("Tag"))
CDinsigCE <- semi_join(CD_FinalBaseCall, CE_FinalBaseCall, by = c("Tag"))
CDinsigFA <- semi_join(CD_FinalBaseCall, FA_FinalBaseCall, by = c("Tag"))
CDinsigFE <- semi_join(CD_FinalBaseCall, FE_FinalBaseCall, by = c("Tag"))


#####CE  Finds all genotyped SNPs that were genotyped in other families
CEinsigAB <- semi_join(CE_FinalBaseCall, AB_FinalBaseCall, by = c("Tag"))
CEinsigAC <- semi_join(CE_FinalBaseCall, AC_FinalBaseCall, by = c("Tag"))
CEinsigAF <- semi_join(CE_FinalBaseCall, AF_FinalBaseCall, by = c("Tag"))
CEinsigBA <- semi_join(CE_FinalBaseCall, BA_FinalBaseCall, by = c("Tag"))
CEinsigBD <- semi_join(CE_FinalBaseCall, BD_FinalBaseCall, by = c("Tag"))
CEinsigCB <- semi_join(CE_FinalBaseCall, CB_FinalBaseCall, by = c("Tag"))
CEinsigCD <- semi_join(CE_FinalBaseCall, CD_FinalBaseCall, by = c("Tag"))
CEinsigFA <- semi_join(CE_FinalBaseCall, FA_FinalBaseCall, by = c("Tag"))
CEinsigFE <- semi_join(CE_FinalBaseCall, FE_FinalBaseCall, by = c("Tag"))


#####FA  Finds all genotyped SNPs that were genotyped in other families
FAinsigAB <- semi_join(FA_FinalBaseCall, AB_FinalBaseCall, by = c("Tag"))
FAinsigAC <- semi_join(FA_FinalBaseCall, AC_FinalBaseCall, by = c("Tag"))
FAinsigAF <- semi_join(FA_FinalBaseCall, AF_FinalBaseCall, by = c("Tag"))
FAinsigBA <- semi_join(FA_FinalBaseCall, BA_FinalBaseCall, by = c("Tag"))
FAinsigBD <- semi_join(FA_FinalBaseCall, BD_FinalBaseCall, by = c("Tag"))
FAinsigCB <- semi_join(FA_FinalBaseCall, CB_FinalBaseCall, by = c("Tag"))
FAinsigCD <- semi_join(FA_FinalBaseCall, CD_FinalBaseCall, by = c("Tag"))
FAinsigCE <- semi_join(FA_FinalBaseCall, CE_FinalBaseCall, by = c("Tag"))
FAinsigFE <- semi_join(FA_FinalBaseCall, FE_FinalBaseCall, by = c("Tag"))


#####FE  Finds all genotyped SNPs that were genotyped in other families
FEinsigAB <- semi_join(FE_FinalBaseCall, AB_FinalBaseCall, by = c("Tag"))
FEinsigAC <- semi_join(FE_FinalBaseCall, AC_FinalBaseCall, by = c("Tag"))
FEinsigAF <- semi_join(FE_FinalBaseCall, AF_FinalBaseCall, by = c("Tag"))
FEinsigBA <- semi_join(FE_FinalBaseCall, BA_FinalBaseCall, by = c("Tag"))
FEinsigBD <- semi_join(FE_FinalBaseCall, BD_FinalBaseCall, by = c("Tag"))
FEinsigCB <- semi_join(FE_FinalBaseCall, CB_FinalBaseCall, by = c("Tag"))
FEinsigCD <- semi_join(FE_FinalBaseCall, CD_FinalBaseCall, by = c("Tag"))
FEinsigCE <- semi_join(FE_FinalBaseCall, CE_FinalBaseCall, by = c("Tag"))
FEinsigFA <- semi_join(FE_FinalBaseCall, FA_FinalBaseCall, by = c("Tag"))

###################################### Find all Genotyped Tags in 80X #############################################

#####AB  Finds all genotyped SNPs that were genotyped in other families at 80X
AB80FE <- semi_join(AB80_SNPs_Pval, FE80_SNPs_Pval, by = c("Tag"))
AB80AC <- semi_join(AB80_SNPs_Pval, AC80_SNPs_Pval, by = c("Tag"))
AB80AF <- semi_join(AB80_SNPs_Pval, AF80_SNPs_Pval, by = c("Tag"))
AB80BA <- semi_join(AB80_SNPs_Pval, BA80_SNPs_Pval, by = c("Tag"))
AB80BD <- semi_join(AB80_SNPs_Pval, BD80_SNPs_Pval, by = c("Tag"))
AB80CB <- semi_join(AB80_SNPs_Pval, CB80_SNPs_Pval, by = c("Tag"))
AB80CD <- semi_join(AB80_SNPs_Pval, CD80_SNPs_Pval, by = c("Tag"))
AB80CE <- semi_join(AB80_SNPs_Pval, CE80_SNPs_Pval, by = c("Tag"))
AB80FA <- semi_join(AB80_SNPs_Pval, FA80_SNPs_Pval, by = c("Tag"))


#####AC  Finds all genotyped SNPs that were genotyped in other families at 80X
AC80AB <- semi_join(AC80_SNPs_Pval, AB80_SNPs_Pval, by = c("Tag"))
AC80AF <- semi_join(AC80_SNPs_Pval, AF80_SNPs_Pval, by = c("Tag"))
AC80BA <- semi_join(AC80_SNPs_Pval, BA80_SNPs_Pval, by = c("Tag"))
AC80BD <- semi_join(AC80_SNPs_Pval, BD80_SNPs_Pval, by = c("Tag"))
AC80CB <- semi_join(AC80_SNPs_Pval, CB80_SNPs_Pval, by = c("Tag"))
AC80CD <- semi_join(AC80_SNPs_Pval, CD80_SNPs_Pval, by = c("Tag"))
AC80CE <- semi_join(AC80_SNPs_Pval, CE80_SNPs_Pval, by = c("Tag"))
AC80FA <- semi_join(AC80_SNPs_Pval, FA80_SNPs_Pval, by = c("Tag"))
AC80FE <- semi_join(AC80_SNPs_Pval, FE80_SNPs_Pval, by = c("Tag"))


#####AF  Finds all genotyped SNPs that were genotyped in other families at 80X
AF80AB <- semi_join(AF80_SNPs_Pval, AB80_SNPs_Pval, by = c("Tag"))
AF80AC <- semi_join(AF80_SNPs_Pval, AC80_SNPs_Pval, by = c("Tag"))
AF80BA <- semi_join(AF80_SNPs_Pval, BA80_SNPs_Pval, by = c("Tag"))
AF80BD <- semi_join(AF80_SNPs_Pval, BD80_SNPs_Pval, by = c("Tag"))
AF80CB <- semi_join(AF80_SNPs_Pval, CB80_SNPs_Pval, by = c("Tag"))
AF80CD <- semi_join(AF80_SNPs_Pval, CD80_SNPs_Pval, by = c("Tag"))
AF80CE <- semi_join(AF80_SNPs_Pval, CE80_SNPs_Pval, by = c("Tag"))
AF80FA <- semi_join(AF80_SNPs_Pval, FA80_SNPs_Pval, by = c("Tag"))
AF80FE <- semi_join(AF80_SNPs_Pval, FE80_SNPs_Pval, by = c("Tag"))


#####BA  Finds all genotyped SNPs that were genotyped in other families at 80X
BA80AB <- semi_join(BA80_SNPs_Pval, AB80_SNPs_Pval, by = c("Tag"))
BA80AC <- semi_join(BA80_SNPs_Pval, AC80_SNPs_Pval, by = c("Tag"))
BA80AF <- semi_join(BA80_SNPs_Pval, AF80_SNPs_Pval, by = c("Tag"))
BA80BD <- semi_join(BA80_SNPs_Pval, BD80_SNPs_Pval, by = c("Tag"))
BA80CB <- semi_join(BA80_SNPs_Pval, CB80_SNPs_Pval, by = c("Tag"))
BA80CD <- semi_join(BA80_SNPs_Pval, CD80_SNPs_Pval, by = c("Tag"))
BA80CE <- semi_join(BA80_SNPs_Pval, CE80_SNPs_Pval, by = c("Tag"))
BA80FA <- semi_join(BA80_SNPs_Pval, FA80_SNPs_Pval, by = c("Tag"))
BA80FE <- semi_join(BA80_SNPs_Pval, FE80_SNPs_Pval, by = c("Tag"))


#####BD  Finds all genotyped SNPs that were genotyped in other families at 80X
BD80AB <- semi_join(BD80_SNPs_Pval, AB80_SNPs_Pval, by = c("Tag"))
BD80AC <- semi_join(BD80_SNPs_Pval, AC80_SNPs_Pval, by = c("Tag"))
BD80AF <- semi_join(BD80_SNPs_Pval, AF80_SNPs_Pval, by = c("Tag"))
BD80BA <- semi_join(BD80_SNPs_Pval, BA80_SNPs_Pval, by = c("Tag"))
BD80CB <- semi_join(BD80_SNPs_Pval, CB80_SNPs_Pval, by = c("Tag"))
BD80CD <- semi_join(BD80_SNPs_Pval, CD80_SNPs_Pval, by = c("Tag"))
BD80CE <- semi_join(BD80_SNPs_Pval, CE80_SNPs_Pval, by = c("Tag"))
BD80FA <- semi_join(BD80_SNPs_Pval, FA80_SNPs_Pval, by = c("Tag"))
BD80FE <- semi_join(BD80_SNPs_Pval, FE80_SNPs_Pval, by = c("Tag"))


#####CB  Finds all genotyped SNPs that were genotyped in other families at 80X
CB80AB <- semi_join(CB80_SNPs_Pval, AB80_SNPs_Pval, by = c("Tag"))
CB80AC <- semi_join(CB80_SNPs_Pval, AC80_SNPs_Pval, by = c("Tag"))
CB80AF <- semi_join(CB80_SNPs_Pval, AF80_SNPs_Pval, by = c("Tag"))
CB80BA <- semi_join(CB80_SNPs_Pval, BA80_SNPs_Pval, by = c("Tag"))
CB80BD <- semi_join(CB80_SNPs_Pval, BD80_SNPs_Pval, by = c("Tag"))
CB80CD <- semi_join(CB80_SNPs_Pval, CD80_SNPs_Pval, by = c("Tag"))
CB80CE <- semi_join(CB80_SNPs_Pval, CE80_SNPs_Pval, by = c("Tag"))
CB80FA <- semi_join(CB80_SNPs_Pval, FA80_SNPs_Pval, by = c("Tag"))
CB80FE <- semi_join(CB80_SNPs_Pval, FE80_SNPs_Pval, by = c("Tag"))


#####CD  Finds all genotyped SNPs that were genotyped in other families at 80X
CD80AB <- semi_join(CD80_SNPs_Pval, AB80_SNPs_Pval, by = c("Tag"))
CD80AC <- semi_join(CD80_SNPs_Pval, AC80_SNPs_Pval, by = c("Tag"))
CD80AF <- semi_join(CD80_SNPs_Pval, AF80_SNPs_Pval, by = c("Tag"))
CD80BA <- semi_join(CD80_SNPs_Pval, BA80_SNPs_Pval, by = c("Tag"))
CD80BD <- semi_join(CD80_SNPs_Pval, BD80_SNPs_Pval, by = c("Tag"))
CD80CB <- semi_join(CD80_SNPs_Pval, CB80_SNPs_Pval, by = c("Tag"))
CD80CE <- semi_join(CD80_SNPs_Pval, CE80_SNPs_Pval, by = c("Tag"))
CD80FA <- semi_join(CD80_SNPs_Pval, FA80_SNPs_Pval, by = c("Tag"))
CD80FE <- semi_join(CD80_SNPs_Pval, FE80_SNPs_Pval, by = c("Tag"))


#####CE  Finds all genotyped SNPs that were genotyped in other families at 80X
CE80AB <- semi_join(CE80_SNPs_Pval, AB80_SNPs_Pval, by = c("Tag"))
CE80AC <- semi_join(CE80_SNPs_Pval, AC80_SNPs_Pval, by = c("Tag"))
CE80AF <- semi_join(CE80_SNPs_Pval, AF80_SNPs_Pval, by = c("Tag"))
CE80BA <- semi_join(CE80_SNPs_Pval, BA80_SNPs_Pval, by = c("Tag"))
CE80BD <- semi_join(CE80_SNPs_Pval, BD80_SNPs_Pval, by = c("Tag"))
CE80CB <- semi_join(CE80_SNPs_Pval, CB80_SNPs_Pval, by = c("Tag"))
CE80CD <- semi_join(CE80_SNPs_Pval, CD80_SNPs_Pval, by = c("Tag"))
CE80FA <- semi_join(CE80_SNPs_Pval, FA80_SNPs_Pval, by = c("Tag"))
CE80FE <- semi_join(CE80_SNPs_Pval, FE80_SNPs_Pval, by = c("Tag"))


#####FA  Finds all genotyped SNPs that were genotyped in other families at 80X
FA80AB <- semi_join(FA80_SNPs_Pval, AB80_SNPs_Pval, by = c("Tag"))
FA80AC <- semi_join(FA80_SNPs_Pval, AC80_SNPs_Pval, by = c("Tag"))
FA80AF <- semi_join(FA80_SNPs_Pval, AF80_SNPs_Pval, by = c("Tag"))
FA80BA <- semi_join(FA80_SNPs_Pval, BA80_SNPs_Pval, by = c("Tag"))
FA80BD <- semi_join(FA80_SNPs_Pval, BD80_SNPs_Pval, by = c("Tag"))
FA80CB <- semi_join(FA80_SNPs_Pval, CB80_SNPs_Pval, by = c("Tag"))
FA80CD <- semi_join(FA80_SNPs_Pval, CD80_SNPs_Pval, by = c("Tag"))
FA80CE <- semi_join(FA80_SNPs_Pval, CE80_SNPs_Pval, by = c("Tag"))
FA80FE <- semi_join(FA80_SNPs_Pval, FE80_SNPs_Pval, by = c("Tag"))


#####FE  Finds all genotyped SNPs that were genotyped in other families at 80X
FE80AB <- semi_join(FE80_SNPs_Pval, AB80_SNPs_Pval, by = c("Tag"))
FE80AC <- semi_join(FE80_SNPs_Pval, AC80_SNPs_Pval, by = c("Tag"))
FE80AF <- semi_join(FE80_SNPs_Pval, AF80_SNPs_Pval, by = c("Tag"))
FE80BA <- semi_join(FE80_SNPs_Pval, BA80_SNPs_Pval, by = c("Tag"))
FE80BD <- semi_join(FE80_SNPs_Pval, BD80_SNPs_Pval, by = c("Tag"))
FE80CB <- semi_join(FE80_SNPs_Pval, CB80_SNPs_Pval, by = c("Tag"))
FE80CD <- semi_join(FE80_SNPs_Pval, CD80_SNPs_Pval, by = c("Tag"))
FE80CE <- semi_join(FE80_SNPs_Pval, CE80_SNPs_Pval, by = c("Tag"))
FE80FA <- semi_join(FE80_SNPs_Pval, FA80_SNPs_Pval, by = c("Tag"))


#####AB  Finds all significant SNPs that were significant in other families
ABsigFE2 <- inner_join(sig_AB, sig_FE, by = c("Tag"))
ABsigAC2 <- inner_join(sig_AB, sig_AC, by = c("Tag"))
ABsigAF2 <- inner_join(sig_AB, sig_AF, by = c("Tag"))
ABsigBA2 <- inner_join(sig_AB, sig_BA, by = c("Tag"))
ABsigBD2 <- inner_join(sig_AB, sig_BD, by = c("Tag"))
ABsigCB2 <- inner_join(sig_AB, sig_CB, by = c("Tag"))
ABsigCD2 <- inner_join(sig_AB, sig_CD, by = c("Tag"))
ABsigCE2 <- inner_join(sig_AB, sig_CE, by = c("Tag"))
ABsigFA2 <- inner_join(sig_AB, sig_FA, by = c("Tag"))


#####AC  Finds all significant SNPs that were significant in other families
ACsigAB2 <- inner_join(sig_AC, sig_AB, by = c("Tag"))
ACsigAF2 <- inner_join(sig_AC, sig_AF, by = c("Tag"))
ACsigBA2 <- inner_join(sig_AC, sig_BA, by = c("Tag"))
ACsigBD2 <- inner_join(sig_AC, sig_BD, by = c("Tag"))
ACsigCB2 <- inner_join(sig_AC, sig_CB, by = c("Tag"))
ACsigCD2 <- inner_join(sig_AC, sig_CD, by = c("Tag"))
ACsigCE2 <- inner_join(sig_AC, sig_CE, by = c("Tag"))
ACsigFA2 <- inner_join(sig_AC, sig_FA, by = c("Tag"))
ACsigFE2 <- inner_join(sig_AC, sig_FE, by = c("Tag"))


#####AF  Finds all significant SNPs that were significant in other families
AFsigAB2 <- inner_join(sig_AF, sig_AB, by = c("Tag"))
AFsigAC2 <- inner_join(sig_AF, sig_AC, by = c("Tag"))
AFsigBA2 <- inner_join(sig_AF, sig_BA, by = c("Tag"))
AFsigBD2 <- inner_join(sig_AF, sig_BD, by = c("Tag"))
AFsigCB2 <- inner_join(sig_AF, sig_CB, by = c("Tag"))
AFsigCD2 <- inner_join(sig_AF, sig_CD, by = c("Tag"))
AFsigCE2 <- inner_join(sig_AF, sig_CE, by = c("Tag"))
AFsigFA2 <- inner_join(sig_AF, sig_FA, by = c("Tag"))
AFsigFE2 <- inner_join(sig_AF, sig_FE, by = c("Tag"))


#####BA  Finds all significant SNPs that were significant in other families
BAsigAB2 <- inner_join(sig_BA, sig_AB, by = c("Tag"))
BAsigAC2 <- inner_join(sig_BA, sig_AC, by = c("Tag"))
BAsigAF2 <- inner_join(sig_BA, sig_AF, by = c("Tag"))
BAsigBD2 <- inner_join(sig_BA, sig_BD, by = c("Tag"))
BAsigCB2 <- inner_join(sig_BA, sig_CB, by = c("Tag"))
BAsigCD2 <- inner_join(sig_BA, sig_CD, by = c("Tag"))
BAsigCE2 <- inner_join(sig_BA, sig_CE, by = c("Tag"))
BAsigFA2 <- inner_join(sig_BA, sig_FA, by = c("Tag"))
BAsigFE2 <- inner_join(sig_BA, sig_FE, by = c("Tag"))


#####BD  Finds all significant SNPs that were significant in other families
BDsigAB2 <- inner_join(sig_BD, sig_AB, by = c("Tag"))
BDsigAC2 <- inner_join(sig_BD, sig_AC, by = c("Tag"))
BDsigAF2 <- inner_join(sig_BD, sig_AF, by = c("Tag"))
BDsigBA2 <- inner_join(sig_BD, sig_BA, by = c("Tag"))
BDsigCB2 <- inner_join(sig_BD, sig_CB, by = c("Tag"))
BDsigCD2 <- inner_join(sig_BD, sig_CD, by = c("Tag"))
BDsigCE2 <- inner_join(sig_BD, sig_CE, by = c("Tag"))
BDsigFA2 <- inner_join(sig_BD, sig_FA, by = c("Tag"))
BDsigFE2 <- inner_join(sig_BD, sig_FE, by = c("Tag"))


#####CB  Finds all significant SNPs that were significant in other families
CBsigAB2 <- inner_join(sig_CB, sig_AB, by = c("Tag"))
CBsigAC2 <- inner_join(sig_CB, sig_AC, by = c("Tag"))
CBsigAF2 <- inner_join(sig_CB, sig_AF, by = c("Tag"))
CBsigBA2 <- inner_join(sig_CB, sig_BA, by = c("Tag"))
CBsigBD2 <- inner_join(sig_CB, sig_BD, by = c("Tag"))
CBsigCD2 <- inner_join(sig_CB, sig_CD, by = c("Tag"))
CBsigCE2 <- inner_join(sig_CB, sig_CE, by = c("Tag"))
CBsigFA2 <- inner_join(sig_CB, sig_FA, by = c("Tag"))
CBsigFE2 <- inner_join(sig_CB, sig_FE, by = c("Tag"))


#####CD  Finds all significant SNPs that were significant in other families
CDsigAB2 <- inner_join(sig_CD, sig_AB, by = c("Tag"))
CDsigAC2 <- inner_join(sig_CD, sig_AC, by = c("Tag"))
CDsigAF2 <- inner_join(sig_CD, sig_AF, by = c("Tag"))
CDsigBA2 <- inner_join(sig_CD, sig_BA, by = c("Tag"))
CDsigBD2 <- inner_join(sig_CD, sig_BD, by = c("Tag"))
CDsigCB2 <- inner_join(sig_CD, sig_CB, by = c("Tag"))
CDsigCE2 <- inner_join(sig_CD, sig_CE, by = c("Tag"))
CDsigFA2 <- inner_join(sig_CD, sig_FA, by = c("Tag"))
CDsigFE2 <- inner_join(sig_CD, sig_FE, by = c("Tag"))


#####FA  Finds all significant SNPs that were significant in other families
FAsigAB2 <- inner_join(sig_FA, sig_AB, by = c("Tag"))
FAsigAC2 <- inner_join(sig_FA, sig_AC, by = c("Tag"))
FAsigAF2 <- inner_join(sig_FA, sig_AF, by = c("Tag"))
FAsigBA2 <- inner_join(sig_FA, sig_BA, by = c("Tag"))
FAsigBD2 <- inner_join(sig_FA, sig_BD, by = c("Tag"))
FAsigCB2 <- inner_join(sig_FA, sig_CB, by = c("Tag"))
FAsigCE2 <- inner_join(sig_FA, sig_CE, by = c("Tag"))
FAsigCD2 <- inner_join(sig_FA, sig_CD, by = c("Tag"))
FAsigFE2 <- inner_join(sig_FA, sig_FE, by = c("Tag"))


#####CE  Finds all significant SNPs that were significant in other families
CEsigAB2 <- inner_join(sig_CE, sig_AB, by = c("Tag"))
CEsigAC2 <- inner_join(sig_CE, sig_AC, by = c("Tag"))
CEsigAF2 <- inner_join(sig_CE, sig_AF, by = c("Tag"))
CEsigBA2 <- inner_join(sig_CE, sig_BA, by = c("Tag"))
CEsigBD2 <- inner_join(sig_CE, sig_BD, by = c("Tag"))
CEsigCB2 <- inner_join(sig_CE, sig_CB, by = c("Tag"))
CEsigFA2 <- inner_join(sig_CE, sig_FA, by = c("Tag"))
CEsigCD2 <- inner_join(sig_CE, sig_CD, by = c("Tag"))
CEsigFE2 <- inner_join(sig_CE, sig_FE, by = c("Tag"))


#####FE  Finds all significant SNPs that were significant in other families
FEsigAB2 <- inner_join(sig_FE, sig_AB, by = c("Tag"))
FEsigAC2 <- inner_join(sig_FE, sig_AC, by = c("Tag"))
FEsigAF2 <- inner_join(sig_FE, sig_AF, by = c("Tag"))
FEsigBA2 <- inner_join(sig_FE, sig_BA, by = c("Tag"))
FEsigBD2 <- inner_join(sig_FE, sig_BD, by = c("Tag"))
FEsigCB2 <- inner_join(sig_FE, sig_CB, by = c("Tag"))
FEsigFA2 <- inner_join(sig_FE, sig_FA, by = c("Tag"))
FEsigCD2 <- inner_join(sig_FE, sig_CD, by = c("Tag"))
FEsigCE2 <- inner_join(sig_FE, sig_CE, by = c("Tag"))


###### Makes a Figure
ggplot(SigInSigPerFam, aes(x=Sig, y=PercentNotGenotyped, fill=Sig2)) + geom_bar(position = "dodge", stat = "identity") + scale_fill_brewer(palette = "RdYlBu") + ylab("Percent of Significant SNPs Not Genotyped") + xlab("Family Name")

#####AB  Finds all significant SNPs that were significant at lower coverage thresholds in other families
ABsigFE50 <- inner_join(sig_AB, sig_FE50, by = c("Tag"))
ABsigAC50 <- inner_join(sig_AB, sig_AC50, by = c("Tag"))
ABsigAF50 <- inner_join(sig_AB, sig_AF50, by = c("Tag"))
ABsigBA50 <- inner_join(sig_AB, sig_BA50, by = c("Tag"))
ABsigBA60 <- inner_join(sig_AB, sig_BA60, by = c("Tag"))
ABsigBD70 <- inner_join(sig_AB, sig_BD70, by = c("Tag"))
ABsigCB50 <- inner_join(sig_AB, sig_CB50, by = c("Tag"))
ABsigCD50 <- inner_join(sig_AB, sig_CD50, by = c("Tag"))
ABsigCE50 <- inner_join(sig_AB, sig_CE50, by = c("Tag"))
ABsigFA50 <- inner_join(sig_AB, sig_FA50, by = c("Tag"))


#####AC  Finds all significant SNPs that were significant at lower coverage thresholds in other families
ACsigAB50 <- inner_join(sig_AC, sig_AB50, by = c("Tag"))
ACsigAF50 <- inner_join(sig_AC, sig_AF50, by = c("Tag"))
ACsigBA50 <- inner_join(sig_AC, sig_BA50, by = c("Tag"))
ACsigBA60 <- inner_join(sig_AC, sig_BA60, by = c("Tag"))
ACsigBD70 <- inner_join(sig_AC, sig_BD70, by = c("Tag"))
ACsigCB50 <- inner_join(sig_AC, sig_CB50, by = c("Tag"))
ACsigCD50 <- inner_join(sig_AC, sig_CD50, by = c("Tag"))
ACsigCE50 <- inner_join(sig_AC, sig_CE50, by = c("Tag"))
ACsigFA50 <- inner_join(sig_AC, sig_FA50, by = c("Tag"))
ACsigFE50 <- inner_join(sig_AC, sig_FE50, by = c("Tag"))


#####AF  Finds all significant SNPs that were significant at lower coverage thresholds in other families
AFsigAB50 <- inner_join(sig_AF, sig_AB50, by = c("Tag"))
AFsigAC50 <- inner_join(sig_AF, sig_AC50, by = c("Tag"))
AFsigBA50 <- inner_join(sig_AF, sig_BA50, by = c("Tag"))
AFsigBA60 <- inner_join(sig_AF, sig_BA60, by = c("Tag"))
AFsigBD70 <- inner_join(sig_AF, sig_BD70, by = c("Tag"))
AFsigCB50 <- inner_join(sig_AF, sig_CB50, by = c("Tag"))
AFsigCD50 <- inner_join(sig_AF, sig_CD50, by = c("Tag"))
AFsigCE50 <- inner_join(sig_AF, sig_CE50, by = c("Tag"))
AFsigFA50 <- inner_join(sig_AF, sig_FA50, by = c("Tag"))
AFsigFE50 <- inner_join(sig_AF, sig_FE50, by = c("Tag"))


#####BA  Finds all significant SNPs that were significant at lower coverage thresholds in other families
BAsigAB50 <- inner_join(sig_BA, sig_AB50, by = c("Tag"))
BAsigAC50 <- inner_join(sig_BA, sig_AC50, by = c("Tag"))
BAsigAF50 <- inner_join(sig_BA, sig_AF50, by = c("Tag"))
BAsigBD70 <- inner_join(sig_BA, sig_BD70, by = c("Tag"))
BAsigCB50 <- inner_join(sig_BA, sig_CB50, by = c("Tag"))
BAsigCD50 <- inner_join(sig_BA, sig_CD50, by = c("Tag"))
BAsigCE50 <- inner_join(sig_BA, sig_CE50, by = c("Tag"))
BAsigFA50 <- inner_join(sig_BA, sig_FA50, by = c("Tag"))
BAsigFE50 <- inner_join(sig_BA, sig_FE50, by = c("Tag"))


#####BD  Finds all significant SNPs that were significant at lower coverage thresholds in other families
BDsigAB50 <- inner_join(sig_BD, sig_AB50, by = c("Tag"))
BDsigAC50 <- inner_join(sig_BD, sig_AC50, by = c("Tag"))
BDsigAF50 <- inner_join(sig_BD, sig_AF50, by = c("Tag"))
BDsigBA50 <- inner_join(sig_BD, sig_BA50, by = c("Tag"))
BDsigBA60 <- inner_join(sig_BD, sig_BA60, by = c("Tag"))
BDsigCB50 <- inner_join(sig_BD, sig_CB50, by = c("Tag"))
BDsigCD50 <- inner_join(sig_BD, sig_CD50, by = c("Tag"))
BDsigCE50 <- inner_join(sig_BD, sig_CE50, by = c("Tag"))
BDsigFA50 <- inner_join(sig_BD, sig_FA50, by = c("Tag"))
BDsigFE50 <- inner_join(sig_BD, sig_FE50, by = c("Tag"))


#####CB  Finds all significant SNPs that were significant at lower coverage thresholds in other families
CBsigAB50 <- inner_join(sig_CB, sig_AB50, by = c("Tag"))
CBsigAC50 <- inner_join(sig_CB, sig_AC50, by = c("Tag"))
CBsigAF50 <- inner_join(sig_CB, sig_AF50, by = c("Tag"))
CBsigBA50 <- inner_join(sig_CB, sig_BA50, by = c("Tag"))
CBsigBA60 <- inner_join(sig_CB, sig_BA60, by = c("Tag"))
CBsigBD70 <- inner_join(sig_CB, sig_BD70, by = c("Tag"))
CBsigCD50 <- inner_join(sig_CB, sig_CD50, by = c("Tag"))
CBsigCE50 <- inner_join(sig_CB, sig_CE50, by = c("Tag"))
CBsigFA50 <- inner_join(sig_CB, sig_FA50, by = c("Tag"))
CBsigFE50 <- inner_join(sig_CB, sig_FE50, by = c("Tag"))


#####CD  Finds all significant SNPs that were significant at lower coverage thresholds in other families
CDsigAB50 <- inner_join(sig_CD, sig_AB50, by = c("Tag"))
CDsigAC50 <- inner_join(sig_CD, sig_AC50, by = c("Tag"))
CDsigAF50 <- inner_join(sig_CD, sig_AF50, by = c("Tag"))
CDsigBA50 <- inner_join(sig_CD, sig_BA50, by = c("Tag"))
CDsigBA60 <- inner_join(sig_CD, sig_BA60, by = c("Tag"))
CDsigBD70 <- inner_join(sig_CD, sig_BD70, by = c("Tag"))
CDsigCB50 <- inner_join(sig_CD, sig_CB50, by = c("Tag"))
CDsigCE50 <- inner_join(sig_CD, sig_CE50, by = c("Tag"))
CDsigFA50 <- inner_join(sig_CD, sig_FA50, by = c("Tag"))
CDsigFE50 <- inner_join(sig_CD, sig_FE50, by = c("Tag"))


#####FA  Finds all significant SNPs that were significant at lower coverage thresholds in other families
FAsigAB50 <- inner_join(sig_FA, sig_AB50, by = c("Tag"))
FAsigAC50 <- inner_join(sig_FA, sig_AC50, by = c("Tag"))
FAsigAF50 <- inner_join(sig_FA, sig_AF50, by = c("Tag"))
FAsigBA50 <- inner_join(sig_FA, sig_BA50, by = c("Tag"))
FAsigBA60 <- inner_join(sig_FA, sig_BA60, by = c("Tag"))
FAsigBD70 <- inner_join(sig_FA, sig_BD70, by = c("Tag"))
FAsigCB50 <- inner_join(sig_FA, sig_CB50, by = c("Tag"))
FAsigCE50 <- inner_join(sig_FA, sig_CE50, by = c("Tag"))
FAsigCD50 <- inner_join(sig_FA, sig_CD50, by = c("Tag"))
FAsigFE50 <- inner_join(sig_FA, sig_FE50, by = c("Tag"))


#####CE  Finds all significant SNPs that were significant at lower coverage thresholds in other families
CEsigAB50 <- inner_join(sig_CE, sig_AB50, by = c("Tag"))
CEsigAC50 <- inner_join(sig_CE, sig_AC50, by = c("Tag"))
CEsigAF50 <- inner_join(sig_CE, sig_AF50, by = c("Tag"))
CEsigBA50 <- inner_join(sig_CE, sig_BA50, by = c("Tag"))
CEsigBA60 <- inner_join(sig_CE, sig_BA60, by = c("Tag"))
CEsigBD70 <- inner_join(sig_CE, sig_BD70, by = c("Tag"))
CEsigCB50 <- inner_join(sig_CE, sig_CB50, by = c("Tag"))
CEsigFA50 <- inner_join(sig_CE, sig_FA50, by = c("Tag"))
CEsigCD50 <- inner_join(sig_CE, sig_CD50, by = c("Tag"))
CEsigFE50 <- inner_join(sig_CE, sig_FE50, by = c("Tag"))


#####FE  Finds all significant SNPs that were significant at lower coverage thresholds in other families
FEsigAB50 <- inner_join(sig_FE, sig_AB50, by = c("Tag"))
FEsigAC50 <- inner_join(sig_FE, sig_AC50, by = c("Tag"))
FEsigAF50 <- inner_join(sig_FE, sig_AF50, by = c("Tag"))
FEsigBA50 <- inner_join(sig_FE, sig_BA50, by = c("Tag"))
FEsigBA60 <- inner_join(sig_FE, sig_BA60, by = c("Tag"))
FEsigBD70 <- inner_join(sig_FE, sig_BD70, by = c("Tag"))
FEsigCB50 <- inner_join(sig_FE, sig_CB50, by = c("Tag"))
FEsigFA50 <- inner_join(sig_FE, sig_FA50, by = c("Tag"))
FEsigCD50 <- inner_join(sig_FE, sig_CD50, by = c("Tag"))
FEsigCE50 <- inner_join(sig_FE, sig_CE50, by = c("Tag"))

