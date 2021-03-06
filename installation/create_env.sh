#!/bin/bash

BASEDIR="$(dirname "$0")"

ENV=VitaminD_MR
# shellcheck source=/dev/null
set +eu \
  && PS1='$$$ ' \
  && . "$(conda info --base)"/etc/profile.d/conda.sh \
  && conda activate base \
  && conda install -y -c conda-forge mamba 
#set -eu;

conda deactivate || echo "no active environment"
conda env remove -n ${ENV} || echo "couldn't remove environment ${ENV}"
conda create -y -n ${ENV}  || echo "it seem that environment ${ENV} is already present"

#set +eu
mamba env update -q \
	--file "$BASEDIR"/environment.yaml 
#set -eu

echo CREATED the environment ${ENV}
