#!/bin/bash -l
#SBATCH --chdir=/share/castor/home/e1800093/yolov7
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task 4
#SBATCH --partition shortrun
#SBATCH --output /share/castor/home/e1800093/yolov7/10_90.out
#SBATCH --time=2-00:00:00
setcuda 11.7
conda activate yolov7
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/share/castor/home/e1800093/.conda/envs/yolov7/lib



#python -u train.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/dataset.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 200 --img-size 416 --device 0 --single-cls --workers 4 --project baseline --name run1
#python -u train_loop.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/10_90_average.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project 10_90_average/train --name avg0 --save-txt --save-conf --task test --aggreg average

#python -u train_loop.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/10_90_sum.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project 10_90_sum/train --name sum0 --save-txt --save-conf --task test --aggreg sum

python -u train_loop.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/10_90_maximum.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project 10_90_max/train --name max0 --save-txt --save-conf --task test --aggreg maximum

#python -u train_loop.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/10_90_random.yaml --hyp data/hyp.scratch.evolved.yaml --epochs 15 --img-size 416 --device 0 --single-cls --workers 4 --project 10_90_random/train --name random0 --save-txt --save-conf --task test --aggreg random
