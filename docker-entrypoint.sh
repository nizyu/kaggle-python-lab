#!/bin/sh

touch requirements.txt
pip install --no-cache-dir --user jupyter -r requirements.txt

[ -z "${HTTP_PROXY}" ] || kaggle config set -n proxy -v ${HTTP_PROXY}
kaggle competitions download $KAGGLE_COMPETITION -p ./work/inputs

exec jupyter lab --ip=0.0.0.0 $@ /home/jupyter/work
