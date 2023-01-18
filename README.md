# PharmacomiRs

# Introduction

This repository contains

# Generation of expression tables

These scripts contain the instructions for the generation of RNA-seq and miRNA-seq data expression matrices, for each breast cancer tumor subtype, for the inference of complex networks through mutual information using the ARACNe multicore algorithm.

Once the expression tables for each cancer subtype were generated, the mutual information values are inferred using the ARACNe-multicore algorithm, which is available in this repository: 

https://github.com/CSB-IG/ARACNE-multicore

Subsequently, the first 10k interactions (miRNA-gen) that have the highest mutual information value are chosen.




# Drug dictionary construction. 

The script contain the steps to generate a drug dictionary from the "SIDER 4.1"  and "PharmacomiR" databases.
https://github.com/FernandaCortez/PharmacomiRs/blob/main/301349504_5251530404938623_1974196948928212798_n.jpg

# Tripartite Network construction. 

Construction of tripartite networks for each tumor subtype of breast cancer. Pharmacological information is integrated into genetic regulation networks (miRNA-gene) inferred with mutual information. The association is based on Gene-Drug interactions previously reported in the "PharmacomiR" database.

# Topological analysis of networks. 

A network analysis is performed to find which is the miRNA associated with a greater number of drugs within each of the networks, for the generation of subgraphs.

