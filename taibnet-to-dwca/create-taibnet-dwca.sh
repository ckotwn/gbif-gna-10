#!/bin/bash
# Generate datasheets for packaging as DwC-A.
# Assuming MySQL/MariaDB.
#
# ATTENTION: Use accompanying my-extra.cnf to indicate proper user and database.
#
# by Chihjen Ko

CURRENT_DIR=$(pwd)
HEAD="dwca-taibnet-"
PACKAGES=("all" "iucn" "coa" "endemic")

mysql --defaults-extra-file=my-extra.cnf < taibnet-clean-line-breaks.sql

for P in ${PACKAGES[@]}; do
  FOLDER=$HEAD$P
  mkdir $FOLDER
  mysql --defaults-extra-file=my-extra.cnf < $P/taxon.sql > $CURRENT_DIR/$FOLDER/taxon.txt
  mysql --defaults-extra-file=my-extra.cnf < $P/description.sql > $CURRENT_DIR/$FOLDER/description.txt
  mysql --defaults-extra-file=my-extra.cnf < $P/vernacularName.sql > $CURRENT_DIR/$FOLDER/vernacularName.txt
  
  if [ $P == "iucn" ]; then
    mysql --defaults-extra-file=my-extra.cnf < $P/distribution.sql > $CURRENT_DIR/$FOLDER/distribution.txt
  fi

  cp $P/meta.xml $FOLDER/meta.xml
  cp $P/eml.xml $FOLDER/eml.xml

  zip -r $FOLDER.zip $FOLDER
done

