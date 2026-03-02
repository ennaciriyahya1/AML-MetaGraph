#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

scratchDir="/srv/scratch/z5752982/"
outputDir="/srv/scratch/z5752982/Test_alignement"

#Performs alignment on the Reference Genome
STAR \
	--runThreadN 16 \
	--genomeDir "${scratchDir}STAR-aligner/Index-Creation" \
	--readFilesIn "${scratchDir}Test_FASTQ/ENCFFR1.fastq.gz" "${scratchDir}Test_FASTQ/ENCFFR2.fastq.gz" \
	--readFilesCommand zcat \
	--twopassMode Basic \ #Important for AS detection, as it runs two steps of SJ identification
 	--outFileNamePrefix "${outputDir}/"
