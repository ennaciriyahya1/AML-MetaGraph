#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

dirpath="/srv/scratch/z5752982/AML_RNA_BAM/fastq_output"

cd ${dirpath}

#The input file (the graph) must be added at the end of the command line
#This step allows for suppression of the k-mers with lower counts, probably arising from errors in sequencing
metagraph clean -v -p 4 --to-fasta --prune-tips 62 --prune-unitigs 0 --fallback 2 \
                -o clean_test_graph testgraph.dbg
