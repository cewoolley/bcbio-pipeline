BCBio Pipeline scripts for Eddie HPC

Scripts courtesy of Alison Meynert, modified in parts as needed


Prep: 

Will need to modify scratch directory locations. You can run more at once by staging onto scratch, then staging back out onto datastore:

raw data on datastore -> scratch working dir -> alignment -> aligned files back to datastore 

General workflow:

0. Samples shoudl be named in a <sample><T/N> convention.
1. Run sample/s through prepare_samples script which generates appropriate config files
2. Run align samples script pointing to file containing IDs for your samples, not whether they're T/N. This gets specificed in the align command, see examples in scripts.
