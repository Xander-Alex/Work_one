#!/bin/bash

# first we need to use wget and esearch with history to the the
# xml page. An example:
# wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi
# \?db\=nucleotide\&term\=Psammodromus%20algirus\[organism\],
# %20cytb\[gene\]\&usehistory\=y -O ~/Pal_history.xml

# Next we have to get the data with wget and efetch with history in fasta format. An example:
# wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi/
# \?db\=nucleotide\&usehistory\=y\&query_key\=1\&WebEnv\=
# MCID_60509678d4235d1ac316d2db\&rettype\=fasta
# -O P_algirus_cytb2.fasta

function ent()
{
        wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi\?db\=$1\&term\=$2\&usehistory\=y -O "${3}.xml"
        QueryKey=$(grep "<QueryKey>" "${3}.xml" | sed "s/.*<QueryKey>//" | sed "s/<\/QueryKey>.*//")
        WebEnv=$(grep "<WebEnv>" "${3}.xml" | sed "s/.*<WebEnv>//" | sed "s/<\/WebEnv>.*//")
        wget https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi/\?db\=$1\&usehistory\=y\&query_key\=${QueryKey}\&WebEnv\=${WebEnv}\&rettype\=fasta -O "${3}.fasta"
        cat "${3}.fasta"
}
