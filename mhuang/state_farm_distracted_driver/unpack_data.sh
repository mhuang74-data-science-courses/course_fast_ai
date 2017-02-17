#unpacks Kaggle State Farm imgs.zip to directories suitable for Keras 
# this script also cp subset of files from 'train' and 'test' directories to create 'sample' directory
KAGGLE_DATA_PATH="$HOME/downloads/data/kaggle_state_farm_distracted_driver"
mkdir data
cd data

unzip -q $KAGGLE_DATA_PATH/imgs.zip

##### fix up TEST directory #####
cd test
mkdir unknown
mv * unknown
cd ..
##### fix up TEST directory #####



##### start VALIDATION SET #####

# data unpacts into 'train' directory, which we will separate images from drivers into 'valid' directory
rm -rf valid
mkdir valid
unzip -q $KAGGLE_DATA_PATH/driver_imgs_list.csv.zip
# cat driver_imgs_list.csv | awk -F',' '{print $1}' | uniq -c | sort -nr
# select drivers p081, p012, p064 to be in validation set

cd train
# first copy _all_  selected valid imgs over to 'valid' directory
egrep "p081|p012|p064" ../driver_imgs_list.csv | awk -F',' '{print $2 "/" $3;}' | xargs cp --parents -p -t ../valid
# then remove them from 'train' directory
egrep "p081|p012|p064" ../driver_imgs_list.csv | awk -F',' '{print $2 "/" $3;}' | xargs rm

cd ..

##### end VALIDATION SET #####


##### start SAMPLE SET #####

# now copy a subset of 'train', 'valid' and 'test' into sample directory
rm -rf sample
mkdir sample

# train
find train -name "*.jpg" | shuf -n500 | xargs cp -p --parent -t sample 
# valid
find valid -name "*.jpg" | shuf -n100 | xargs cp -p --parent -t sample 
# test
find test -name "*.jpg" | shuf -n25 | xargs cp -p --parent -t sample 

##### end SAMPLE SET #####



