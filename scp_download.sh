#!/bin/sh

# Auto Download via SCP
#
# ex)
# sh scp_download.sh mameko test /home/centos/tmp.conf ~/tmp/

SITE_ALIAS=$1
ENV=$2
TARGET_DIR=$3
BACKUP_DIR=$4
CONFIG="projects.yaml"

PROJECT=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['project']")
IP=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['ip']")
ID=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['id']")
PW=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['pw']")

echo "\n connect to ${PROJECT} : ${ENV} ...\n" 

echo "\n Download ${TARGET_DIR} to ${BACKUP_DIR} \n"

expect -c "
set timeout 10
spawn scp -Cpqr ${ID}@${IP}:${TARGET_DIR} ${BACKUP_DIR}
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
