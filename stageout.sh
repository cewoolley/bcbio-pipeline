#!/bin/bash

#
# Example data staging job script that copies a directory from Eddie to DataStore with lftp
#
#   Job will restart from where it left off if it runs out of time
#   (so setting an accurate hard runtime limit is less important)

#$ -cwd
#$ -N stageout
#  Runtime limit - set a sensible value here
#$ -l h_rt=01:00:00

# Make job resubmit if it runs out of time
#$ -r yes
#$ -notify
trap 'exit 99' sigusr1 sigusr2 sigterm


#Set some variables to automate via CLI
sampleid=$1


# Source and destination directories only! No files!
#
# Source path on Eddie. It should be on Eddie fast HPC disk, starting with one of:
# /exports/csce/eddie, /exports/chss/eddie, /exports/cmvm/eddie, /exports/igmm/eddie or /exports/eddie/scratch,
# i've been moving specific files into a /stageout dir, then staging that whole directory out... change this as needed
SOURCE=/exports/eddie/scratch/<YOUR_USERNAME>/bcbio/work/stageout
#
# Destination path on DataStore. It should start with one of /csce/datastore, /chss/datastore, /cmvm/datastore or /igmm/datastore
DESTINATION=/igmm/datastore/<YOUR_PROJ_DIR>/aligned/wgs

# Copy with lftp without password assuming ssh keys have been setup
lftp -u $USER,NONE -p 22222 sftp://cmvm.datastore.ed.ac.uk -e "mirror -c -v -R -P2 --no-perms ${SOURCE} ${DESTINATION}; exit"
