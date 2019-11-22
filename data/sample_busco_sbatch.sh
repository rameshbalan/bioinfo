#!/bin/bash
#----------------------------------------------------
# Sample Slurm job script
# for TACC Stampede2 SKX nodes
#
# Example SBATCH File for BUSCO.
# NOTE: Change the email id under --mail-user flag.
#----------------------------------------------------

#SBATCH -J step1b_busco           # Job name
#SBATCH -o step1b_busco.o%j       # Name of stdout output file
#SBATCH -e step1b_busco.e%j       # Name of stderr error file
#SBATCH -p skx-normal      # Queue (partition) name
#SBATCH -N 1               # Total # of nodes (must be 1 for serial)
#SBATCH -n 1               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 02:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-user=firstname.lastname@mavs.uta.edu
#SBATCH --mail-type=all    # Send email at begin and end of job
#------------------------------------------------------

# Sourcing bashrc to activate conda
source ~/.bashrc
# Activating busco environment
conda activate busco
# Running busco
run_busco --in transcriptome.fasta --out transcriptome -l endopterygota_odb9 -m tran -c 272
	
