#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

cd /scratch/zq45/yn0830/MetaGraph_Results/

#i takes into input the Cleaned Graph, a the annotated one (after cleaning) and align-min-seed is the threshold for considering a path as exisiting (which means at least 21bp compatibility to consider an alignement path)
metagraph query \
--query-mode counts -i Cleaned_Graphs/AML/AML_Cell_Lines_Cleaned_Graph.dbg \
  -a Annotated_Graphs/AML/Transformed_Graphs/AML_Graph_annotation_Brwt.int_brwt.annodbg \
  Sequence_Query/AML_Sequence_Query.fa > Alignement_Results/AML_query.tsv
#Query.fa should be in fasta format >Gene-name then second line is the sequence in ATCG (even if performing RNA-Seq, there is a back to cDNA step that allows the sequence to ba DNA-format) sends everything to align_results.tsv 
