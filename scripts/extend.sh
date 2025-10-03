#!/bin/bash

ARGC=$#
NARGS=12

if [ $ARGC -ne $NARGS ]; then
    echo
    echo "Usage: extend.sh [epath] [grofilepath] [rstfilepath] \ "
    echo "       [nsteps] [moveid] [xtcfilepath] [opfilepath] [tprpath] [oldtprpath] [cptpath] [edrpath] "
    echo
    return
fi

epath=${1}
grofilepath=${2}
rstfilepath=${3}
nsteps=${4}
moveid=${5}
xtcfilepath=${6}
opfilepath=${7}
tprpath=${8}
oldtprpath=${9}
cptpath=${10}
edrpath=${11}
trrpath=${12}

cd $epath
# This is so the lammps simulation file 
# can read the restart file easily
cp ${rstfilepath} rst/active_in.cpt

module purge
source /home/sarupria/shared/software/load_scripts/load_gromacs-5.1.2.sh
export OMP_NUM_THREADS=1
# Run simulation
gmx convert-tpr -s ${oldtprpath} -extend 5.0 -o ${tprpath}
gmx mdrun -s ${tprpath} -ntmpi 16 -ntomp 1 -cpi rst/active_in.cpt -deffnm sim
mv sim.edr log/${moveid}.edr
mv sim.xtc ${xtcfilepath}
mv sim.trr ${trrpath}
mv sim.cpt rst/${moveid}.cpt
rm -f mdout.mdp sim.*
rm -f rst/active_in.cpt

module purge
source /home/sarupria/shared/software/load_scripts/load_gromacs-4.5.5.sh

# Analyze simulation
/home/sarupria/minhx010/bb-repos/ice/bulk-structure/q6-frenkel/g_q6localOP -s ${grofilepath} -f ${xtcfilepath} -rcut 1.5 -o ${opfilepath} <<< "0"

