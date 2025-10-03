## Nucleation of Lennard-Jones Particles (12-6) 

This directory contains scripts to run Replica Exchange Transition Interface Sampling (RETIS) of Lennard-Jones (12-6) particles nucleation. 

If you use codes from this repository, please cite the following publications:
> Minh, P.; Hall, S. W.; DeFever, R. S.; Sarupria, S. Crystal Nucleation Kinetics and Mechanism: Influence of Interaction Potential. J. Phys. Chem. B 2025, 129, 35, 8976–8990.

> Hall, S. W.; Díaz Leines, G.; Sarupria, S.; Rogal, J. Practical guide to replica exchange transition interface sampling and forward flux sampling. J. Chem. Phys. 2022, 156, 200901. 


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

