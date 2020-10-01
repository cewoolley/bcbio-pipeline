#!/usr/bin/bash

#
# Configuration file for common directory and file locations for scripts
#

SCRATCH=/exports/eddie/scratch/s2006465/bcbio
BASE=/exports/igmm/eddie/tomlinson-rhythm/bcbio
ALIGNMENTS=$BASE/alignments
BCBIO_CONFIG=$BASE/config
BCBIO_WORK=$SCRATCH/work #changed to scratch as has 2Tb quota
BCBIO_ALIGNMENT_TEMPLATE=$BCBIO_CONFIG/templates/align.yaml
BCBIO_VARIANT_TEMPLATE=$BCBIO_CONFIG/templates/variant.yaml
PARAMS=$BASE/params
RAW_READS=$BASE/raw_reads
READS=$SCRATCH/reads #changed to scratch as has 2tb quota
SCRIPTS=$BASE/scripts
TARGETS=$BASE/targets
VARIANTS=$BASE/variants
BCBIO_VARIANTS=$BASE/variants/bcbio
BRASS_BASE=$BASE/variants/brass
QC=$BASE/qc
METRICS=$BASE/metrics

#load bcbio?




# needed to update paths to bioinf resources

BCBIO_VERSION=1.1.5
export PATH=/exports/igmm/eddie/NextGenResources/bcbio-${BCBIO_VERSION}/tools/bin:/exports/igmm/eddie/NextGenResources/software/bin:$PATH

GATK4=/exports/igmm/eddie/IGMM-VariantAnalysis/software/gatk-4.0.2.1/gatk
GATK4_JAR=/exports/igmm/eddie/NextGenResources/bcbio-1.1.5/anaconda/share/gatk4-4.1.4.1-1/gatk-package-4.1.4.1-local.jar
REFERENCE=/exports/igmm/eddie/NextGenResources/bcbio-1.1.5/genomes/Hsapiens/hg38/seq/hg38.fa
KNOWN_SITES=/exports/igmm/eddie/NextGenResources/bcbio-1.1.5/genomes/Hsapiens/hg38/variation/dbsnp-150.vcf.gz

# unsure what these are for
CONTAMINATION_SITES=$BASE/targets/gnomad.genomes.r2.0.1.sites.hg38_crossmap.minAF_0.01.vcf.gz
MANTIS=/exports/igmm/eddie/NextGenResources/software/MANTIS-1.0.4/mantis.py

