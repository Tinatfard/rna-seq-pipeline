```markdown
# RNA-Seq Pipeline

A reproducible Snakemake workflow for RNA-Seq analysis, from raw FASTQ reads to differential gene expression and pathway interpretation.

This pipeline integrates fastp, STAR, featureCounts and DESeq2 in a modular, configurable workflow so analyses are transparent and reproducible.

Badges
- (add CI / license / DOI / conda badges here)

Workflow overview
FASTQ → QC → Alignment → Count matrix → Differential expression → Pathway analysis

- QC: fastp for adapter trimming and quality filtering  
- Alignment: STAR for genome mapping  
- Quantification: featureCounts (Subread) for gene-level counting  
- Differential expression: DESeq2 (R/Bioconductor)

Requirements
This workflow was tested on Ubuntu 22.04 LTS. We recommend using Conda or a container for reproducibility.

Minimum software (examples managed via environment.yml):
- Python 3.10
- Snakemake (pinned in environment.yml)
- fastp
- STAR
- Subread (featureCounts)
- R (>=4.0) with DESeq2

Quick start (recommended)
1. Clone repo
   git clone https://github.com/Tinatfard/rna-seq-pipeline.git
   cd rna-seq-pipeline

2. Create environment
   conda env create -f environment.yml
   conda activate rnaseq

3. Configure inputs
   - Edit config/samples.csv (see example below)
   - Edit config/params.yaml for threads, aligner, genomeDir, annotation_gtf, etc.
   - Ensure genome FASTA/GTF and STAR index are available. If you need to build a STAR index, see "Building indexes" below.

4. Dry-run to see planned jobs
   snakemake -n --use-conda

5. Run the workflow
   snakemake -j 8 --use-conda

Input structure / config
- config/samples.csv (required)
  sample_id,condition,fastq_1,fastq_2
  S1,treated,data/fastq/S1_R1.fastq.gz,data/fastq/S1_R2.fastq.gz
  S2,treated,data/fastq/S2_R1.fastq.gz,data/fastq/S2_R2.fastq.gz
  C1,control,data/fastq/C1_R1.fastq.gz,data/fastq/C1_R2.fastq.gz

- config/params.yaml (example)
  threads: 8
  aligner: STAR
  genomeDir: "/data/genomes/hg38_star_index"
  annotation_gtf: "/data/genomes/gencode.v46.annotation.gtf"

Recommended reference files
- Genome FASTA (e.g., GRCh38 primary assembly)
- GTF annotation (e.g., GENCODE v46)
- STAR genome index (provide path in params.yaml or build using STAR --runMode genomeGenerate)

Outputs
Results are placed under results/ by default:
results/
├── qc/                 (fastp reports and trimmed fastq)
├── align/              (*.bam, mapping logs)
├── counts/             (gene_counts.tsv)
└── deg/                (DESeq2 results and plots)

Examples of outputs:
- QC reports: results/qc/*.html
- Aligned BAM files: results/align/*.bam
- Count table: results/counts/gene_counts.tsv
- DEG results: results/deg/deseq2_results.csv

Reproducibility / containers
- environment.yml included for Conda-based reproducibility.
- Optional: provide Dockerfile or Singularity recipe for containerized runs.

Testing
A minimal test is provided under tests/. To run the test (no heavy tools required):
snakemake -s tests/Snakefile --cores 1 test

This runs a tiny smoke test that verifies the repository structure and config parsing.

Citation
If this workflow was useful, please cite:
RNA-Seq Pipeline, version 1.0 (2025)
Developed by Tina Tofighi Fard

License
This repository is released under the MIT License. See LICENSE file for details.

Contact / Maintainer
Tina Tofighi Fard — tinatfard99@gmail.com

Changelog
- v1.0 (2025): initial release
```
