#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

module load multiqc

cd /scratch/zq45/yn0830/AML_RNA_BAM/fastq_output

mkdir -p MULTIQC

#Basically merges all the FASTQC files into a single html
multiqc FASTQC -o MULTIQC
