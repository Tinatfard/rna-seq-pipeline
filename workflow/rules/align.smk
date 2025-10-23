rule star_align:
    input:
        r1="data/fastq/{s}_R1.fastq.gz",
        r2="data/fastq/{s}_R2.fastq.gz"
    output:
        bam="results/align/{s}.bam"
    params:
        genome="/data/genomes/hg38_star_index"
    threads: 8
    shell:
        "STAR --runThreadN {threads} --genomeDir {params.genome} "
        "--readFilesIn {input.r1} {input.r2} --readFilesCommand zcat "
        "--outSAMtype BAM SortedByCoordinate --outFileNamePrefix results/align/{wildcards.s}_ && "
        "mv results/align/{wildcards.s}_Aligned.sortedByCoord.out.bam {output.bam}"
