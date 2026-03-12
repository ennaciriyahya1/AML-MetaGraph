#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

dirpath="/scratch/zq45/yn0830/MetaGraph_Results/"

cd ${dirpath}

#The input file (the graph) must be added at the end of the command line
#This step allows for suppression of the k-mers with lower counts, probably arising from errors in sequencing
metagraph clean -v -p 16 --to-fasta --prune-tips 62 --prune-unitigs 0 --fallback 2 \
                -o ${dirpath}Cleaned_Graphs/T-ALL/Cleaned_graph ${dirpath}Original_Graphs/T_ALL_Graphs/T_ALL_Graph.dbg
