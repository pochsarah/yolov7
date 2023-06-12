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


#python -u test.py --weights /share/castor/home/e1800093/yolov7/baseline_240/train/run0/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project results/test --name baseline --iou-thres 0.5
#/share/castor/home/e1800093/yolov7/exp_avg/train/run0_2_3_4_5_6_7_8_9_10_11_12_13_14/weights/best.pt

python -u train_loop.py --weights 50_average/train/avg0_2_3_4_2_3_4_5_6_7/weights/best.pt --cfg cfg/training/yolov7.yaml --data data/50_average.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project 50_average/train --name avg0_2_3_4_2_3_4_5_6_7_8 --save-txt --save-conf --task test --aggreg average

