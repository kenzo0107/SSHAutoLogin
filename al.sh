#!/bin/sh

# Auto Login By SSH

SITE_ALIAS=$1
ENV=$2
CONFIG="projects.yaml"

PROJECT=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['project']")
IP=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['ip']")
ID=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['id']")
PW=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['pw']")
PT=$(ruby -ryaml -e "puts YAML.load(open('${CONFIG}').read)['${SITE_ALIAS}']['${ENV}']['pt']")


echo "\nconnect to ${PROJECT} : ${ENV} ...\n" 

expect -c "
set timeout 10
spawn ssh ${ID}@${IP} -p ${PT}
expect \"Are you sure you want to continue connecting (yes/no)?\" {
    send \"yes\n\"
    expect \"${ID}@${IP}'s password:\"
    send \"${PW}\n\"
} \"${id}@${IP}'s password:\" {
    send \"${PW}\n\"
}
interact
"
