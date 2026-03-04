#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

dirpath="/scratch/zq45/yn0830/AML_RNA_BAM/fastq_output"

cd ${dirpath}

metagraph annotate -v -i Cleaned_Graph.dbg --anno-filename --count-kmers --count-width 16 \
--disk-swap /scratch/zq45/yn0830/metagraph_swap --mem-cap-gb 600 -p 32 -o Graph_annotation *_R1.fastq.gz *_R2.fastq.gz
