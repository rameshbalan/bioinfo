## Group 2

> A diamond is merely a lump of coal that did well under pressure.

### Project Objective:

> Find the orthologs among the 5 species of beetles and annotate the orthologs.

### Project Workflow:
- __Step 1:__ Construct a _de novo_ transcriptome assembly.  
	~~a. Run Trinity to construct a primary assembly.~~  
	b. Run BUSCO to check the quality of the assembly. Use `BUSCO`.  
- __Step 2:__ Identify the coding regions.  
	a. Using the transcriptome from the previous step, run LongOrfs with threshold set to at least 200 aa length for each ORF. Use `TransDecoder.LongOrfs` with `-m 200` flag.  
	b. Using the `cds` file, predict the protein sequences for single best ORF for gene. Use `TransDecoder.Predict` with `--single_best_orf` flag.  
	```bash
	TransDecoder.Predict -t target_transcripts.cds --single_best_orf
	```
	c. Run BUSCO to check the quality of the assembly. Use `BUSCO`.
- __Step 3:__ Cluster identical sequences together.  
	a. Cluster all the amino acid sequences which are 100% identical within the predicted peptide file. Use `cd-hit` with `-c 1.0` flag.  
	b. Run BUSCO to check the quality of the assembly. Use `BUSCO`.
-  __Step 4:__ Find the Orthologs among 5 species.  
	a. Run all vs all BLAST among 5 species. Use `makeblastdb` and `blastp`  
	b. Pick the reciprocal Best BLAST hit (RBBH). Write a `python` script.  
	c. Run a 5 way script to pull out the orthologs among 5 species. Write a `python` script.  
- __Step 5:__ Add annotation to the orthologs.  
	a. Using T_cas ids and T_cas reference gff files, add chromosome id (for example: LGX, LG2 etc.),chromosome name (Autosome/ Sex chromosome). Write `python` script.  
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
	TransDecoder.Predict -t target_transcripts.fasta --single_best_orf
	```
	- [TransDecoder manual](https://github.com/TransDecoder/TransDecoder/wiki)

- cd-hit can be run as follows.
	```bash
	cd-hit -i cds_file -o nr100_cds_file -c 1.00
	```
	- [cd-hit manual](https://github.com/weizhongli/cdhit/wiki/3.-User's-Guide#CDHIT)
