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

#custom - linear - sgd
#python -u train.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/subset_1.yaml --hyp data/hyp.scratch.custom.yaml --img-size 416 --device 0 --single-cls --workers 4 --project v5/train --name final_baseline_subset1_custom_linear_SGD --linear-lr
#python -u test.py --weights v5/train/final_baseline_subset1_custom_linear_SGD/weights/best.pt --data data/subset_1.yaml --img-size 416 --task test --device 0 --single-cls --save-txt --save-conf --project v5/test --name final_baseline_subset1_custom_linear_SGD
#rm -r data_cluster/baseline/subset_1/*.cache
#evolved - linear -sgd
#python -u train.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/subset_1.yaml --hyp data/hyp.scratch.evolved.yaml --img-size 416 --device 0 --single-cls --workers 4 --project v5/train --name final_baseline_subset1_evolved_linear_SGD --linear-lr
#python -u test.py --weights v5/train/final_baseline_subset1_evolved_linear_SGD/weights/best.pt --data data/subset_1.yaml --img-size 416 --task test --device 0 --single-cls --save-txt --save-conf --project v5/test --name final_baseline_subset1_evolved_linear_SGD
#rm -r data_cluster/baseline/subset_1/*.cache

#evolved - one cycle -sgd
#python -u train.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/subset_1.yaml --hyp data/hyp.scratch.evolved.yaml --img-size 416 --device 0 --single-cls --workers 4 --project v5/train --name final_baseline_subset1_evolved_onecycle_SGD
#rm -r data_cluster/baseline/subset_1/*.cache
#evolved - linear - adam
#python -u train.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/subset_1.yaml --hyp data/hyp.scratch.evolved.yaml --img-size 416 --device 0 --single-cls --workers 4 --project v5/train --name final_baseline_subset1_evolved_linear_Adam --linear-lr --adam
#rm -r data_cluster/baseline/subset_1/*.cache

#python -u train.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/subset_8.yaml --hyp data/hyp.scratch.evolved.yaml --img-size 416 --device 0 --single-cls --workers 4 --project v5/train --name final_baseline_subset8_evolved_linear_SGD --linear-lr
#python -u train.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/subset_9.yaml --hyp data/hyp.scratch.evolved.yaml --img-size 416 --device 0 --single-cls --workers 4 --project v5/train --name final_baseline_subset9_evolved_linear_SGD --linear-lr
#python -u train.py --weights yolov7_training.pt --cfg cfg/training/yolov7.yaml --data data/subset_10.yaml --hyp data/hyp.scratch.evolved.yaml --img-size 416 --device 0 --single-cls --workers 4 --project v5/train --name final_baseline_subset10_evolved_linear_SGD --linear-lr

python train_al.py --img-size 416 --epochs 12 --hyp data/hyp.scratch.evolved.yaml --cfg cfg/training/yolov7.yaml --data data/subset_test_al.yaml --weights yolov7_training.pt --workers 4 --project v7/train --project-test v7/test --name al_test --device 0 --single-cls --nosave --cache-images --task test --save-txt
