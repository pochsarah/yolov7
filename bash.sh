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


python -u test.py --weights /share/castor/home/e1800093/yolov7/exp/train/run0_2_3_4_5_6_7_8_9_10_11_12_13_14/weights/best.pt --data data/al.yaml --img-size 416 --task test --device 0 --single-cls --verbose --results/test --name exp