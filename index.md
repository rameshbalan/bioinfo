### Course Information:
This course provides an introduction to bioinformatics and computational genomics. The course is geared toward the student with a biology background and limited programming experience. Coursework will be completed almost exclusively in the UNIX/Linux computing environment and students will learn to program using Python. Students will learn: how to reframe biological problems into computationally tractable questions, basic computational biology algorithms, analyses of genome and transcriptome data.

### Problem Statement:

> Find the orthologs among the 5 species of beetles and annotate the orthologs.

### Background Information:

<video width="1080" height="720" controls>
  <source src="data/Transcriptomics.MP4" type="video/mp4">
  <source src="data/Transcriptomics.MP4" type="video/mp4">
  Your browser does not support the video tag.
</video>

### Project Workflow:
1. Step 1: ~~Construct a _de novo_ transcriptome assembly.~~  
	a. Run BUSCO to check the quality of the assembly.  
	- Why _de novo_ assembly?
		- Low Mapping against the closest reference species.  
2. Step 2: Cluster similar sequences together.  
	a. Run BUSCO to check the quality of the assembly.   
3. Step 3: Get the unigenes.  
	a. Quantify the expression for each gene.  
	b. Retain only the highest expressed Isoform for each gene.  
	c. Run BUSCO to check the quality of the assembly.  
4. Step 4: Find Orthologs among 5 species.  
	a. Run all vs all BLAST among 5 species.  
	b. Pick the reciprocal Best BLAST hit (RBBH).  
	c. Run a 5 way script to pull out the orthologs among 5 species.  

### Instructions:


|Group|Members|Source Directory|Guidelines|
|-----|:-----:|:------------:|--------:|
|1. | P1,Q1,R1,S1|[Group1](group1)|[Link](https://www.google.com)|
|2. | P2,Q2,R2,S2|[Group2](group2)|[Link](https://www.google.com)|
|3. | P3,Q3,R3,S3|[Group3](group3)|[Link](https://www.google.com)|
|4. | P4,Q4,R4,S4|[Group4](group4)|[Link](https://www.google.com)|
|5. | P5,Q5,R5,S5|[Group5](group5)|[Link](https://www.google.com)|
|6. | P6,Q6,R6,S6|[Group6](group6)|[Link](https://www.google.com)|

This project depends on the following softwares/programs to carry out a specific task. Installation instructions are given below.

### Dependencies:

- [Conda](https://docs.conda.io/en/latest/miniconda.html)
	- Choose 64-bit Linux Installers for Python 3.7

		```bash
		# Get the installer.
		wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
		# Run the installer.
		bash Miniconda3-latest-Linux-x86_64.sh
		```
	- Please ensure that miniconda installs in your home directory. If not, you will get a permission denied error.
	- Please ensure that conda is added to bashrc or bash_profile.
- [BUSCO](https://busco.ezlab.org)
	- Install busco using conda as follows.
		- `conda create -n busco -c bioconda busco`
	- This installs BUSCO but unfortunately, the configuration file isn't setup. You can do this in three steps.
		- cd to miniconda3/envs/busco/config/ directory.
		- `wget https://gitlab.com/ezlab/busco/raw/master/config/config.ini.default`.
		- `mv config.ini.default config.ini`.

- [cd-hit](http://weizhongli-lab.org/cd-hit/)
	- Install cd-hit as follows.
	```bash
	# Get the installer.
	wget https://github.com/weizhongli/cdhit/releases/download/V4.8.1/cd-hit-v4.8.1-2019-0228.tar.gz
	# Uncompress the package.
	tar xvf cd-hit-v4.8.1-2019-0228.tar.gz --gunzip
	# Navigate to the directory and build the programs.
	cd cd-hit-v4.8.1-2019-0228
	make
	# Navigate to the auxiliary directory and build the programs.
	cd cd-hit-auxtools
	make
	```
	- Add cd-hit-v4.8.1-2019-0228 to the path variable.
- [salmon](https://combine-lab.github.io/salmon/)
	- Install salmon using conda as follows.
		- `conda create -n salmon -c bioconda salmon`
	- To use salmon
		- `conda activate salmon`
- [TransDecoder](https://github.com/TransDecoder/TransDecoder/wiki)
	- Install TransDecoder as follows.
	```bash
	# Get the package.
	wget https://github.com/TransDecoder/TransDecoder/archive/TransDecoder-v5.5.0.tar.gz
	# Uncompress the package.
	tar xvf TransDecoder-v5.5.0.tar.gz --gunzip
	```
	- Add TransDecoder to the path variable in bashrc or bash_profile.
- [python3](https://www.python.org)
	- This should be available via conda and also as a module in Stampede2.
