#!/bin/sh

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install build-essential -y
sudo apt-get install git-all -y
sudo apt-get install git-extras -y
# vim-gtk with batteries includes
sudo apt-get install vim vim-gtk -y
sudo apt-get install tmux -y
sudo apt-get install zsh -y
sudo apt-get install curl -y
sudo apt-get install tree -y
sudo apt-get install vlc -y
sudo apt-get install chromium -y
sudo apt-get install unity-tweak-tool -y
# Install automake and tools
sudo apt-get install autotools-dev -y
sudo apt-get install automake -y
# Python dev lib
sudo apt-get install python-dev

# Install Java
sudo apt-get install default-jre -y
sudo apt-get install default-jdk -y

# Install Paper
sudo add-apt-repository ppa:snwh/pulp -y
# update repository info
sudo apt-get update
# install icon theme
sudo apt-get install paper-icon-theme -y
# install gtk theme
sudo apt-get install paper-gtk-theme -y
# install cursor theme
sudo apt-get install paper-cursor-theme -y

# Install Source Code Pro
# Thanks to https://github.com/adobe-fonts/source-code-pro/issues/17#issuecomment-102803992
FONT_HOME=~/.local/share/fonts

echo "installing fonts at $PWD to $FONT_HOME"
mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
# find "$FONT_HOME" -iname '*.ttf' -exec echo '{}' \;

(git clone \
   --branch release \
   --depth 1 \
   'https://github.com/adobe-fonts/source-code-pro.git' \
   "$FONT_HOME/adobe-fonts/source-code-pro" && \
fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro")

# Setup git
git config --global user.email "grsabreu@gmail.com"
git config --global user.name "Gabriel Rubens"

# Setup Vim
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo "Copy my_config.vim to ~/.vim_runtime/my_config.vim"

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

# Setup Android Studio, this is downloading only the studio for now
# Need to automate the SDK too
ANDROID_SDK_URL=https://dl.google.com/dl/android/studio/ide-zips/2.2.2.0/android-studio-ide-145.3360264-linux.zip
curl $ANDROID_SDK_URL -o ~/android_sdk.zip
unzip ~/android_sdk.zip
mv ~/android-studio ~/Android
# aapt tool is a 32bit application so weed need these libs to get it running
# as we are on ubuntu 64bit
sudo apt-get install lib32stdc++6 lib32z1 -y

# Setup zsh
chsh -s /bin/zsh user
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Logout and login again to get zsh as default term"
