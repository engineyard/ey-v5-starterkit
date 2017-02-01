# ey-v5-starterkit
--

This is an empty repository that can be used as a starting point for your V5 custom chef recipes in Engine Yard Cloud. 

Depending on your preferences and development process, you can (a) maintain this as a separate repository, or (b) put this in a `/cookbooks` directory inside your application repository.

## Usage

1) Clone this repository

```
git clone git@github.com:engineyard/ey-v5-starterkit.git
```

2) Add recipes

The V5 custom chef recipes are in https://github.com/engineyard/ey-cookbooks-stable-v5/tree/master/examples. To add a recipe, run `bash add_recipe.sh <recipe_name>`. For example, to add the Resque recipe, run:

```
bash add_recipe.sh resque
```

The `add_recipe.sh` script will: 

- download the [V5 cookbooks repository](https://github.com/engineyard/ey-cookbooks-stable-v5/) into the current directory
- copy the recipe into `/cookbooks`
- add the dependency and include calls into the `ey-custom/recipes/after-main.rb` hook
- delete the V5 cookbooks in the current directory

To learn more chef hooks in V5, please see https://github.com/engineyard/ey-cookbooks-stable-v5/tree/master#hooks

3) Run

`ey-core recipes upload --environment=<environment_name> --apply`

The above command is the equivalent of the `ey recipes upload --environment=<environment_name> --apply` that you used to do in V2/V4. It requires the [ey-core](https://github.com/engineyard/core-client-rb) gem, which you can install via `gem install ey-core`.