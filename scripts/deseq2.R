#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
counts <- args[1]
samples <- args[2]

library(DESeq2)
library(tidyverse)

cts <- read.delim(counts, comment.char="#", row.names=1)
coldata <- read.csv(samples, row.names=1)
dds <- DESeqDataSetFromMatrix(countData = cts, colData = coldata, design = ~ condition)
dds <- DESeq(dds)
res <- results(dds)
write.csv(as.data.frame(res), file="results/deg/deseq2_results.csv")
