# README
## To start using aws cli, switch to aws python virtualenv, and then source aws-alias
```
 source activate aws
 source aws-alias.sh
```

## To create new env for latest Keras, Tensorflow, and Python 3.6

Please note numpy 1.13 is required to play well with h5py 2.7.1
```
 conda create -n keras2_tf16_py36 python=3.6 anaconda
 source activate keras2_tf16_py36
 conda install -c anaconda tensorflow keras numpy=1.13
 conda install -c conda-forge nb_conda nb_conda_kernels
```

## To create equivalent env for GPU

```
 conda create -n gpu_keras2_tf16_py36 python=3.6 anaconda
 source activate gpu_keras2_tf16_py36
 conda install -c anaconda tensorflow-gpu keras-gpu numpy=1.13
 conda install -c conda-forge nb_conda nb_conda_kernels 
```
