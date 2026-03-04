#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

cd /scratch/zq45/yn0830/

metagraph align \
  -i AML_RNA_BAM/fastq_output/Cleaned_Graph.dbg \
  -a AML_RNA_BAM/fastq_output/Graph_annotation.column.annodbg \
  --align-min-seed-length 21 \
  Query.fa> align_results.tsv
