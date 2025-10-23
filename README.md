# RNA-Seq Pipeline

A reproducible workflow for RNA-Seq analysis, from raw FASTQ reads to differential gene expression and pathway interpretation.

# RNA-Seq Pipeline

A reproducible workflow for RNA-Seq analysis — from raw FASTQ reads to differential gene expression and pathway interpretation.

This pipeline was developed as part of my ongoing work in transcriptomic data analysis.  
It integrates commonly used bioinformatics tools into a clean and modular structure, making the analysis steps transparent and easy to reproduce.


### Workflow Overview
**FASTQ → QC → Alignment → Count Matrix → DEGs → Pathway Analysis**

Each step refines the data from raw sequencing reads to meaningful biological insights:

- **QC:** fastp for adapter trimming and quality filtering  
- **Alignment:** STAR for genome mapping  
- **Quantification:** featureCounts for gene level counting  
- **Differential Expression:** DESeq2 for identifying DE genes  

### Requirements
The environment can be created with:
```bash
conda env create -f environment.yml
conda activate rnaseq

### Run the Workflow
Once the configuration files are set:
snakemake -j 8 --use-conda

### Results

results/
├── qc/
├── align/
├── counts/
└── deg/

Developed as part of my bioinformatics research to automate transcriptomic data analysis.

#RNASeq #Bioinformatics #Genomics #Transcriptomics
