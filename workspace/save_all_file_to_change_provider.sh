#!/bin/bash
#set -x
#---------------------------------------------------------------------------------------
EXECUTION_DIR="beetech-infrastructure"
PROVIDER_TO_FIND="hashicorp/aws"
VERSION_TO_FIND="3.75.1"
VERSION_TO_CHANGE="4.26.0"
KANBANIZE_CARD_ID="106374"
KANBANIZE_CARD_SUMMARY="Upgrade provider AWS to ${VERSION_TO_CHANGE}"
ATLANTIS_FILE="atlantis.yaml"
#---------------------------------------------------------------------------------------
FILES_TO_CHANGE=$(grep -R "source  = \"${PROVIDER_TO_FIND}\"" * | cut -f1 -d:)

rm ALL_FILE_TO_CHANGE.lst
#echo $FILES_TO_CHANGE > ALL_FILE_TO_CHANGE.lst

for FILE_TO_CHANGE in $FILES_TO_CHANGE; do
  echo "$FILE_TO_CHANGE" >> ALL_FILE_TO_CHANGE.lst
done

sed -i "s/${EXECUTION_DIR}\///g" ALL_FILE_TO_CHANGE.lst

split --lines=20 --numeric-suffixes --suffix-length=2 ALL_FILE_TO_CHANGE.lst PROVIDER_TO_UPGRADE_
