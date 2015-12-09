#!/bin/sh

# Show Account Info
#
# ex)
# sh ac.sh mameko test

SITE_ALIAS=$1
ENV=$2
CONFIG="projects.yaml"

PROJECT=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['project']")
IP=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['ip']")
ID=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['id']")
PW=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['pw']")

DIGEST_ID=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['digest']['id']")
DIGEST_PW=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['digest']['pw']")



echo "\n[PROJECT]  ${PROJECT}\n[ENV]      ${ENV}\n"

echo "--- Server Info ---"
echo " ip : ${IP} \n id : ${ID} \n pw : ${PW} \n"

echo "--- Digest Authentication ---"
echo " id : ${DIGEST_ID} \n pw : ${DIGEST_PW}"
