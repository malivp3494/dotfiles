#!/usr/bin/bash
echo "Configuring zshrc..."
rm ~/.zshrc
ln -s $PWD/ZSHRC $HOME/.zshrc

echo "Configuring vimrc..."
rm ~/.vimrc
ln -s $PWD/VIMRC $HOME/.vimrc

echo "Configuring TMUX..."
rm ~/.tmux.conf
ln -s $PWD/TMUX.CONF $HOME/.tmux.conf

echo "Setting up aliases..."
rm ~/.aliasrc
ln -s $PWD/ALIASRC $HOME/.aliasrc

echo "Setting up environment variables..."
rm ~/.environment
ln -s $PWD/ENVIRONMENT $HOME/.environment

echo "Setting up scripts..."
rm ~/pro/scripts
ln -s $PWD/../scripts $HOME/pro/scripts

