#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

cd /scratch/zq45/yn0830/MetaGraph_Results

# Convert binary+counts annotation to count-aware annotation
metagraph transform_anno \
  --anno-type int_brwt \
  --greedy \
  -o Annotated_Graphs/AML/Transformed_Graphs/AML_Graph_annotation_Brwt \
  Annotated_Graphs/AML/Normal_Graph_Annotated/AML_Cell_Lines_annotation.column.annodbg
