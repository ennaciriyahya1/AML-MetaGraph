#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

cd /scratch/zq45/yn0830/AML_RNA_BAM

mkdir -p fastq_output

for bam in *.bam
do
    sample=$(basename "$bam" .bam)

    samtools fastq -@ 8 \
        -1 fastq_output/${sample}_R1.fastq.gz \
        -2 fastq_output/${sample}_R2.fastq.gz \
        -0 /dev/null -s /dev/null -n \
        "$bam"
done
