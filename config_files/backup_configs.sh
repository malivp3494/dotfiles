#!/bin/bash
default_dir="/home/toxicdesire/pro/dotfiles/config_files"
mkdir -p "$default_dir"
echo "backup configs to $default_dir"
echo "zsh, vim, tmux, redshift are symlinks now, no longer need to backup them"
# echo "ZSHRC..."
# cat ~/.zshrc > $default_dir/ZSHRC
# echo "VIMRC..."
# cat ~/.vimrc > $default_dir/VIMRC
# echo "TMUX.CONF..."
# cat ~/.tmux.conf > $default_dir/TMUX.CONF
# echo "REDSHIFT.CONF"
# cat ~/.config/redshift.conf > $default_dir/REDSHIFT.CONF
echo "etc_rc.local..."
cat /etc/rc.local > $default_dir/etc_rc.local
echo "etc_environment..."
cat /etc/environment > $default_dir/etc_environment
echo "konsole-colorschemes..."
mkdir -p $default_dir/konsole-colorschemes && cp -r ~/.local/share/konsole/* $default_dir/konsole-colorschemes
echo "apt_packages..."
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) > $default_dir/apt_packages.txt
echo "vscode_extensions..."
code --list-extensions > $default_dir/vscode_extensions.txt
echo "Backup successful!"

