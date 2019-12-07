#!/bin/bash
echo "backup configs"
echo "ZSHRC..."
cat ~/.zshrc > ZSHRC
echo "VIMRC..."
cat ~/.vimrc > VIMRC
echo "TMUX.CONF..."
cat ~/.tmux.conf > TMUX.CONF
echo "REDSHIFT.CONF"
cat ~/.config/redshift.conf > REDSHIFT.CONF
echo "etc_rc.local..."
cat /etc/rc.local > etc_rc.local
echo "etc_environment..."
cat /etc/environment > etc_environment
echo "konsole-colorschemes..."
mkdir -p konsole-colorschemes && cp -r ~/.local/share/konsole/* ./konsole-colorschemes
echo "apt_packages..."
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) > apt_packages.txt
echo "vscode_extensions..."
code --list-extensions > vscode_extensions.txt
echo "Backup successful!"

