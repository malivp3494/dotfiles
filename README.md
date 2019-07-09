# Things to do after fresh install (Self Reminder)
This document is created to install the necessary packages required to be installed every time I do a fresh install of [**Ubuntu 16.04**](releases.ubuntu.com/16.04/) or whatever. Execute commands as follows. 
## 1. Install TLP, Chrome and VSCode
yeah it saves battery. install it by running ```sudo apt-get install tlp tlp-rdw```
<br> For, chrome and vscode, download deb packages and install them by ```sudo dpkg -i chrome.deb code.deb```
## 2. Install RTL8723BE WiFi Drivers
Ubuntu somehow doesn't support wifi drivers for my ```hp-ac-120tx``` [Specifications](https://support.hp.com/in-en/document/c04779465).<br/>
So we need to manually install the drivers. It shows weak wifi signal, I'm able to connect only if I keep my laptop right next to the router.  Just follow the steps and you'll be fine. [Reference Link](https://connectwww.com/how-to-solve-realtek-rtl8723be-weak-wifi-signal-problem-in-ubuntu/4625/) <br><br>
Open Terminal and execute:
1. ```git clone https://github.com/lwfinger/rtlwifi_new.git```
2. ```cd rtlwifi_new```
3. ```make```
4. ```sudo make install```
5. ```sudo modprobe -rv rtl8723be```
6. ```sudo modprobe -v rtl8723be ant_sel=2```
7. ```service NetworkManager restart```
<br><br>
That should turn your WiFi back on and you should get better wifi signal. However these settings are not permanent and step 5 & 6 need to be executed on every restart. so either add them in startup applications or to make them permanent use this: ```echo "options rtl8723be ant_sel=2" | sudo tee /etc/modprobe.d/50-rtl8723be.conf```.

## 3. Install OSX-Arc-Theme and Numix Icons
cause this looks good?
#### 3.1 Install Unity Tweak Tool
```sudo apt-get install unity-tweak-tool```
<br>
#### 3.2 Install OSX theme
Download zip file from [this](https://www.gnome-look.org/p/1167049/) site, and extract it. Copy or move the contents to ```/usr/share/themes``` or by creating a new directory as ```~/.themes```. For example use ```sudo cp -r * /usr/share/themes```.
Select OSX theme from Unity Tweak Tool. 
<br>
#### 3.3 Install Numix icons and OSX cursors
Too tired to write this, use these resources:
* Numix Icons 
```
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix-gtk-theme numix-icon-theme-circle
```
* OSX Cursors 
```
git clone https://github.com/keeferrourke/capitaine-cursors.git
cd capitaine-cursors
sudo cp -pr dist/ /usr/share/icons/capitaine-cursors
```
<br>if you want to build from source, do this.(Usually not needed)
```
git clone https://github.com/keeferrourke/capitaine-cursors.git
cd capitaine-cursors
sudo apt-get install inkscape
./build.sh
sudo cp -pr dist/ /usr/share/icons/capitaine-cursors
```

<br>Now change icons and cursor from Unity Tweak Tool. 

## 4. Install zsh
Why am I writing **it's good** everywhere... follow these steps. 
#### 4.1 Installation
Prerequisites:

```
apt-get install zsh
apt-get install git-core
```

Getting zsh to work in ubuntu is weird, since `sh` does not understand the `source` command.  So, you do this to install zsh

    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

and then you change your shell to zsh

    chsh -s `which zsh`

and then restart

    sudo shutdown -r 0
If you want to use change default to bash, then simply do
    ```sudo chsh -s /bin/bash```

#### 4.2 Theme
Change the terminal theme to ```solarized dark``` and set the agnoster theme as follows:

```
sudo apt-get install fonts-powerline
sudo nano ~/.zshrc
``` 
<br> Replace line containing ```ZSH_THEME=``` by ```ZSH_THEME="agnoster"```.<br> **Done!**<br>
## 5. Setup environment for React
#### 5.1 NPM and NodeJS
Refer [this](https://nodejs.org/en/download/package-manager/).
Also, after this, you might need to change default npm global path, cause there are no write permissions for default npm global, due to which you need to use ```sudo npm install -g <package>```. 
So, follow these steps to change default npm global packages directory - [Source](https://docs.npmjs.com/getting-started/fixing-npm-permissions)
```
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
source ~/.profile
```

#### 5.2 Important stuff
```
sudo npm install -g yarn
sudo npm install -g prettier nodemon serve
```

#### 5.3 React and React Native
```
sudo npm install -g react-native-cli create-react-app
```
Alright. That's all for now. Will definitely add something more....

## 6. Install qPDFView
``` sudo apt-get install -y qpdfview```
<br>To change default pdf reader, Right click any pdf file and open properties. Go to 'Open With' tab, select qpdfview and click on Set as Default. 

## 7. Install LAMP Stack
probably won't use most of the time, but yeah, it's good to have it here. 
Do this to install Apache2, MySQL and PHP
```
sudo apt install apache2 mysql-server php-pear php-fpm
```

## 8. Overclock External Monitor Refresh Rate
Refered [this](https://www.reddit.com/r/linux_gaming/comments/608k5d/overclocking_monitor/df4dvbp?utm_source=share&utm_medium=web2x)

```cvt 1920 1080 65```

This gives you a modeline similar to 

```Modeline "1920x1080_65.00"  188.00  1920 2048 2248 2576  1080 1083 1088 1124 -hsync +vsync```

which you can either insert into XOrg.conf, or use straight with xrandr.

```xrandr --newmode <paste everything except the Modeline word>```

Now get the output name from the list by doing 

```xrandr --listmonitors```

which will give you the output similar to 

```
0: +*HDMI-1 1920/527x1080/296+0+0  HDMI-1
1: +eDP-1 1366/344x768/193+1920+0  eDP-1
```
Thus, for me output name will be `HDMI-1`.

Finally run the following commands 

```
xrandr --addmode HDMI-1 "1920x1080_65.00"
xrandr --output HDMI-1 --mode "1920x1080_65.00"

```

