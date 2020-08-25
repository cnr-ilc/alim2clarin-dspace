# alim2clarin-dspace #

This GitHub repository contains scripts to parse (ALIM) TEI header and create dublin_core and metadata_local.xml files to be imported into the ILC4CLARIN repository.
The structure is the following:

* corpus
  * documentarie
  * letterarie
* MappingALIM2CLARIN.pdf
* tei2clarin.sh
* tei2dublin_core.xsl
* tei2metadata_local.xsl
* template
  * metadata_metashare.xml

For details on the ALIM project, please visit the [project web site!](http://en.alim.unisi.it/the-project/)
## CORPUS ##
This folder contains two subfolders, one for Literary Sources (letterarie), and one for Documentary Sources (documentarie). This repository DOES NOT contain data. If you need the physical data, please contact the [helpdesk](mailto:progettoalim@protonmail.com).

## MappingALIM2CLARIN.pdf ##
It is the description of the mapping. At the end of August 2020, only the mapping for Literary Sources is completed.

## tei2clarin.sh ##
The shell script used to create the repository items from the teiHeader files.

## tei2dublin_core.xsl ##
The XSLT style sheet for dublin_core.xml files.

## tei2metadata_local.xsl ##
The XSLT style sheet for metadata_local.xml files.

## template ##
The template folder contains the metadata_metashare.xml file which is the same for each item.
