#!/bin/bash -l
#SBATCH --chdir=/share/castor/home/e1800093/yolov7
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task 4
#SBATCH --partition shortrun
#SBATCH --output /share/castor/home/e1800093/yolov7/results.out
#SBATCH --time=2-00:00:00
setcuda 11.7
conda activate yolov7
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/share/castor/home/e1800093/.conda/envs/yolov7/lib


python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16 --iou-thres 0.5
#
python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7_8_9_10_11_12_13_14_15/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7_8_9_10_11_12_13_14_15 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7_8_9_10_11_12_13_14/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7_8_9_10_11_12_13_14 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7_8_9_10_11_12_13/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7_8_9_10_11_12_13 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7_8_9_10_11_12/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7_8_9_10_11_12 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7_8_9_10_11/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7_8_9_10_11 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7_8_9_10/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7_8_9_10 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7_8_9/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7_8_9 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7_8/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7_8 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5_6_7/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6_7 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5_6/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5_6 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4_5/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4_5 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3_4/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3_4 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2_3/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2_3 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0_2/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0_2 --iou-thres 0.5

python -u test.py --weights 10_max/train/max0/weights/best.pt --data data/dataset.yaml --img-size 416 --task test --device 0 --single-cls --verbose --project final/10_max --name max0 --iou-thres 0.5

