#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

Dirname="/scratch/zq45/yn0830/Utilitaries"

#Index construction before alignement
STAR \
  --runThreadN 32 \
  --runMode genomeGenerate \
  --genomeDir ${Dirname}/STAR_Index \
  --genomeFastaFiles ${Dirname}/GTF-FASTA/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa \
  --sjdbGTFfile ${Dirname}/GTF-FASTA/Homo_sapiens.GRCh38.115.gtf \
  --sjdbOverhang 100 #Length of the reads - 1 important !
