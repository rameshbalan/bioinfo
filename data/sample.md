---
title: Sample Files
---

This page has the sample output files from the following programs. You may choose to use these sample files to work on your `python` script for downstream processing while you wait for your actual results.

|S.No|Program|Output File|
|:----|:-----:|----------:|
|1.| BUSCO| [BUSCO Summary file](Sample_S1_BUSCO_short_summary.txt)|
|2.|cd-hit| [cd-hit fasta file](Sample_S1_cd_hit.zip)|
|3.|cd-hit-est|[cd-hit-est fasta file](Sample_S1_cd_hit_est.zip)|
|4.|salmon| [salmon quant file](Sample_S1_salmon.sf)|
|5.|TransDecoder|[Transdecoder all files](Sample_S1_transdecoder.zip).This has a `cds` file, a `pep` file, a `gff` file and a `bed` file.|

Some of the results are compressed to accomodate 50Mb file size limit of github. You can uncompress them in the terminal using the following command.

```bash
# To unzip the file.
unzip [name of the file]
```  

**Sample sbatch Files**  

|S.No|Program|Sample sbatch file (SkyLake Node Stampede2)|
|:----|:-----:|----------:|
|1.|BUSCO|[sbatch_busco](sample_busco_sbatch.sh)|
|1.|Salmon - Trinity Workaround|[sbatch_salmon](sample_salmon_sbatch.sh)|
