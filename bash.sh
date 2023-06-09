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

rm data_cluster/al/*cache
#python -u test.py --weights /share/castor/home/e1800093/yolov7/exp_avg/train/run0_2_3_4_5_6_7_8_9_10_11_12_13_14/weights/best.pt --data data/al.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project results/test --name exp_avg --iou-thres 0.5

python -u test.py --weights /share/castor/home/e1800093/yolov7/exp_max/train/run0_2_3_4_5_6_7_8_9_10_11_12_13_14/weights/best.pt --data data/al.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project results/test --name exp_max --iou-thres 0.5
rm data_cluster/al/*cache
python -u test.py --weights /share/castor/home/e1800093/yolov7/exp_random/train/run0_2_3_4_5_6_7_8_9_10_11_12_13_14/weights/best.pt --data data/al.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project results/test --name exp_random --iou-thres 0.5

python -u test.py --weights /share/castor/home/e1800093/yolov7/10_90_average/train/run0_2_3_4_5_6_7_8_9_10_11_12_13_14/weights/best.pt --data data/10_90_average.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project results/test --name 10_90_avg --iou-thres 0.5

python -u test.py --weights /share/castor/home/e1800093/yolov7/10_90_sum/train/run0_2_3_4_5_6_7_8_9_10_11_12_13_14/weights/best.pt --data data/10_90_sum.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project results/test --name 10_90_sum --iou-thres 0.5

python -u test.py --weights /share/castor/home/e1800093/yolov7/10_90_random/train/run0_2_3_4_5_6_7_8_9_10_11_12_13_14/weights/best.pt --data data/10_90_random.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project results/test --name 10_90_random --iou-thres 0.5
