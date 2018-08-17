curl -o ~/Downloads/Docker.dmg https://download.docker.com/mac/stable/Docker.dmg
sudo hdiutil attach ~/Downloads/Docker.dmg
cp /Volumes/Docker/Docker.app /Applications
chmod -R go+rX /Applications/Docker.app
sudo hdiutil detach /Volumes/Docker
rm ~/Downloads/Docker.dmg
