#!/bin/bash -l
#SBATCH --chdir=/share/castor/home/e1800093/yolov7
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task 4
#SBATCH --partition shortrun
#SBATCH --output /share/castor/home/e1800093/yolov7/slurm_thesis.out
#SBATCH --time=2-00:00:00
setcuda 11.7
conda activate yolov7
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/share/castor/home/e1800093/.conda/envs/yolov7/lib


#  --name test_layers --linear-lr

python -u train_loop.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/subset_test_al.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 20 --img-size 416 --device 0 --single-cls --workers 4 --project loop/train --name run1 --linear-lr --save-txt --save-hybrid --task test

