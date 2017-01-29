echo 'Downloading v5 chef repository'
git clone https://github.com/engineyard/ey-cookbooks-stable-v5

echo "Copying $1 to cookbooks path"
cp -R ey-cookbooks-stable-v5/examples/$1/cookbooks/custom-$1 cookbooks

echo "Adding $1 recipe"
echo "include_recipe 'custom-$1'" >> ./cookbooks/ey-custom/recipes/after-main.rb
echo "depends 'custom-$1'" >> ./cookbooks/ey-custom/metadata.rb

echo "Cleaning up"
rm -rf ey-cookbooks-stable-v5
