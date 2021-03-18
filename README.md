# Entrez API shell
A simple program to automate the use of the *entrez* API of NCBI. This program use the "history" API feature and stores all search results.

## Installation
To install you need to clone the repository or download and decompress the zip file in a directory you like.
Next open your terminal and execute this:
```
# open your directory
cd ~/diretory/with/file

# transform the script in a command
. Script.sh
```

## How to use
This feature has 3 mandatory arguments. The first is the database you what to use. The second is what do you want to search on NCBI. And the third 
is the name of the files which will go save the data (a xml file with the xml code of the search and a fasta file with the biological sequences). You
do not need to say what is the extension of the files (this is done automatically).
An example how to use:
```
ent nucleotide "Psammodromus%20algirus[organism],%20cytb[gene]" pal_teste
```
The fasta file generated is always send do stdout.
