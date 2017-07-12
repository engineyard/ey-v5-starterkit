#!/bin/bash

function cleanup()
{
  echo "Cleaning up"
  rm -rf ey-cookbooks-stable-v5
}

echo 'Downloading v5 chef repository'
git clone https://github.com/engineyard/ey-cookbooks-stable-v5

if [ -d ey-cookbooks-stable-v5/custom-cookbooks/$1/cookbooks/custom-$1 ]; then
  echo "Copying $1 to cookbooks path"
  cp -R ey-cookbooks-stable-v5/custom-cookbooks/$1/cookbooks/custom-$1 cookbooks

  echo "Adding $1 recipe"
  echo "include_recipe 'custom-$1'" >> ./cookbooks/ey-custom/recipes/after-main.rb
  echo "depends 'custom-$1'" >> ./cookbooks/ey-custom/metadata.rb
  cleanup
  exit 0
else
  echo "! NO SUCH RECIPE AS $1"
  cleanup
  exit 1
fi
