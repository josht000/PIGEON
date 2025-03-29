# Downloads data needed for data augmentation and training on auxiliary data.
# Ubuntu 22.04 has bunzip2 installed by default, but not unzip.

sudo apt-get install -y unzip

# OSV-Mini-129k
mkdir -p data/osv-mini-129k && cd data/osv-mini-129k
wget https://www.kaggle.com/api/v1/datasets/download/josht000/osv-mini-129k -O osv-mini-129k.zip
unzip osv-mini-129k.zip
mv osv5m/* ./ && rm -r osv5m && rm osv-mini-129k.zip && cd ../..

# Political boundaries
mkdir -p data/geocells
wget https://github.com/wmgeolab/geoBoundaries/raw/main/releaseData/CGAZ/geoBoundariesCGAZ_ADM2.geojson -O data/geocells/geoBoundariesCGAZ_ADM2.geojson
wget https://github.com/wmgeolab/geoBoundaries/raw/main/releaseData/CGAZ/geoBoundariesCGAZ_ADM1.geojson -O data/geocells/geoBoundariesCGAZ_ADM1.geojson
wget https://github.com/wmgeolab/geoBoundaries/raw/main/releaseData/CGAZ/geoBoundariesCGAZ_ADM0.geojson -O data/geocells/countries.geojson

# GADM Country Area Data
curl --create-dirs -O --output-dir data/gadm https://geodata.ucdavis.edu/gadm/gadm4.1/gadm_410-levels.zip
cd data/gadm
unzip gadm_410-levels.zip
rm gadm_410-levels.zip
cd ../..

# GHSL Population Density Data
curl --create-dirs -O --output-dir data/pop_density https://jeodpp.jrc.ec.europa.eu/ftp/jrc-opendata/GHSL/GHS_POP_GLOBE_R2022A/GHS_POP_E2020_GLOBE_R2022A_54009_1000/V1-0/GHS_POP_E2020_GLOBE_R2022A_54009_1000_V1_0.zip
cd data/pop_density
unzip GHS_POP_E2020_GLOBE_R2022A_54009_1000_V1_0.zip
rm GHS_POP_E2020_GLOBE_R2022A_54009_1000_V1_0.zip
cd ../..

# Koppen-Geiger Climate Zone Data
mkdir -p data/koppen_geiger && cd data/koppen_geiger
wget https://figshare.com/ndownloader/files/12407516 -O Beck_KG_V1.zip
unzip Beck_KG_V1.zip
rm Beck_KG_V1.zip
cd ../..

# YFCC100M Subset Data - just the tsv file
mkdir -p data/yfcc100m && cd data/yfcc100m  
wget https://openaipublic.azureedge.net/clip/data/yfcc100m_subset_data.tsv.bz2
bunzip2 yfcc100m_subset_data.tsv.bz2
cd ../..

