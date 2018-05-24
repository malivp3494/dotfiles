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
#### 5.2 Important stuff
```
sudo npm install -g yarn
sudo npm install -g prettier nodemon
```

#### 5.3 React and React Native
```
sudo npm install -g react-native-cli create-react-app
```
Alright. That's all for now. Will definitely add something more....

## 6. Install qPDFView
``` sudo apt-get install -y qpdfview```
<br>To change default pdf reader, Right click any pdf file and open properties. Go to 'Open With' tab, select qpdfview and click on Set as Default. 
