#!/bin/bash
#----------------------------------------------------
# Sample Slurm job script
# for TACC Stampede2 SKX nodes
#
# Example SBATCH File for Salmon with Trinity Workaround.
# NOTE: Change the email id under --mail-user flag.
# NOTE: Change the parameters in the align_and_estimate_abundance.pl line to reflect the sample you want to quantify.
#----------------------------------------------------

#SBATCH -J sample_salmon           # Job name
#SBATCH -o sample_salmon.o%j       # Name of stdout output file
#SBATCH -e sample_salmon.e%j       # Name of stderr error file
#SBATCH -p skx-normal      # Queue (partition) name
#SBATCH -N 1               # Total # of nodes (must be 1 for serial)
#SBATCH -n 1               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 02:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-user=firstname.lastname@mavs.uta.edu
#SBATCH --mail-type=all    # Send email at begin and end of job
#------------------------------------------------------

# Sourcing bashrc to activate conda
source ~/.bashrc

# Activating salmon environment
conda activate salmon

# Loading Dependency modules.
module load intel/17.0.4
module load samtools

# Running salmon using trinity.
~/trinityrnaseq-v2.8.6/util/align_and_estimate_abundance.pl --transcripts T_frem.fasta --seqType fq --left reads/T_frem_M1_R1.fastq.gz --right reads/T_frem_M1_R2.fastq.gz --est_method salmon --output_dir T_frem_M1 --prep_reference
