#!/bin/sh
sudo apt-get install build-essentials
sudo apt-get install git-all
sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install zsh
sudo apt-get install curl
sudo apt-get install tree
sudo apt-get install vlc
sudo apt-get install google-chrome-stable

# Install Paper
sudo add-apt-repository ppa:snwh/pulp
# update repository info
sudo apt-get update
# install icon theme
sudo apt-get install paper-icon-theme
# install gtk theme
sudo apt-get install paper-gtk-theme
# install cursor theme
sudo apt-get install paper-cursor-theme

# Setup git
git config --global user.email "grsabreu@gmail.com"
git config --global user.name "Gabriel Rubens"

# Setup zsh
chsh -s /bin/zsh user
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setup Vim
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
# Setup node
nvm install node
nvm use node
npm i -g yarn

# Install Meteor
curl https://install.meteor.com/ | sh

# Setup React Native
yarn global add react-native-cli

# Install Java
sudo apt-get install default-jre
sudo apt-get install default-jdk

# Setup Android SDK
ANDROID_SDK_URL=https://dl.google.com/dl/android/studio/ide-zips/2.2.2.0/android-studio-ide-145.3360264-linux.zip
curl $ANDROID_SDK_URL -o ~/android_sdk.zip
unzip ~/android_sdk.zip
mv ~/android_sdk ~/Android
