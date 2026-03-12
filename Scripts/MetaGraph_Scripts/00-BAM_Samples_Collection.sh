#!/bin/bash

# Activate conda (only if aws is in that env)
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate unsw

scratch="/scratch/zq45/yn0830/"
dirpath="/scratch/zq45/yn0830/Utilitaries/"

# Go to scratch
cd ${scratch}

# Create dedicated folder
mkdir -p AML_RNA_BAM

cd AML_RNA_BAM

# Using the inventory file and the list of Cell lines in a txt file
awk -F',' '
  NR==FNR { gsub(/\r/,""); cl[tolower($0)]=1; next } #NR is the total number of lines read, and FNR is the number of lines read in the current file

  FNR==1 { next } # skip header which contains column names

  { #Collects the datatype (RNA, WGS etc), and the cell_line_name (important for cross referencing with the Cell lines txt)
    dt=tolower($13)        # datatype
    code=tolower($14)      # depmap_code
    cln=tolower($7)        # cell_line_name_stripped

    gsub(/^[[:space:]]+|[[:space:]]+$/,"",dt)
    gsub(/^[[:space:]]+|[[:space:]]+$/,"",code)
    gsub(/^[[:space:]]+|[[:space:]]+$/,"",cln)

    if (dt != "rna") next #Checks that the type of data is RNA Seq
        if (!(cln in cl)) next  # Checks if the cell line corresponds to the list that we have

    url=$12  # cram_bam_url (contains the bam for rna)
    if (url ~ /^s3:\/\/depmap-omics-ccle\/data\/rna\/bam\/.*\.bam$/) print url
  }
' ${dirpath}Cell_lines.txt ${dirpath}inventory.csv | sort -u > bam_list.txt


# Parallel download (8 at a time)
cat bam_list.txt | xargs -n 1 -P 8 -I {} aws s3 cp --no-sign-request {} .
