#!/bin/bash

# Activate conda (only if aws is in that env)
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate unsw

# Go to scratch
cd /scratch/zq45/yn0830

# Create dedicated folder
mkdir -p AML_RNA_BAM

cd AML_RNA_BAM

# 2) Build BAM list automatically (RNA + AML)
awk -F',' '
  NR==FNR { gsub(/\r/,""); cl[tolower($0)]=1; next }

  FNR==1 { next }  # skip header

  {
    dt=tolower($13)        # datatype
    code=tolower($14)      # depmap_code
    cln=tolower($7)        # cell_line_name_stripped

    gsub(/^[[:space:]]+|[[:space:]]+$/,"",dt)
    gsub(/^[[:space:]]+|[[:space:]]+$/,"",code)
    gsub(/^[[:space:]]+|[[:space:]]+$/,"",cln)

    if (dt != "rna") next
        if (!(cln in cl)) next

    url=$12  # cram_bam_url (contains the bam for rna)
    if (url ~ /^s3:\/\/depmap-omics-ccle\/data\/rna\/bam\/.*\.bam$/) print url
  }
' /scratch/zq45/yn0830/Utilitaries/Cell_lines.txt /scratch/zq45/yn0830/Utilitaries/inventory.csv | sort -u > bam_list.txt


# Parallel download (4 at a time)
cat bam_list.txt | xargs -n 1 -P 8 -I {} aws s3 cp --no-sign-request {} .
