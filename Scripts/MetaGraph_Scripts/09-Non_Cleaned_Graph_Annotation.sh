#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

dirpath="/scratch/zq45/yn0830/T_ALL_Fastq_Output"
scratch="/scratch/zq45/yn0830/"
cd ${dirpath}

#-Anno_filename allows to annotate the k-mers depending on their file of origin (useful for sequence detection) and implements the counts using --count-kmers

metagraph annotate -v -i ${scratch}MetaGraph_Results/Original_Graphs/AML_Graphs/T_ALL_Graph.dbg --anno-filename --count-kmers --count-width 16 \
--disk-swap ${scratch}MetaGraph_Swap --mem-cap-gb 500 -p 48 -o ${scratch}MetaGraph_Results/Annotated_Graphs/AML/Non_Cleaned_Graphs_Annotation/Non_Cleaned_Graph_annotation \
*_R1.fastq.gz *_R2.fastq.gz

