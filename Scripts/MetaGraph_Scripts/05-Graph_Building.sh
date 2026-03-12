#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

swap = /scratch/zq45/yn0830/MetaGraph_Swap

dirpath="/scratch/zq45/yn0830/AML_Fastq_Output"

cd ${dirpath}

#Builds a De Bruijne graph using all the fastq files available => Beware of the important memory required here for this step
find . -name "*fastq.gz" | metagraph build -v -p 48  -k 31 --count-kmers \
--disk-swap /scratch/zq45/yn0830/MetaGraph_Swap --mem-cap-gb 900  -o /scratch/zq45/yn0830/MetaGraph_Results/Original_Graphs/AML_Graphs/AML_Graph

