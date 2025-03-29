#! /bin/bash

sudo apt-get update

sudo apt-get install -y gdal-bin libgdal-dev python3-gdal

~/envs/pigeon/bin/python3 -m pip install gdal[numpy]=="$(gdal-config --version).*"

~/envs/pigeon/bin/python3 -m pip install -r frozen_reqs.txt