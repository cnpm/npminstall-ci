#!/usr/bin/env sh

ROOT=`pwd`
npminstall=${ROOT}/node_modules/.bin/npminstall

for name in $( cat repos.txt ); do
    echo "testing ${name}"
    project="tmp/${name}"
    rm -rf ${project}
    mkdir -p ${project}
    git clone https://github.com/${name}.git --depth=1 ${project}
    cd ${project}
    ${npminstall}
    time npm test || exit $?
    cd ${ROOT}
    rm -rf tmp
done
