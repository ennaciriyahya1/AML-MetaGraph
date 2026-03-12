#!/bin/bash

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

#Location of the FASTQ files"
dirpath="/scratch/zq45/yn0830/T_ALL_Fastq_Output/"

cd ${dirpath}

#In case you need additional fastq files not accessible through the inventory
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR861/001/SRR8616061/SRR8616061_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR861/001/SRR8616061/SRR8616061_2.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR861/003/SRR8615303/SRR8615303_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR861/003/SRR8615303/SRR8615303_2.fastq.gz
