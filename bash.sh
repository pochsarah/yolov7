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

#python -u train.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/dataset.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 240 --img-size 416 --device 0 --single-cls --workers 4 --project baseline/train --name baseline

#TODO
#python -u train_loop.py --weights 10_max/train/max0_2_3_4_2_3_4_5/weights/best.pt --cfg cfg/training/yolov7.yaml --data data/10_90_maximum.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project 10_max/train --name max0_2_3_4_2_3_4_5_6 --save-txt --save-conf --task test --aggreg maximum

python -u train_loop.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/50_sum.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project sum_FL/train --name summ0 --save-txt --save-conf --task test --aggreg sum
python -u train_loop.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/50_average.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project avg_FL/train --name avg0 --save-txt --save-conf --task test --aggreg average
python -u train_loop.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/50_maximum.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project max_FL/train --name max0 --save-txt --save-conf --task test --aggreg maximum
python -u train_loop.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/50_random.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project random_FL/train --name random0 --save-txt --save-conf --task test --aggreg random

