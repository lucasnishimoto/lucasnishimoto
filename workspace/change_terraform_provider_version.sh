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
UPGRADE_FILE_INDEX="01"
UPGRADE_FILE_SUFFIX="PROVIDER_TO_UPGRADE_"
#---------------------------------------------------------------------------------------
#FILES_TO_CHANGE=$(grep -R "source  = \"${PROVIDER_TO_FIND}\"" * | cut -f1 -d:)
FILES_TO_CHANGE=$(cat ${UPGRADE_FILE_SUFFIX}${UPGRADE_FILE_INDEX})
#---------------------------------------------------------------------------------------
function send_to_hell(){
    if sed -i "s/${VERSION_TO_FIND}/${VERSION_TO_CHANGE}/g" ${FILE_TO_CHANGE}; then
        git add ${FILE_TO_CHANGE}
        git commit -m "Upgrading AWS provider to ${VERSION_TO_CHANGE}"
        git push --set-upstream upgrade/${BRANCH_NAME}
        gh pr create --assignee @me --draft --title "Upgrading AWS provider to ${VERSION_TO_CHANGE} in file ${FILE_TO_CHANGE}" --body "Upgrading AWS provider to ${VERSION_TO_CHANGE} in file ${FILE_TO_CHANGE}, with card ID ${KANBANIZE_CARD_ID} (${KANBANIZE_CARD_SUMMARY})"
    fi
}

function find_atlantis_project(){
    ALL_ATLANTIS_PROJECTS_DIR=$(grep dir ${ATLANTIS_FILE} | awk '{print $2}')
    for ATLANTIS_PROJECT_DIR in $ALL_ATLANTIS_PROJECTS_DIR; do
      if [[ ${FILE_TO_CHANGE} == *"${ATLANTIS_PROJECT_DIR}"* ]]; then
        RUN_THIS_PROJECT_PLIZ=$(grep -B1 ${ATLANTIS_PROJECT_DIR} ${ATLANTIS_FILE} | awk '{print $3}')
      fi      
    done
}

function send_a_divine_message(){
  gh pr comment -b "atlantis plan -p ${RUN_THIS_PROJECT_PLIZ}"
}
#---------------------------------------------------------------------------------------
ssh-add ~/.ssh/RemessaOnline20220816
cd ${EXECUTION_DIR}
#---------------------------------------------------------------------------------------
for FILE_TO_CHANGE in $FILES_TO_CHANGE; do
  echo ">> File: ${FILE_TO_CHANGE}"
  echo ">> Git update process"
  git checkout master
  git fetch --all; git pull
  echo ">> Define git branch for file change:"
  BRANCH_NAME=$(echo "${FILE_TO_CHANGE}" | sed 's/\//-/g' | sed 's/-_backend.tf//g')
  echo $BRANCH_NAME  
  if git checkout -b upgrade/${BRANCH_NAME}; then
    echo ">> New branch creation"
    echo ">> Find version ${VERSION_TO_FIND} in file ${FILE_TO_CHANGE}"
    if grep "${VERSION_TO_FIND}" ${FILE_TO_CHANGE}; then
      echo ">> Version find in file, sending to hell"
      send_to_hell
    fi
  else
    echo ">> Ops, branch exists, doing checkout"
    git checkout upgrade/${BRANCH_NAME}
    echo ">> Find version ${VERSION_TO_FIND} in file ${FILE_TO_CHANGE}"
    if grep "${VERSION_TO_FIND}" ${FILE_TO_CHANGE}; then
      echo ">> Version find in file, sending to hell"    
      send_to_hell
    fi    
  fi
  echo ">> Now, we'll find atlantis project for changes in file ${FILE_TO_CHANGE}"
  if find_atlantis_project; then
     echo ">> Atlantis project for file ${FILE_TO_CHANGE} is ${RUN_THIS_PROJECT_PLIZ}"
     echo ">> Sending a messsage to PR, run a plan for this project:"
     echo ">> ${RUN_THIS_PROJECT_PLIZ}"
     send_a_divine_message
  fi
done
