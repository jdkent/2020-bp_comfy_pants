#!/usr/bin/env bash

conda env create -f environment.yml
conda init bash
. ~/.bashrc
conda activate comfy_pants
ipython kernel install --user --name=comfy_pants
