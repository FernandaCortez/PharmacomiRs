#load package 

require(TCGAbiolinks)
require(dplyr)
require(readr)

setwd("~/Documentos/Proyecto/Tablas_expresion")

#Load expression data 
RNA = read.table(file = 'RNAseqnormalized.tsv', 
                  sep = '\t', header = TRUE)
mirnas = read.table(file = 'miRNAseqNormi.tsv',
                    sep = '\t', header = TRUE)

#Load TCGA codes
subtypes = read.table(file = 'subtype.tsv', 
                      sep = '\t', header = TRUE)

subtypes$samples <- colnames(RNA)

#===============================================================

#Classification by subtype
lumB<- subset(subtypes, subtypes$subtype== "LumB") #140
lumA <- subset(subtypes, subtypes$subtype == "LumA") #416 
basal<- subset (subtypes, subtypes$subtype == "Basal") #128
her2 <- subset (subtypes, subtypes$subtype == "Her2") #46
normal<-subset (subtypes, subtypes$subtype == "Normal") # 75



#Generation of RNA-seq data sets
lumB_genes <- RNA[colnames(RNA) %in% lumB$samples ]
lumA_genes <- RNA[colnames(RNA) %in% lumA$samples ]
basal_genes <- RNA[colnames(RNA) %in% basal$samples ]
her2_genes <- RNA[colnames(RNA) %in% her2$samples ]
normal_genes <- RNA[colnames(RNA) %in% normal$samples ]


#Generation of miRNA-seq data sets
lumb_mir <- mirnas[colnames(mirnas) %in% lumB$samples ]
luma_mir <- mirnas[colnames(mirnas) %in% lumA$samples ]
basal_mir <- mirnas[colnames(mirnas) %in% basal$samples ]
her2_mir <- mirnas[colnames(mirnas) %in% her2$samples ]
normal_mir <- mirnas[colnames(mirnas) %in% normal$samples ]


#==========================================================

#Generation of miRNA-RNA expression tables for each subtype

#Luminal B
identical( colnames(lumb_mir), colnames(lumB_genes)) #TRUE 
exp_table_lumB<- rbind(lumB_genes, lumb_mir)

write.table(exp_table_lumB, file='exp_table_lumB.tsv',
            quote=FALSE, sep='\t', col.names = T)

#luminal A
luma_mir <- luma_mir[order(colnames(luma_mir))]
identical( colnames(lumA_genes), colnames(luma_mir)) #TRUE
exp_table_lumA<- rbind(lumA_genes, luma_mir)

write.table(exp_table_lumA, file='exp_table_lumA.tsv',
            quote=FALSE, sep='\t', col.names = T)

#Basal 
basal_genes <- basal_genes[order(colnames(basal_genes))]
basal_mir <- basal_mir[order(colnames(basal_mir))]
identical( colnames(basal_genes), colnames(basal_mir)) #TRUE
exp_table_basal<- rbind(basal_genes, basal_mir)

write.table(exp_table_basal, file='exp_table_basal.tsv', 
            quote=FALSE, sep='\t', col.names = T)


#Her2 
identical( colnames(her2_genes), colnames(her2_mir)) #TRUE
exp_table_her2<- rbind(her2_genes, her2_mir)

write.table(exp_table_her2, file='exp_table_her2.tsv', 
            quote=FALSE, sep='\t', col.names = T)



#Normal 
identical( colnames(normal_genes), colnames(normal_mir)) #TRUE
exp_table_normal<- rbind(normal_genes, normal_mir)
write.table(exp_table_normal, file='exp_table_normal.tsv',
            quote=FALSE, sep='\t', col.names = T)

