#!/bin/bash

ARGC=$#
NARGS=5

if [ $ARGC -ne $NARGS ]; then
    echo
    echo "Usage: trjconv.sh [epath] [grofilepath] [harvestfilepath] [harvesttime] [outfilepath]"
    echo "This must be run from the main level of each interface ensemble"
    echo
    return
fi

epath=$1
grofilepath=$2
harvestfilepath=$3
harvesttime=$4
outfilepath=$5

cd $epath

# Harvest config
module purge
source /home/sarupria/shared/software/load_scripts/load_gromacs-4.5.5.sh
export OMP_NUM_THREADS=1
trjconv -s ${grofilepath} -f ${harvestfilepath} -vel -dump ${harvesttime} -o ${outfilepath} <<< "System"
oldgro=`sed -e 's/\.gro/_old.gro/g' <<<"$outfilepath"`
cp $outfilepath $oldgro


