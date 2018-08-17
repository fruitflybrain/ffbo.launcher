curl -o ~/Downloads/Docker.dmg https://download.docker.com/mac/stable/Docker.dmg
sudo hdiutil attach ~/Downloads/Docker.dmg
sudo installer -package /Volumes/Docker/Docker.pkg -target /Applications
sudo hdiutil detach /Volumes/Docker
rm ~/Downloads/Docker.dmg
