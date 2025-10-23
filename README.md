# RNA-Seq Pipeline

A reproducible workflow for RNA-Seq analysis, from raw FASTQ reads to differential gene expression and pathway interpretation.
This pipeline was developed as part of my ongoing work in transcriptomic data analysis.  
It integrates commonly used bioinformatics tools into a clean and modular structure, making the analysis steps transparent and easy to reproduce.


### Workflow Overview
**FASTQ → QC → Alignment → Count Matrix → DEGs → Pathway Analysis**
- **QC:** fastp for adapter trimming and quality filtering  
- **Alignment:** STAR for genome mapping  
- **Quantification:** featureCounts for gene level counting  
- **Differential Expression:** DESeq2 for identifying DE genes  

### Requirements
> 🖥️ This workflow was tested and optimized on a Linux environment (Ubuntu 22.04 LTS) with Conda for dependency management.
The environment can be created with:
```bash
conda env create -f environment.yml
conda activate rnaseq

## Main dependencies include:
Python 3.10
Snakemake
fastp
STAR
featureCounts (Subread)
R + DESeq2

## Run the Workflow, Once the configuration files are set:
snakemake -j 8 --use-conda

## Results will be generated under:
results/
├── qc/
├── align/
├── counts/
└── deg/

## Example Configuration
config/samples.csv
sample_id,condition,fastq_1,fastq_2
S1,treated,data/fastq/S1_R1.fastq.gz,data/fastq/S1_R2.fastq.gz
S2,treated,data/fastq/S2_R1.fastq.gz,data/fastq/S2_R2.fastq.gz
C1,control,data/fastq/C1_R1.fastq.gz,data/fastq/C1_R2.fastq.gz
C2,control,data/fastq/C2_R1.fastq.gz,data/fastq/C2_R2.fastq.gz

config/params.yaml
threads: 8
aligner: STAR
genomeDir: "/data/genomes/hg38_star_index"
annotation_gtf: "/data/genomes/gencode.v46.annotation.gtf"

## Output
QC reports: results/qc/*.html
Aligned BAM files: results/align/*.bam
Count table: results/counts/gene_counts.tsv
DEG results: results/deg/deseq2_results.csv

## Citation
If this workflow was useful in your research, please cite it as:
RNA-Seq Pipeline, version 1.0 (2025)
Developed by Tina Tofighi Fard

## License
Free to use, modify, and share for research purposes.

#RNASeq #Bioinformatics #Genomics #Transcriptomics
