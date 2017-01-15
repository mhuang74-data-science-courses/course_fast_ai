#unpacks Kaggle train.zip and test.zip to directories suitable for Keras 
# this script mv files from 'train' to create 'valid' directory
# this script also cp subset of files from 'train' and 'valid' directories to create 'sample' directory
unzip -q ../downloads/train.zip
unzip -q ../downloads/test.zip
mkdir -p train/dogs train/cats
mv train/dog.* train/dogs
mv train/cat.* train/cats
mkdir -p valid/cats valid/dogs
shuf -zn1000 -e train/dogs/*.jpg | xargs -0 mv -t valid/dogs
shuf -zn1000 -e train/cats/*.jpg | xargs -0 mv -t valid/cats
mkdir -p sample/train/dogs sample/train/cats sample/valid/dogs sample/valid/cats
shuf -zn100 -e train/dogs/*.jpg | xargs -0 cp -t sample/train/dogs
shuf -zn100 -e train/cats/*.jpg | xargs -0 cp -t sample/train/cats
shuf -zn10 -e valid/dogs/*.jpg | xargs -0 cp -t sample/valid/dogs
shuf -zn10 -e valid/cats/*.jpg | xargs -0 cp -t sample/valid/cats
mkdir -p sample/test
shuf -zn50 -e test/*.jpg | xargs -0 cp -t sample/test
