#!/bin/bash -l
#SBATCH --chdir=/share/castor/home/e1800093/master_thesis/yolov7
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task 4
#SBATCH --partition shortrun
#SBATCH --output /share/castor/home/e1800093/master_thesis/yolov7/slurm_thesis.out
#SBATCH --time=2-00:00:00
setcuda 11.7
conda activate yolov7
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/share/castor/home/e1800093/.conda/envs/yolov7/lib

python -u train.py --img-size 416 --epochs 1 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data subset_I.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_I --device cpu --single-cls


