echo 'Removing downloaded cookbooks'
rm -rf ey-cookbooks-stable-v5
rm -rf cookbooks

echo 'Restoring ey-custom'
git checkout ./cookbooks
