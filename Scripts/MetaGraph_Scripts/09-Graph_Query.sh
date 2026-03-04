#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

cd /scratch/zq45/yn0830/

#i takes into input the Cleaned Graph, a the annotated one (after cleaning) and align-min-seed is the threshold for considering a path as exisiting (which means at least 21bp compatibility to consider an alignement path)
metagraph align \
  -i AML_RNA_BAM/fastq_output/Cleaned_Graph.dbg \
  -a AML_RNA_BAM/fastq_output/Graph_annotation.column.annodbg \
  --align-min-seed-length 21 \
  Query.fa> align_results.tsv
#Query.fa should be in fasta format >Gene-name then second line is the sequence in ATCG (even if performing RNA-Seq, there is a back to cDNA step that allows the sequence to ba DNA-format) sends everything to align_results.tsv 
