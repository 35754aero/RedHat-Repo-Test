#!/bin/bash

REPOS=("rhel-8-for-x86_64-baseos-rpms")

DEST_DIR="/mnt/repos"

mkdir -p ${DEST_DIR}

for repo in "${REPOS[@]}"; do
    echo "Syncing repository: ${repo}"
    reposync --gpgcheck -l -n -p ${DEST_DIR} --repoid=${repo} --download-metadata
done

echo "Repo sync complete."
