#!/usr/bin/env sh
#remove all metadata contents
rm -rf metadata/*
#create the "letterarie" directory
mkdir -p metadata/letterarie
#assign to paths the vector of the relative paths to the xml files
paths="corpus/letterarie/*.xml"
#for each path ...
for path in $paths; do
    #extract the filename from the relative path
    filename="$(basename -- $path)"
    #extract the numeric id from the filename
    id=`echo $filename | sed -E "s/(VERIFICARE-LIVELLO-)?.[_-]..[_-]([0-9]+)[_-].*/\\2/"`
    #assign to pathprefix the destination path
    pathprefix=metadata/letterarie
    #assign to itemid the id prefixed by "item_"
    itemid=item_$id
    #assign to metapath its specific value
    metapath=metadata/letterarie/item_$id/1
    #create the metapath directory
    mkdir -p $metapath
    #copy the file "contents" in metapath
    cp template/contents $metapath
    #copy the file "metadata_metashare.xml" in metapath
    cp template/metadata_metashare.xml $metapath
    #apply an xsl transformation to the original .xml file with teiHeader metadata in order to create the dublin_core.xml file (with the "id" parameter)
    java -jar Saxon-HE-9.9.1-3.jar -o:$metapath/dublin_core.xml -xsl:tei2dublin_core.xsl -s:$path id=$id
    #apply an xsl transformation to the original .xml file with teiHeader metadata in order to create the metadata_local.xml file (with the "id" parameter)
    java -jar Saxon-HE-9.9.1-3.jar -o:$metapath/metadata_local.xml -xsl:tei2metadata_local.xsl -s:$path id=$id
    #enter the directory
    cd $pathprefix
    #zip the generated files
    zip $itemid.zip -r $itemid
    #cd backwards
    cd ../../
    #echo the id for the generated files
    echo "$id"
#end of the loop
done

