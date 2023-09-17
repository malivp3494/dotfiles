# Things to do after fresh install (Self Reminder)

## 1. Setting up `git`

Generate a ssh key pair, so I don't have to type password everytime.
[Stolen from here.](https://stackoverflow.com/questions/8588768/how-do-i-avoid-the-specification-of-the-username-and-password-at-every-git-push)

1. Generate a ssh-key for personal account
   ```sh
   $ ssh-keygen -t rsa # generate a key
   $ cat ~/.ssh/id_rsa.pub # copy contents
   ```
2. Goto [ssh settings](https://github.com/settings/ssh)
3. Add the machine.
4. generate a ssh-key for work account
   ```sh
   $ ssh-keygen -t rsa2 # generate a key
   $ cat ~/.ssh/id_rsa_2.pub # copy contents
   ```
5. Add `~/.ssh/config` as follows:
   ```
   Host github.com-work
      Hostname github.com
      User git
      IdentityFile ~/.ssh/id_rsa_2
   Host github.com
      Hostname github.com
      User git
      IdentityFile ~/.ssh/id_rsa
   ```
6. All origins for the repos must be as shown in example below.
   ```sh
   $ git remote set-url origin git+ssh://git@github.com/username/reponame.git # for personal
   $ git remote set-url origin git+ssh://git@github.com-work/username/reponame.git # for work
   ```

## 2. NodeJS change global npm path

```sh
$ mkdir ~/.npm-global
$ npm config set prefix '~/.npm-global'
$ export PATH=~/.npm-global/bin:$PATH
$ source ~/.profile
```

## 3. Overclock External Monitor Refresh Rate

Stolen from [here](https://www.reddit.com/r/linux_gaming/comments/608k5d/overclocking_monitor/df4dvbp?utm_source=share&utm_medium=web2x).

```sh
$ cvt 1920 1080 65
```

This gives you a modeline similar to

`Modeline "1920x1080_65.00" 188.00 1920 2048 2248 2576 1080 1083 1088 1124 -hsync +vsync`

which you can either insert into XOrg.conf, or use straight with xrandr.

```sh
$ xrandr --newmode <paste everything except the Modeline word>
```

Now get the output name from the list by doing

```sh
$ xrandr --listmonitors
```

which will give you the output similar to

```sh
0: +*HDMI-1 1920/527x1080/296+0+0  HDMI-1
1: +eDP-1 1366/344x768/193+1920+0  eDP-1
```

Thus, for me output name will be `HDMI-1`.

Finally run the following commands

```sh
$ xrandr --addmode HDMI-1 "1920x1080_65.00"
$ xrandr --output HDMI-1 --mode "1920x1080_65.00"
```

# 4. Capslock as ctrl key (xfce)

```sh
 $ sudo vi /etc/default/keyboard
```

Find the line that starts with `XKBOPTIONS`, and add `ctrl:nocaps` to make Caps Lock an additional Control key.

```sh
$ sudo dpkg-reconfigure keyboard-configuration
```

Done :|
