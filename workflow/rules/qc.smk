rule fastp:
    input:
        r1=lambda wc: f"data/fastq/{wc.s}_R1.fastq.gz",
        r2=lambda wc: f"data/fastq/{wc.s}_R2.fastq.gz"
    output:
        html="results/qc/{s}_fastp.html",
        json="results/qc/{s}_fastp.json"
    threads: 4
    shell:
        "fastp -i {input.r1} -I {input.r2} -h {output.html} -j {output.json}"
