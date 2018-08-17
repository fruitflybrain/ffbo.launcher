echo Installing the Docker volume to Downloads
curl -o ~/Downloads/Docker.dmg https://download.docker.com/mac/stable/Docker.dmg

echo Mounting the Docker volume
sudo hdiutil attach ~/Downloads/Docker.dmg

echo Copying the Docker app into Applications
cp /Volumes/Docker/Docker.app /Applications

echo Giving the Docker app correct permissions
sudo chmod -R go+rX /Applications/Docker.app

echo Unmounting the Docker volume
sudo hdiutil detach /Volumes/Docker

echo Deleting the Docker volume
rm ~/Downloads/Docker.dmg
