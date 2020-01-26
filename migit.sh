#!/bin/bash

usage() {
    echo "Welcome from Migit."
    echo "Before starting you must have access to git server for read and write !"
    echo "Usage:"
    echo "  If your repo is on git server:"
    echo "    ./migit.sh {Actual git repository URL} {New git repository URL}"
    echo "  If your repo is on your computer:"
    echo "    ./migit.sh {Repository path} {New git repository URL}"
}

localRepo() {
    echo "Local repository mode."
    cd $2
    git fetch --tags
    git remote rm origin
    git remote add origin $2
    git push origin --all
    git push --tags
}

remoteRepo() {
    echo "Remote repository mode."
    FOLDER="/tmp/"$$

    git clone --mirror $1 $FOLDER
    cd $FOLDER
    git fetch --tags
    git remote rm origin
    git remote add origin $2
    git push origin --all
    git push --tags
    # cd -
    rm -rf $FOLDER
}

if [[ "$#" !=  "2" ]]
then
    usage
    exit 1
fi

if [[ $1 == *"@"* ]]
    then
        remoteRepo
        exit 0
    else
        localRepo
        exit 0
fi
