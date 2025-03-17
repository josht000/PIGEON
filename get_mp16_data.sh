# taken from https://github.com/ewanowara/geolocalization

wget https://github.com/TIBHannover/GeoEstimation/releases/download/v1.0/mp16_urls.csv -O data/mp_16/mp16_urls.csv
wget https://github.com/TIBHannover/GeoEstimation/releases/download/pytorch/yfcc25600_urls.csv -O data/mp_16/yfcc25600_urls.csv 
python data/download_images.py --output resources/images/mp16 --url_csv data/mp_16/mp16_urls.csv --shuffle
python data/download_images.py --output resources/images/yfcc25600 --url_csv data/mp_16/yfcc25600_urls.csv --shuffle --size_suffix ""

# assign cell(s) for each image using the original meta information
wget https://github.com/TIBHannover/GeoEstimation/releases/download/v1.0/mp16_places365.csv -O data/mp_16/mp16_places365.csv
wget https://github.com/TIBHannover/GeoEstimation/releases/download/pytorch/yfcc25600_places365.csv -O data/mp_16/yfcc25600_places365.csv
python data/assign_classes.py

# remove images that were not downloaded 
python data/filter_by_downloaded_images.py