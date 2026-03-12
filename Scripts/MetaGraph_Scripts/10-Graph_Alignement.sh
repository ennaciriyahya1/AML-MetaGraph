#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

cd /scratch/zq45/yn0830/MetaGraph_Results/

#i takes into input the Cleaned Graph, a the annotated one (after cleaning) and align-min-seed is the threshold for considering a path as exisiting (which means at least 21bp compatibility to consider an alignement path)
metagraph align \
  -i Original_Graphs/T_ALL_Graphs/T_ALL_Graph.dbg \
  -a Annotated_Graphs/T-ALL/Non_Cleaned_Graph_annotation.column.annodbg \
  --align-min-seed-length 21 \
  Sequence_Query/T-ALL_Sequence_Query.fa > Alignement_Results/T-ALL_align_results.tsv
#Query.fa should be in fasta format >Gene-name then second line is the sequence in ATCG (even if performing RNA-Seq, there is a back to cDNA step that allows the sequence to ba DNA-format) sends everything to align_results.tsv 
