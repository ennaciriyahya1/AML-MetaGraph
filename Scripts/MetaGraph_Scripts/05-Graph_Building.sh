#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

dirpath="/scratch/zq45/yn0830/T_ALL_Fastq_Output"

cd ${dirpath}

#Builds a De Bruijne graph using all the fastq files available => Beware of the important memory required here for this step
find . -name "*fastq.gz" | metagraph build -v -p 32  -k 31 --count-kmers \
--disk-swap /scratch/zq45/yn0830/MetaGraph_Swap --mem-cap-gb 700  -o /scratch/zq45/yn0830/MetaGraph_Results/Original_Graphs/T_ALL_Graphs/T_ALL_Graph

