SAMPLES = [l.split(',')[0] for l in open('config/samples.csv').read().splitlines()[1:]]

rule all:
    input:
        expand("results/deg/{s}_done.txt", s=SAMPLES)

include: "rules/qc.smk"
include: "rules/align.smk"
include: "rules/count.smk"
include: "rules/deg.smk"
