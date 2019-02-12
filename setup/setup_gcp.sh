## Deep Learning Jupyter VM for course.fast.ai

export ZONE="asia-east1-a"
export INSTANCE_NAME="my-fastai-gpu"

#export IMAGE_FAMILY="pytorch-latest-cpu" #budget
export IMAGE_FAMILY="pytorch-latest-gpu" 

export INSTANCE_TYPE="n1-highmem-4" #budget
#export INSTANCE_TYPE="n1-highmem-8" 

export ACCELERATOR="type=nvidia-tesla-k80,count=1" #budget
#export ACCELERATOR="type=nvidia-tesla-p4,count=1"

export DISK_SIZE="100GB"

gcloud compute instances create $INSTANCE_NAME \
        --zone=$ZONE \
        --image-family=$IMAGE_FAMILY \
        --image-project=deeplearning-platform-release \
        --maintenance-policy=TERMINATE \
        --accelerator=$ACCELERATOR \
        --machine-type=$INSTANCE_TYPE \
        --boot-disk-size=$DISK_SIZE \
        --metadata="install-nvidia-driver=True" \
        --preemptible