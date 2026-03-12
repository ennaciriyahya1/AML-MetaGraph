#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

dirpath="/scratch/zq45/yn0830/MetaGraph_Results/"

cd ${dirpath}

#Builds a new metagraph using the output from the cleaning step

metagraph build -v -p 16 -k 31 --count-kmers --disk-swap /scratch/zq45/yn0830/MetaGraph_Swap \
--mem-cap-gb 700 -o ${dirpath}Cleaned_Graphs/T-ALL/T-ALL_Cleaned_Graph ${dirpath}Cleaned_Graphs/T-ALL/Cleaned_graph.fasta.gz

