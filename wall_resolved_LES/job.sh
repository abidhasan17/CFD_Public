#!/bin/bash
#SBATCH --job-name=WERFL_OF11
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err
#SBATCH --partition=nocona
#SBATCH --nodes=4
#SBATCH --ntasks=512
#SBATCH --time=48:00:00
#SBATCH --mail-user=has24395@ttu.edu
#SBATCH --mail-type=ALL

set -e

module purge
module load ansys/v241
module load gcc/14.2.0
module load openmpi/5.0.5
module load openfoam-org/11

export MPI_BUFFER_SIZE=20000000

cd ~/wall_v2

chmod +x ./Allclean
chmod +x ./Allrunpar

./Allrunpar > log.Allrunpar 2>&1
