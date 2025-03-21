#!/bin/sh

set -e

# Clone repository
git clone https://github.com/RHYru9/Spicetify/ temp_spicetify

# Setup directories to download to
spice_dir="$(dirname "$(spicetify -c)")"
theme_dir="${spice_dir}/Themes/Comfy"

# Make directories if needed
mkdir -p "${theme_dir}"

# Move necessary files
echo "Copying Comfy theme files..."
cp temp_spicetify/Comfy/color.ini "${theme_dir}/color.ini"
cp temp_spicetify/Comfy/user.css "${theme_dir}/user.css"
cp temp_spicetify/Comfy/theme.js "${theme_dir}/theme.js"

# Remove temporary clone
rm -rf temp_spicetify

echo "Done!"

# Apply theme
echo "Applying theme..."
spicetify config current_theme Comfy color_scheme Comfy
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1 inject_theme_js 1
spicetify apply

echo "All done!"
