## Quick Guide for the workflow.

### Group 2

|Step |Program|Flags/Filter/Parameters| Notes|
|-----|:-----:|:------------:|--------:|
|1.b |BUSCO||This creates short_summary.txt. >>> Tip: Run generate_plot to create a graph of the summary. <<<|
|2.a|TransDecoder.LongOrfs| > 200bp |This creates 4 files. A `cds` file, a `pep` file, a `gff` file and a `bed` file.|
|2.b|TransDecoder.Predict| --single_best_orf |This creates 4 files. A `cds` file, a `pep` file, a `gff` file and a `bed` file.|
|2.c |BUSCO||This creates short_summary.txt. >>> Tip: Run generate_plot to create a graph of the summary. <<<|
|3.a|cd-hit|-c 1.0| This clusters identical amino acid sequeces together in the peptide file and creates a non-redundant peptide sequence file.|
|3.b|BUSCO||This creates short_summary.txt. >>> Tip: Run generate_plot to create a graph of the summary. <<<|
|4.a|BLASTP|-max_target_seqs 1, -outfmt 6|This would create 10 files. 5 species x 2 ways = 10|
|4.b|RBBH - python script|pull out the reciprocal best hits only.| This would create 5 files.|
|4.c|Orthologs - python script|pull out the orthologs among 5 species|This would create 1 file and let us call this the orthologs file.|
|5.a|Annotation|use gff file|Add annotation to the orthologs file.|
