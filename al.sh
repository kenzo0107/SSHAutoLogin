#!/bin/sh

SITE_ALIAS=$1
echo "SITE_ALIAS:${SITE_ALIAS}"

CONFIG="projects.yaml"

PROJECT=$(ruby -ryaml -e 'puts YAML.load(open("${CONFIG}").read)["${SITE_ALIAS}"]["project"]')
echo "PROJECT:${PROJECT}"

exit
 
auto_ssh() {
host=$1
id=$2
pass=$3
 
expect -c "
set timeout 10
spawn ssh ${id}@${host}
expect \"Are you sure you want to continue connecting (yes/no)?\" {
    send \"yes\n\"
    expect \"${id}@${host}'s password:\"
    send \"${pass}\n\"
} \"${id}@${host}'s password:\" {
    send \"${pass}\n\"
}
interact
"
}
