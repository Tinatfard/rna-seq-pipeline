rule deseq2:
    input:
        counts="results/counts/gene_counts.tsv",
        samples="config/samples.csv"
    output:
        touch("results/deg/{s}_done.txt")
    shell:
        "Rscript scripts/deseq2.R {input.counts} {input.samples}"
