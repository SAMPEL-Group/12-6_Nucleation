## Nucleation of Lennard-Jones Particles (12-6) 

This directory contains scripts to run Replica Exchange Transition Interface Sampling (RETIS) of Lennard-Jones (12-6) particles nucleation. 

## Contents
```bash
.
├── README.md                           # This file
├── run-retis-msi.sh                    # Shell script to submit RETIS to the computing cluster (SLURM)
├── global-manager.py                   # The main Python script to run RETIS
├── masters/                            # Input directory (contains: .top, .mdp, initial path files for jump start RETIS)
├── op/                                 # Directory that house the OP code for RETIS. The OP calculates the largest nucleus size using protocols from ten Wolde et al. J. Chem. Phys. 1996, 104, 9932-9947 
└── scripts/                            # Utility directory that global-manager.py calls to run GROMACS and perform OP calculation

```

## Dependencies 
- GROMACS 4.5.5
- Numpy
- Dask

