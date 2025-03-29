Hey! Really enjoyed reading your paper and am learned a lot about global image geolocation. I've chosen to attempt to recreate your results, but using a much [simlier dataset](https://www.kaggle.com/datasets/josht000/osv-mini-129k) that I built for a gradute ML class. Think I've bitten off more than I can chew as there's not even a how to guide!

Would you mind filling in some of my understanding on how to get going with this project using a dataset like streetview cropped or OpenStreetView5M and your PIGEOTTO model?


PIGEOTTO:
    - Uses YFCC pretraining ~ 4Million images
    - Uses location, climate, and traffic direction in pretraining image caption.
    - Pretraining has all layers unfrozen.
    - Finetuning has only the last CLIP layer unfrozen. 
    - At least one linear layer on top of CLIP's vision encoder to predict geocells. 
    - 8 Auxillary prediction tasks:
        1. cross entropy classifcation for 28 climiate class IDs.
        2. cross entropy month (season) 
        3. MSE regression: temperature
        4. MSE regression: percipitation
        5. MSE regression: elevation
        6. MSE regression: population density
        7. haversine loss: latitude
        8. haversine loss: longitude

1. Run get_auxilary_data.sh which gets political boundaries, population density data, climate data. (modifed by me)
    * Outputs saved to:
        - data/geocells
        - data/gadm
        - data/pop_density
        - data/koppen_geiger
2. Obtain driving side dataset. (I just forced it to return right side since all my data is US based.)
3. Download the mp_16 / yfcc dataset.
4. python run.py pretrain clip --yfcc
5. Obtain synthetic pretraining data. This will be for your pretraining dataset. Authors used a proprietary dataset so this cannot be reproduced. Scripts and format to do this not included. 
6. Get the street driving side dataset


# Other Projects

1. [G3](https://github.com/Applied-Machine-Learning-Lab/G3) Has the mp_16 link and training code. 
2. [clip B/32](https://huggingface.co/openai/clip-vit-base-patch32/tree/main) 606 MB model; 40GB A100, bs=416 per GPU
3. [clip L/14](https://huggingface.co/openai/clip-vit-large-patch14/tree/main) 1.71 GB model; A100 GPU, bs=224 per GPU
4. [MP16-Pro hugging face](https://huggingface.co/datasets/Jia-py/MP16-Pro) ~ 450 GB; Over 4 Million geotagged images from Flickr. Linked from G3 repo. This is essentially the mp_16 images aka yfcc.