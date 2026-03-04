#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

cd /scratch/zq45/yn0830/AML_RNA_BAM/fastq_output

mkdir -p FASTQC

fastqc -t 16 -o FASTQC *.fastq.gz
