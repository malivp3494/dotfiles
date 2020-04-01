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

echo "Setting up i3..."
mkdir -p $HOME/.config
rm ~/.config/i3 -rf
ln -s $PWD/arch/i3 $HOME/.config/i3


echo "Setting up polybar..."
rm ~/.config/polybar -rf
ln -s $PWD/arch/polybar $HOME/.config/polybar


echo "Setting up nvim..."
rm ~/.config/nvim -rf
ln -s $PWD/arch/nvim $HOME/.config/nvim

