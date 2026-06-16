#!/bin/bash
#SBATCH --job-name=WERFL_WALL_V1_again
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err
#SBATCH --partition=nocona
#SBATCH --nodes=2
#SBATCH --ntasks=256
#SBATCH --time=48:00:00
#SBATCH --mail-user=has24395@ttu.edu
#SBATCH --mail-type=ALL

module load gcc/10.1.0 
module load openmpi/4.1.4
  
cd
cd ~/spack/
. share/spack/setup-env.sh
spack load openfoam-org
  
cd
cd ~/Wall_v1_again_fixed


mpirun -np $SLURM_NTASKS pisoFoam -parallel > log.pisoFoam 2>&1
