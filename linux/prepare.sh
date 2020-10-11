#!/bin/bash

tmp_dir=$(mktemp -d -t of-XXXXX)
of_dir='of'
if [ ! -d ./$of_dir ]; then

  wget https://openframeworks.cc/versions/v0.11.0/of_v0.11.0_linux64gcc6_release.tar.gz -q -O $tmp_dir/of.tar.gz

  mkdir $of_dir
  tar -xf $tmp_dir/of.tar.gz -C ./$of_dir
  mv ./$of_dir/of_v0.11.0_linux64gcc6_release/*  ./$of_dir
  rm -rf ./$of_dir/of_v0.11.0_linux64gcc6_release
fi

if [ ! -d ./$of_dir/addons/ofxUI ]; then
  git clone https://github.com/rezaali/ofxUI.git $tmp_dir/ofxUI

  mv $tmp_dir/ofxUI ./$of_dir/addons
fi

rm -rf $tmp_dir

sudo $of_dir/scripts/linux/ubuntu/install_dependencies.sh

