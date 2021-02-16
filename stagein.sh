#!/bin/bash

#
# Example data staging job script that copies a directory from DataStore to Eddie with lftp
#
#   Job will restart from where it left off if it runs out of time
#   (so setting an accurate hard runtime limit is less important)

#$ -cwd
#$ -N stagein
#  Runtime limit - set a sensible value here
#$ -l h_rt=01:00:00

# Make job resubmit if it runs out of time
#$ -r yes
#$ -notify
trap 'exit 99' sigusr1 sigusr2 sigterm

#sampleid=$1

# Source and destination directories only! No files!
#
# Source path on DataStore. It should start with one of /csce/datastore, /chss/datastore, /cmvm/datastore or /igmm/datastore
SOURCE=/igmm/datastore/<YOUR_SOURCE_DIR>
#
# Destination path on Eddie. It should be on Eddie fast HPC disk, starting with one of:
# /exports/csce/eddie, /exports/chss/eddie, /exports/cmvm/eddie, /exports/igmm/eddie or /exports/eddie/scratch,
# i move to scratch since you can store more here short term as a workdir...
DESTINATION=/exports/eddie/scratch/<YOUR_USERNAME>/bcbio/reads/lane

# Do the copy with lftp without password assuming ssh keys have been setup on DataStore
mkdir ${DESTINATION}/${sampleid}
lftp -u $USER,NONE -p 22222 sftp://cmvm.datastore.ed.ac.uk -e "mirror -c -v -P4 --no-perms ${SOURCE} ${DESTINATION}; exit" :w

#create sym links from scratch so bcbio can find samples in ..reads/lane/
#for FILE in ${DESTINATION}/${sampleid}/*; do ln -s ${DESTINATION}/${sampleid}/$FILE /exports/igmm/eddie/tomlinson-rhythm/bcbio/reads/lane/$FILE; done
