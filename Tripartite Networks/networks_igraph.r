#load package

require(readr)
require(dplyr)
require(igraph)
require(tidygraph)
require(ggraph)
require(ggplot2)

setwd("~/Documentos/Proyecto/Nuevos datos/NUEVAS REDES")

#===============================Basal===========================================#
# Load data
basal_data <- read_csv("conjuntos_basal.csv")

#información de basal 

miRNAs <- basal_data$miRNA
miRNAs <- unique(miRNAs)
#miRNAs_basal: 295 

Genes <- basal_data$Gene
Genes <- unique(Genes)
#Genes_basal: 348

farmacos <- basal_data$Drug
farmacos <- unique(farmacos)
#Genes_basal: 348


#Generate bipartite networks
mir_gene <- cbind(basal_data[,2], basal_data[,1])
gene_drug <- cbind(basal_data[,1], basal_data[,3])


# Remove duplicate values
gene_drug <- unique(gene_drug)
mir_gene<-unique(mir_gene)

#Create an igraph object
g1 <- graph_from_data_frame(d = mir_gene, directed = TRUE,
                            vertices = NULL)
g2 <- graph_from_data_frame(d = gene_drug, directed = TRUE,
                            vertices = NULL)

# Generate a tripartite network
g3 = g1 + g2
as_tbl_graph(g3)
g3

write_graph(g1, "miR_gene_basal.graphml", "graphml")
write_graph(g2, "gene_drug_basal.graphml", "graphml")
write_graph(g3, "tripartite_basal.graphml", "graphml")


#===============================Her2===========================================#
# Load data
basal_data <- read_csv("conjuntos_her2.csv")

#información de her2 

miRNAs <- basal_data$miRNA
miRNAs <- unique(miRNAs)
#miRNAs_her2: 293 

Genes <- basal_data$Gene
Genes <- unique(Genes)
#Genes_basal: 337

farmacos <- basal_data$Drug
farmacos <- unique(farmacos)
#farmaco_basal: 164



#Generate bipartite networks
mir_gene <- cbind(basal_data[,2], basal_data[,1])
gene_drug <- cbind(basal_data[,1], basal_data[,3])


# Remove duplicate values
gene_drug <- unique(gene_drug)
mir_gene<-unique(mir_gene)

#Create an igraph object
g1 <- graph_from_data_frame(d = mir_gene, directed = TRUE,
                            vertices = NULL)
g2 <- graph_from_data_frame(d = gene_drug, directed = TRUE,
                            vertices = NULL)

# Generate a tripartite network
g3 = g1 + g2
as_tbl_graph(g3)
g3

write_graph(g1, "miR_gene_her2.graphml", "graphml")
write_graph(g2, "gene_drug_her2.graphml", "graphml")
write_graph(g3, "tripartite_her2.graphml", "graphml")


#===============================Luminal A===========================================#
# Load data
basal_data <- read_csv("conjuntos_luma.csv")

#información de basal 

miRNAs <- basal_data$miRNA
miRNAs <- unique(miRNAs)
#miRNAs_basal: 262 

Genes <- basal_data$Gene
Genes <- unique(Genes)
#Genes_basal: 348

farmacos <- basal_data$Drug
farmacos <- unique(farmacos)
#Genes_basal: 218


#Generate bipartite networks
mir_gene <- cbind(basal_data[,2], basal_data[,1])
gene_drug <- cbind(basal_data[,1], basal_data[,3])


# Remove duplicate values
gene_drug <- unique(gene_drug)
mir_gene<-unique(mir_gene)

#Create an igraph object
g1 <- graph_from_data_frame(d = mir_gene, directed = TRUE,
                            vertices = NULL)
g2 <- graph_from_data_frame(d = gene_drug, directed = TRUE,
                            vertices = NULL)

# Generate a tripartite network
g3 = g1 + g2
as_tbl_graph(g3)
g3

write_graph(g1, "miR_gene_luma.graphml", "graphml")
write_graph(g2, "gene_drug_luma.graphml", "graphml")
write_graph(g3, "tripartite_luma.graphml", "graphml")


#===============================Luminal B===========================================#
# Load data
basal_data <- read_csv("conjuntos_lumb.csv")

#información de basal 

miRNAs <- basal_data$miRNA
miRNAs <- unique(miRNAs)
#miRNAs_basal: 332 

Genes <- basal_data$Gene
Genes <- unique(Genes)
#Genes_basal: 357

farmacos <- basal_data$Drug
farmacos <- unique(farmacos)
#Genes_basal: 218

#información de basal 

miRNAs <- basal_data$miRNA
miRNAs <- unique(miRNAs)
#miRNAs_basal: 262 

Genes <- basal_data$Gene
Genes <- unique(Genes)
#Genes_basal: 348

farmacos <- basal_data$Drug
farmacos <- unique(farmacos)
#Genes_basal: 218


#Generate bipartite networks
mir_gene <- cbind(basal_data[,2], basal_data[,1])
gene_drug <- cbind(basal_data[,1], basal_data[,3])


# Remove duplicate values
gene_drug <- unique(gene_drug)
mir_gene<-unique(mir_gene)

#Create an igraph object
g1 <- graph_from_data_frame(d = mir_gene, directed = TRUE,
                            vertices = NULL)
g2 <- graph_from_data_frame(d = gene_drug, directed = TRUE,
                            vertices = NULL)

# Generate a tripartite network
g3 = g1 + g2
as_tbl_graph(g3)
g3

write_graph(g1, "miR_gene_lumb.graphml", "graphml")
write_graph(g2, "gene_drug_lumb.graphml", "graphml")
write_graph(g3, "tripartite_lumb.graphml", "graphml")
