SYSTEM_VERSION=`defaults read loginwindow SystemVersionStampAsString`

function prompt {
  read -p "Hit Enter to $1 ..."
}

# Install xcode tools and brew
if test ! $(which brew); then
  prompt "Install Xcode"
  xcode-select --install

  prompt "Install Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  prompt "Update Homebrew"
  brew update
  brew upgrade
fi

brew doctor
#
# # Install Python 2 and 3
# if test ! $(which python2); then
#   prompt "Install Python2"
#   brew install python
#   prompt "Install Python3"
#   brew install python3
# else
#   echo "Brew Python is already installed."
# fi
#
# # Add Python to PATH
# if [ -f ~/.bash_profile ]; then
#     echo "File not found!"
# fi
#
# if [ -f ~/.zshrc ]; then
#     echo "File not found!"
# fi
#
# # Install virtualenv and virturalenvwrapper
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
# source /usr/local/bin/virtualenvwrapper_lazy.sh
