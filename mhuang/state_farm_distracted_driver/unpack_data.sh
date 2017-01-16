#unpacks Kaggle State Farm imgs.zip to directories suitable for Keras 
# this script also cp subset of files from 'train' and 'test' directories to create 'sample' directory
mkdir data
cd data
unzip -q ~/downloads/data/kaggle_state_farm_distracted_driver/imgs.zip

# data unpacts into 'train' directory, which we will separate images from drivers into 'valid' directory
rm -rf valid

# now copy a subset of 'train', 'valid' and 'test' into sample directory
rm -rf sample


# sample/train
mkdir -p sample/train/c0
mkdir -p sample/train/c1
mkdir -p sample/train/c2
mkdir -p sample/train/c3
mkdir -p sample/train/c4
mkdir -p sample/train/c5
mkdir -p sample/train/c6
mkdir -p sample/train/c7
mkdir -p sample/train/c8
mkdir -p sample/train/c9

# do shuffle-copy independently for each of the 10 categories
shuf -zn32 -e train/c0/*.jpg | xargs -0 cp -t sample/train/c0
shuf -zn32 -e train/c1/*.jpg | xargs -0 cp -t sample/train/c1
shuf -zn32 -e train/c2/*.jpg | xargs -0 cp -t sample/train/c2
shuf -zn32 -e train/c3/*.jpg | xargs -0 cp -t sample/train/c3
shuf -zn32 -e train/c4/*.jpg | xargs -0 cp -t sample/train/c4
shuf -zn32 -e train/c5/*.jpg | xargs -0 cp -t sample/train/c5
shuf -zn32 -e train/c6/*.jpg | xargs -0 cp -t sample/train/c6
shuf -zn32 -e train/c7/*.jpg | xargs -0 cp -t sample/train/c7
shuf -zn32 -e train/c8/*.jpg | xargs -0 cp -t sample/train/c8
shuf -zn32 -e train/c9/*.jpg | xargs -0 cp -t sample/train/c9

# sample/test
mkdir -p sample/test
shuf -zn50 -e test/*.jpg | xargs -0 cp -t sample/test
