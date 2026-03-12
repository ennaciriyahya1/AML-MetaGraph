#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

dirpath="/scratch/zq45/yn0830/AML_RNA_BAM/fastq_output"

cd ${dirpath}

mkdir -p FASTQC
#Runs a Quality control on fastq files
#Important after BAM to Fastq step because it allows to discard poor quality samples
fastqc -t 16 -o FASTQC *.fastq.gz
