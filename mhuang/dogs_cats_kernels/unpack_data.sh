#unpacks Kaggle train.zip and test.zip to directories suitable for Keras 
# this script mv files from 'train' to create 'valid' directory
# this script also cp subset of files from 'train' and 'valid' directories to create 'sample' directory
KAGGLE_DATA_PATH="$HOME/downloads/data/kaggle_dogs_cats_kennel"
rm -r data
mkdir data
cd data
unzip -q $KAGGLE_DATA_PATH/train.zip
unzip -q $KAGGLE_DATA_PATH/test.zip
mkdir -p train/dogs train/cats test/unknown
# set up traing dir
mv train/dog.* train/dogs
mv train/cat.* train/cats
# set up test dir
mv test/* test/unknown/
# move some files over to valid dir
mkdir -p valid/cats valid/dogs
shuf -zn1000 -e train/dogs/*.jpg | xargs -0 mv -t valid/dogs
shuf -zn1000 -e train/cats/*.jpg | xargs -0 mv -t valid/cats

# copy subset of files to sample directory
mkdir -p sample/train/dogs sample/train/cats sample/valid/dogs sample/valid/cats
shuf -zn100 -e train/dogs/*.jpg | xargs -0 cp -t sample/train/dogs
shuf -zn100 -e train/cats/*.jpg | xargs -0 cp -t sample/train/cats
shuf -zn20 -e valid/dogs/*.jpg | xargs -0 cp -t sample/valid/dogs
shuf -zn20 -e valid/cats/*.jpg | xargs -0 cp -t sample/valid/cats

# copy subset of test files to sample/test
mkdir -p sample/test/unknown
shuf -zn50 -e test/unknown/*.jpg | xargs -0 cp -t sample/test/unknown
