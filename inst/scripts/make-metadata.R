### =========================================================================
### GSE103322 metadata 
### -------------------------------------------------------------------------
###

meta <- data.frame(
    Title = paste0("Sincle cell RNA-seq data for human head and neck squamous ",
                     "cell carcinoma"),
    Description = paste0("scRNA-Sequencing and metadata data for 5902 cells ",
                           " from 18 patients with oral cavity head and neck ",
                           "squamous cell carcinoma. Tumors were ",
                           "disaggregated, sorted into single cells, and ",
                           "profiled by Smart-seq2"),
    BiocVersion = "3.12",
    Genome = "hg19", 
    SourceType = "tar.gz", 
    SourceUrl = "http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE103322",
    SourceVersion = "Nov 30 2017",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "GEO",
    Maintainer = "Bioconductor Package Maintainer <maintainer@bioconductor.org>",
    RDataClass = "SingleCellExperiment",
    DispatchClass = "Rda",
    RDataPath = "GSE103322/GSE103322_tpm_entrezid.Rda",
    Tags = "",
    Notes = ""
)

write.csv(meta, file="inst/extdata/metadata.csv", row.names=FALSE)

