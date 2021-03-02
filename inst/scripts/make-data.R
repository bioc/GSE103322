### =========================================================================
### GSE103322 SingleCellExperiment
### -------------------------------------------------------------------------
###

## step 0 - download the data from TCGA.
library("GEOquery")
library("Biobase")
library(SingleCellExperiment)
suppl <- GEOquery::getGEOSuppFiles("GSE103322")

## step 1 - Read the data matrix
setwd("GSE103322")
raw <- strsplit(readLines("GSE103322_HNSCC_all_data.txt.gz"), "\t")
raw <- do.call(rbind, raw)

## step 2 - Preparing the metadata
metadata <- t(raw[2:6, ][, -1])
colnames(metadata) <- raw[2:6, 1]
rownames(metadata) <- raw[1, ][-1]
metadata <- as.data.frame(metadata)

## step 3 - Preparing the data
tpm <- matrix(as.numeric(raw[-seq_len(6), ][, -1]), nrow(raw)-6, ncol(raw)-1,
    dimnames=list(gsub("\'", "", raw[, 1][-seq_len(6)]), raw[1, ][-1]))

## Step 4 - Converting gene symbol to entrezID
library("org.Hs.eg.db")
eid <- AnnotationDbi::mapIds(org.Hs.eg.db, rownames(tpm), "ENTREZID", "SYMBOL")
eida <- AnnotationDbi::mapIds(org.Hs.eg.db, rownames(tpm), "ENTREZID", "ALIAS")

# Recovering missing matchis with aliases
pos <- which(is.na(eid) & !is.na(eida))
eid[pos] <- eida[pos]

# Renaming IDs and removing unknown IDs
rownames(tpm) <- eid
tpm <- tpm[!is.na(rownames(tpm)), ]

## step 5 -  Generating the SingleCellExperiment object
sce <- SingleCellExperiment(assays = list(TPM = tpm),
    colData = S4Vectors::DataFrame(metadata))
save(sce, file="GSE103322_tpm_entrezid.Rda")
