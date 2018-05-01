#!/bin/bash
nohup jupyter notebook --no-browser --ip 0.0.0.0 --port 8888 --notebook-dir=/home/ubuntu/nbs > jupyter.out &
nohup tensorboard --host 0.0.0.0 --port 8889 --logdir=/home/ubuntu/nbs/mhuang/keras_tutorial/logs/mnist_tensorboard > tensorboard.out &

