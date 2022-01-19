library(tidyverse)
library(dplyr)

#print(getwd())
#dir <- r"{.\OregonStateUniversity\Coral_Projects\GreatBarrierReef\Pdae_Project\AF_Paper\ResponseToEditors\TranscriptToSNP}"
dir <- "C:/Users/User/OneDrive/Documents/OregonStateUniversity/Coral_Projects/GreatBarrierReef/Pdae_Project/AF_Paper/ResponseToEditors/TranscriptToSNP"
setwd(dir)

#import the tag to transcript map
# in this case I used transcripttotag20.23.tab.xlsx
# then import all files of the XX_sig.tab format. These files have the Cross name, Tag Name, and p-value

# must match the Tags to add the transcript and then you have an inner join
ABtagtotrsc.tab <- inner_join(AB_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
ABtrsctoanot.tab <- inner_join(ABtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(ABtrsctoanot.tab, file = "ABTagTrscAnot.csv")

# must match the Tags to add the transcript and then you have an inner join
AFtagtotrsc.tab <- inner_join(AF_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
AFtrsctoanot.tab <- inner_join(AFtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(AFtrsctoanot.tab, file = "AFTagTrscAnot.csv")

# must match the Tags to add the transcript and then you have an inner join
BAtagtotrsc.tab <- inner_join(BA_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
BAtrsctoanot.tab <- inner_join(BAtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(BAtrsctoanot.tab, file = "BATagTrscAnot.csv")

# must match the Tags to add the transcript and then you have an inner join
BCtagtotrsc.tab <- inner_join(BC_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
BCtrsctoanot.tab <- inner_join(BCtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(BCtrsctoanot.tab, file = "BCTagTrscAnot.csv")

# must match the Tags to add the transcript and then you have an inner join
CAtagtotrsc.tab <- inner_join(CA_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
CAtrsctoanot.tab <- inner_join(CAtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(CAtrsctoanot.tab, file = "CATagTrscAnot.csv")

# must match the Tags to add the transcript and then you have an inner join
DBtagtotrsc.tab <- inner_join(DB_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
DBtrsctoanot.tab <- inner_join(DBtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(DBtrsctoanot.tab, file = "DBTagTrscAnot.csv")

# must match the Tags to add the transcript and then you have an inner join
DCtagtotrsc.tab <- inner_join(DC_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
DCtrsctoanot.tab <- inner_join(DCtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(DCtrsctoanot.tab, file = "DCTagTrscAnot.csv")

# must match the Tags to add the transcript and then you have an inner join
ECtagtotrsc.tab <- inner_join(EC_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
ECtrsctoanot.tab <- inner_join(ECtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(ECtrsctoanot.tab, file = "ECTagTrscAnot.csv")

# must match the Tags to add the transcript and then you have an inner join
EFtagtotrsc.tab <- inner_join(EF_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
EFtrsctoanot.tab <- inner_join(EFtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(EFtrsctoanot.tab, file = "EFTagTrscAnot.csv")

# must match the Tags to add the transcript and then you have an inner join
FAtagtotrsc.tab <- inner_join(FA_sig_tab, transcripttotag20_23_sam, by = c("Tag"))
# must match the Transcripts to get annotation
FAtrsctoanot.tab <- inner_join(FAtagtotrsc.tab, Table_GOannot, by = c("Transcript"))
#write to .csv
write.csv(FAtrsctoanot.tab, file = "FATagTrscAnot.csv")

#Use these to build a supplementary table for the manuscript All_TagTrscAnot_TableforManu.xlsx



#imports annot.tab files and changes column names and adds family 
annot_tabs <- list.files(pattern = r"{\w+_annot.tab}")
# no headings, need to assign
for (tab in annot_tabs) {
  # extract first two characters
  family <- substr(tab, 1, 2)
  table <- read_tsv(tab, col_names = c("hi", "x", "y",  "go")) %>%
    # add family column to table, automatically fills/repeats
    add_column(family)
  
  # add to the environment
  assign(tab, table)
}

# starting with the first, bind all annot tables together
all_annot <- get(annot_tabs[1])
# -1 is skip first item
for (tab in annot_tabs[-1]) {
  table <- get(tab)
  all_annot <- bind_rows(all_annot, table)
}

# imports tscr.tab files and names the columns
tscr_tabs <- list.files(pattern = r"{\w+_tscr.tab}")
# no headings, need to assign
for (tab in tscr_tabs) {
  # extract first two characters
  table <- read_tsv(tab, col_names = c("Tag", "Transname"))
  
  # add to the environment
  assign(tab, table)
}

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPAB <- inner_join(AB_tscr.tab, sig_AB, by = c("Tag"))
  #mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPAB <- select(TransToPAB, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPAB, file = "TransToPBA.csv") 

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPAC <- inner_join(AC_tscr.tab, sig_AC, by = c("Tag"))
#mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPAC <- select(TransToPAC, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPAC, file = "TransToPCA.csv") 

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPAF <- inner_join(AF_tscr.tab, sig_AF, by = c("Tag"))
#mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPAF <- select(TransToPAF, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPAF, file = "TransToPFA.csv")

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPBA <- inner_join(BA_tscr.tab, sig_BA, by = c("Tag"))
#mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPBA <- select(TransToPBA, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPBA, file = "TransToPAB.csv")

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPBD <- inner_join(BD_tscr.tab, sig_BD, by = c("Tag"))
#mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPBD <- select(TransToPBD, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPBD, file = "TransToPDB.csv")

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPCB <- inner_join(CB_tscr.tab, sig_CB, by = c("Tag"))
#mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPCB <- select(TransToPCB, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPCB, file = "TransToPBC.csv")

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPCD <- inner_join(CD_tscr.tab, sig_CD, by = c("Tag"))
#mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPCD <- select(TransToPCD, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPCD, file = "TransToPDC.csv")

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPCE <- inner_join(CE_tscr.tab, sig_CE, by = c("Tag"))
#mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPCE <- select(TransToPCE, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPCE, file = "TransToPEC.csv")

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPFA <- inner_join(FA_tscr.tab, sig_FA, by = c("Tag"))
#mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPFA <- select(TransToPFA, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPFA, file = "TransToPAF.csv")

# join to get adjusted p-value with the transcript name using sig_XX and tscr.tab files
TransToPFE <- inner_join(FE_tscr.tab, sig_FE, by = c("Tag"))
#mutate(LogAdjP = log(adjP)) takes the log of p-value
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPFE <- select(TransToPFE, Transname, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPFE, file = "TransToPEF.csv")



#import all the SNPs significant or not.


#Join adjP and all SNPs significant or not

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPAB_All <- inner_join(AB80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPAB_All23 <- select(TransToPAB_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPAB_All23, file = "TransToPBA_All23.csv") 

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPAC_All <- inner_join(AC80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPAC_All23 <- select(TransToPAC_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPAC_All23, file = "TransToPCA_All23.csv") 

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPAF_All <- inner_join(AF80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPAF_All23 <- select(TransToPAF_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPAF_All23, file = "TransToPFA_All23.csv")  

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPBA_All <- inner_join(BA80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPBA_All23 <- select(TransToPBA_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPBA_All23, file = "TransToPAB_All23.csv") 

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPBD_All <- inner_join(BD80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPBD_All23 <- select(TransToPBD_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPBD_All23, file = "TransToPDB_All23.csv") 

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPCB_All <- inner_join(CB80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPCB_All23 <- select(TransToPCB_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPCB_All23, file = "TransToPBC_All23.csv") 

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPCD_All <- inner_join(CD80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPCD_All23 <- select(TransToPCD_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPCD_All23, file = "TransToPDC_All23.csv") 

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPCE_All <- inner_join(CE80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPCE_All23 <- select(TransToPCE_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPCE_All23, file = "TransToPEC_All23.csv") 

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPFA_All <- inner_join(FA80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPFA_All23 <- select(TransToPFA_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPFA_All23, file = "TransToPAF_All23.csv") 

#join denovoSNP to transcript name for all 80X SNPs and p-value
TransToPFE_All <- inner_join(FE80_SNPs_Pval, transcripttotag20_23_sam, by = c("Tag"))
# selects two columns from the tibble frame that you have made, turns it into a real data frame so that you can change the format of the p-value to a number for GO_MWU
TransToPFE_All23 <- select(TransToPFE_All, Transcript, adjP) %>%
  as.data.frame() %>%
  format(scientific = FALSE)
# writes out a 
write_csv(TransToPFE_All23, file = "TransToPEF_All23.csv") 

# import tables of significant transcripts, the denovo to tag matches, and GO annotation table
DenovoTransP16_All <- inner_join(DenovoTransToP16_All, transcripttotagfilt16_tagandtranscript, by = c("Transcript"))
Table4Manuscript16 <- inner_join(DenovoTransP16_All, Table_GOannot, by = c("Transcript"))
write.csv(Table4Manuscript16, file = "Table4ManuscriptAll16.csv")


