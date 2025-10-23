rule featurecounts:
    input:
        expand("results/align/{s}.bam", s=SAMPLES)
    output:
        counts="results/counts/gene_counts.tsv"
    params:
        gtf="/data/genomes/gencode.v46.annotation.gtf"
    threads: 8
    shell:
        "featureCounts -T {threads} -a {params.gtf} -o {output.counts} {input}"
