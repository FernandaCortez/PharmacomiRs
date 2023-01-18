#load packages

require(readr)
require(dbplyr)

setwd("~/Documentos/Proyecto/Nuevos datos/Diccionario de fármacos")

#load data 

drug_atc<- read.table(file = 'drug_atc.tsv', 
                      sep = '\t', header = F)

drug_names <- read.table(file = 'drug_names.tsv', 
                      sep = '\t', header = F)

colnames(drug_atc)[1] <- "CID"  
colnames(drug_atc)[2] <- "ATC"
colnames(drug_names)[1] <- "CID"  
colnames(drug_names)[2] <- "DRUG"


#Generate dictionary with ATC code and drug name

drugs <- merge(x=drug_atc , y=drug_names, by="CID" ) 
atc_code <- as.data.frame( substr(drugs$ATC, start = 1, stop = 3))
drugs_table <-cbind(drugs,atc_code)
drugs_table<- drugs_table[-2]
colnames(drugs_table)[3] <- "ATC"
drugs_table<- unique(drugs_table)

#Add ATC Hierarchy information 

ATC_hierarchy <- read.table(file = 'classification.txt', sep = '\t')
colnames(ATC_hierarchy)[1] <- "ATC"
colnames(ATC_hierarchy)[2] <- "Classification"

drug_dictionary <- merge(x= drugs_table ,  y= ATC_hierarchy , by= "ATC")


#Save table
write.table(drug_dictionary, file = "drug_dictionary(complete).csv",
            sep = "\t", row.names = F, col.names = TRUE)


##Identify drugs reported in the pharmacomiR database#

#load data with pharmacomiR database information (all information)

pharmacomiR <- read_delim("pharmacomiR.csv", 
     delim = "\t", escape_double = FALSE, 
     trim_ws = TRUE)

#write.table(pharmacomiR, file = "pharmacomiR.csv", sep = "\t", 
            row.names = F, col.names = TRUE)

pharmacomiR <- pharmacomiR[1:3]
colnames(drugs_table)[2] <- "Drug"

new_drugs <- drugs <- merge(x=drugs_table , y=pharmacomiR, by="Drug" )
new_drugs <- unique(new_drugs)


write.table(new_drugs, file = "new_drugs_list.csv", sep = "\t", 
            row.names = F, col.names = TRUE)


