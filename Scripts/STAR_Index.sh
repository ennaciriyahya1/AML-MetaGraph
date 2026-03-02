#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

Dirname="/home/z5752982/STAR-aligner/"

STAR \
  --runThreadN 16 \
  --runMode genomeGenerate \
  --genomeDir ${Dirname}/Index-Creation \
  --genomeFastaFiles ${Dirname}/GTF-FASTA/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa \
  --sjdbGTFfile ${Dirname}/GTF-FASTA/Homo_sapiens.GRCh38.115.gtf \
  --sjdbOverhang 124
