#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

dirpath="/scratch/zq45/yn0830/AML_RNA_BAM/fastq_output"

cd ${dirpath}

#Builds a De Bruijne graph using all the fastq files available => Beware of the important memory required here for this step
find . -name "*fastq.gz" | metagraph build -v -p 16 -k 31 --count-kmers \
--disk-swap /scratch/zq45/yn0830/metagraph_swap --mem-cap-gb 700  -o testgraph

