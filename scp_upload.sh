#!/bin/sh

# Auto Download via SCP
#
# ex)
# sh scp_upload.sh mameko test <local file> <remote path> 

SITE_ALIAS=$1
ENV=$2
LOCAL_FILE=$3
REMOTE_PATH=$4
CONFIG="projects.yaml"

PROJECT=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['project']")
IP=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['ip']")
ID=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['id']")
PW=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['pw']")

echo "\n connect to ${PROJECT} : ${ENV} ...\n" 

echo "\n Upload ${LOCAL_FILE} to ${REMOTE_PATH} \n"

expect -c "
set timeout 10
spawn scp ${LOCAL_FILE} ${ID}@${IP}:${REMOTE_PATH}
expect {
\" Are you sure you want to continue connecting (yes/no)? \" {
send \"yse\r\"
expect \"password:\"
send \"${PW}\r\"
} \"password:\" {
send \"${PW}\r\"
}
}
interact
"

echo "Finish."
