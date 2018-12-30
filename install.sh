#!/bin/bash

# 🍻 Brew
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew tap homebrew/bundle
brew bundle

# Change default shell
chsh -s $(which zsh)

# Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
/usr/local/bin/composer global require laravel/installer

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting ./zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ./zsh/plugins/zsh-autosuggestions


# move files
mv .gitignore_global ~/
mv .gitconfig ~/
mv vscode/* ~/vscode/

# MacOs preferences
source .macos

rm -rf *
