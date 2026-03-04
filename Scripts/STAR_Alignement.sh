#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

scratchDir="/scratch/zq45/yn0830"
outputDir="/scratch/zq45/yn0830/CCLE_Alignement"

mkdir -p "$outputDir"

cd ${scratchDir}/AML_RNA_BAM/fastq_output

#Performs alignment on the Reference Genome

for R1 in *_R1.fastq.gz; do

R2="${R1/_R1.fastq.gz/_R2.fastq.gz}"

sample="${R1%_R1.fastq.gz}"

sampleDir="${outputDir}/${sample}"
mkdir -p "$sampleDir"


#Two pass is important for AS detection
STAR \
	--runThreadN 16 \
	--genomeDir "${scratchDir}/Utilitaries/STAR_Index" \
	--readFilesIn "${R1}" "${R2}" \
	--readFilesCommand zcat \
	--twopassMode Basic \
 	--outFileNamePrefix "${sampleDir}/"
done
