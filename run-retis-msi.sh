#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks-per-node=128
#SBATCH -t 96:00:00
#SBATCH --job-name=LJRETIS
#SBATCH -e stderr-lj
#SBATCH -o stdout-lj
#SBATCH  -p msismall
#SBATCH --mem=40g

module load conda
source activate base
conda activate daskenv

export OMP_NUM_THREADS=1

python global-manager.py
