# xv6_reading

xv6輪読会用リポジトリです。

## Prerequisite

Vagrant https://www.vagrantup.com/downloads.html

VirtualBox https://www.virtualbox.org/wiki/Downloads

### For MacOSX

```bash
brew cask install virtualbox
brew cask install vagrant
```

## Get Started

```
vagrant up
vagrant ssh
# パスワードを聞かれたら vagrant と打ち込んでください
cd src
make qemu-nox
```

## QEMU Commands

Ctrl+A x: Quit QEMU

Ctrl+A h: Show QEMU help
