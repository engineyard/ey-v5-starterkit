echo "Adding a new cookbook $1 to cookbooks folder"
mkdir -p cookbooks/$1
mkdir -p cookbooks/$1/attributes
mkdir -p cookbooks/$1/files/default
mkdir -p cookbooks/$1/recipes
mkdir -p cookbooks/$1/templates/default

echo "Adding empty base files"
echo 'Fill with description' > cookbooks/$1/README.md
echo "name '$1'" > cookbooks/$1/metadata.rb
touch cookbooks/$1/attributes/default.rb
touch cookbooks/$1/recipes/default.rb


echo "Adding dependency to $1 recipe"
echo "include_recipe '$1'" >> ./cookbooks/ey-custom/recipes/after-main.rb
echo "depends '$1'" >> ./cookbooks/ey-custom/metadata.rb

