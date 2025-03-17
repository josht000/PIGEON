Hey! Really enjoyed reading your paper and am learned a lot about global image geolocation. I've chosen to attempt to recreate your results, but using a much [simlier dataset](https://www.kaggle.com/datasets/josht000/osv-mini-129k) that I built for a gradute ML class. Think I've bitten off more than I can chew as there's not even a how to guide!

Would you mind filling in some of my understanding on how to get going with this project using a dataset like streetview cropped or OpenStreetView5M and your PIGEOTTO model?

1. Run get_auxilary_data.sh which gets political boundaries, population density data, climate data. (modifed by me)
    * Outputs saved to:
        - data/geocells
        - data/gadm
        - data/pop_density
        - data/koppen_geiger
2. Obtain driving side dataset. (I just fored it to return right side since all my data is US based.)
3. python run.py pretrain clip --yfcc
3. Obtain synthetic pretraining data. This will be for your pretraining dataset. Authors used a proprietary dataset so this cannot be reproduced. Scripts and format to do this not included. 
4. Get the street driving side dataset