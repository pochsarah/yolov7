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

#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_8.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_8 --device 0 --single-cls --nosave
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_9.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_9 --device 0 --single-cls --nosave
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_10.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_10 --device 0 --single-cls --nosave
python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_1.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_1_evolve --device 0 --single-cls --nosave --evolve
python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_2.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_2_evolve --device 0 --single-cls --nosave --evolve
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_3.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_3_evolve --device 0 --single-cls --nosave --evolve
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_4.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_4_evolve --device 0 --single-cls --nosave --evolve
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_5.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_5_evolve --device 0 --single-cls --nosave --evolve
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_6.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_6_evolve --device 0 --single-cls --nosave --evolve
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_7.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_7_evolve --device 0 --single-cls --nosave --evolve
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_8.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_8_evolve --device 0 --single-cls --nosave --evolve
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_9.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_9_evolve --device 0 --single-cls --nosave --evolve
#python -u train.py --img-size 416 --hyp data/hyp.scratch.custom.yaml --cfg cfg/training/yolov7.yaml --data data/subset_10.yaml --weights yolov7_training.pt --workers 4 --project v4/train --name baseline_sub_10_evolve --device 0 --single-cls --nosave --evolve
