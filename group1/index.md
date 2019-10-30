## Group 1

> Nothing lasts forever, not even your problems. Stay Positive !

### Problem Objective:

> Find the orthologs among the 5 species of beetles and annotate the orthologs.

### Project Workflow:
- Step 1: Construct a _de novo_ transcriptome assembly.  
	~~a. Run Trinity to construct a primary assembly.~~  
	b. Run BUSCO to check the quality of the assembly. Use `BUSCO`.  
- Step 2: Filter the low expression transcripts.  
	a. Quantify the expression for each gene. Use `salmon`  
	b. Retain transcripts with a minimum of 5 TPM. Write a `python` script.  
	c. Run BUSCO to check the quality of the assembly. Use `BUSCO`.
- Step 3: Identify the coding regions.  
	a. Using generated transcriptome from the previous step, run LongOrfs with threshold set to at least 100 aa length for each ORF. Use `TransDecoder.LongOrfs`.  

	b. Using the predicted peptide sequences (`.pep` file) run BLASTP against _Tribolium castaneum_ protein sequences. Use `makeblastdb` and `blastp`.
	```bash
	# Get the sequence file.
	wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/002/335/GCF_000002335.3_Tcas5.2/GCF_000002335.3_Tcas5.2_protein.faa.gz
	# Uncompress the file.
	gzip -d GCF_000002335.3_Tcas5.2_protein.faa.gz
	# Example blastp. Make sure to create blastdb before this command.
	blastp -query transdecoder_dir/longest_orfs.pep -db uniprot_sprot.fasta  -max_target_seqs 1 -outfmt 6 -evalue 1e-5 -num_threads 48 > blastp.outfmt6
	```
	c. Using the homology information from BLASTP, predict the coding sequence.
	```bash
	TransDecoder.Predict -t target_transcripts.fasta --retain_blastp_hits blastp.outfmt6

	```
	d. Run BUSCO to check the quality of the assembly. Use `BUSCO`.
-  Step 4: Find Orthologs among 5 species.  
	a. Run all vs all BLAST among 5 species. Use `makeblastdb` and `blastp`  
	b. Pick the reciprocal Best BLAST hit (RBBH). Write a `python` script.  
	c. Run a 5 way script to pull out the orthologs among 5 species. Write a `python` script.

### Helpful Hints:

- To use BUSCO.  
	```bash
	conda activate busco
	
	```
