---
title: Group 4
---

> In life only one thing is certain, Friday will come.

### Project Objective:

> Find the orthologs among the 5 species of beetles and annotate the orthologs.

### Project Workflow:
- __Step 1:__ Construct a _de novo_ transcriptome assembly.  
	~~a. Run Trinity to construct a primary assembly.~~  
	b. Run BUSCO to check the quality of the assembly. Use `BUSCO`.  
- __Step 2:__ Identify the coding regions.  
	a. Using generated transcriptome from the previous step, run LongOrfs with threshold set to at least 100 aa length for each ORF. Use `TransDecoder.LongOrfs`  
	b. Using the predicted peptide sequences (`.pep` file) run BLASTP against _Tribolium castaneum_ protein sequences. Use `makeblastdb` and `blastp` with `-max_target_seqs 1 -outfmt 6 -evalue 1e-10` flags.

	```bash
	# Get the sequence file.
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/002/335/GCF_000002335.3_Tcas5.2/GCF_000002335.3_Tcas5.2_protein.faa.gz
	# Uncompress the file.
	gzip -d GCF_000002335.3_Tcas5.2_protein.faa.gz
	# Make sure to create blastdb before this command.
	# Example blastp.
	blastp -query transdecoder_dir/longest_orfs.pep -db Tcas_protein_db.fasta  -max_target_seqs 1 -outfmt 6 -evalue 1e-10 -num_threads 48 > blastp.outfmt6
	```
	c. Using the homology information from BLASTP, predict the coding sequence.
	```bash
	TransDecoder.Predict -t target_transcripts.fasta --retain_blastp_hits blastp.outfmt6
	```
	d. Run BUSCO to check the quality of the filtered transcriptome. Use `BUSCO`.
- __Step 3:__ Find the Orthologs among 5 species.  
	a. Run all vs all BLAST among 5 species. Use `makeblastdb` and `blastp`.  
	```bash
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/002/335/GCF_000002335.3_Tcas5.2/GCF_000002335.3_Tcas5.2_rna.fna.gz
	# Uncompress the file.
	gzip -d GCF_000002335.3_Tcas5.2_rna.fna.gz
	# Make sure to create blastdb before this command.
	# Example blastp.
	blastp -query predicted_peptides.pep -db Tcas_protein_db.fasta  -max_target_seqs 1 -outfmt 6 -num_threads 48 > species1_Tcas_db.txt
	```
	b. Pick the reciprocal Best BLAST hit (RBBH). Write a `python` script.  
	c. Run a 5 way script to pull out the orthologs among 5 species. Write a `python` script.  
- __Step 4:__ Add annotation to the orthologs.
 	a.Using T_cas ids and T_cas reference gff files, add chromosome id (for example: LGX, LG2 etc.),chromosome name (Autosome/ Sex chromosome). Write `python` script.
	```bash
	# Get the gff file.
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/002/335/GCF_000002335.3_Tcas5.2/GCF_000002335.3_Tcas5.2_genomic.gff.gz
	# Uncompress the file.
	gzip -d GCF_000002335.3_Tcas5.2_genomic.gff.gz
	```

### Helpful Hints:

- To use BUSCO, the first step is to get the lineage and then busco can be run as follows.

	```bash
	# Get the lineage
	wget https://busco.ezlab.org/datasets/endopterygota_odb9.tar.gz
	# Uncompress the directory.
	tar xvf endopterygota_odb9.tar.gz --gunzip
	# Activate busco environment
	conda activate busco
	# Run BUSCO
	run_busco --in transcriptome.fasta --out [output_directory_name] -l [path_to_]endopterygota_odb9 -m tran -c 48
	```
	- [BUSCO manual](http://gitlab.com/ezlab/busco/raw/master/BUSCO_v3_userguide.pdf)

- TransDecoder has two programs. These two programs can be run as follows.
	```bash
	# To run LongOrfs with minimum ORF length as 100 amino acids.
	TransDecoder.LongOrfs -t target_transcripts.fasta -m 100
	# To run Predict
	TransDecoder.Predict -t target_transcripts.fasta --retain_blastp_hits blastp.outfmt6
	```
	- [TransDecoder manual](https://github.com/TransDecoder/TransDecoder/wiki)

### Reference:

High Quality _de Novo_ Transcriptome Assembly of _Croton tiglium_. - [PDF](../data/Haak_et_al_2018.pdf)
