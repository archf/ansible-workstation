# ansible-workstation

A role to install default packages on a machine used for daily developpement.

## Ansible requirements

### Ansible version

Minimum required ansible version is 2.0.

### Ansible role dependencies

None.

## Installation

### Install with Ansible Galaxy

```shell
ansible-galaxy install archf.workstation
```

Basic usage is:

```yaml
- hosts: all
  roles:
    - role: archf.workstation
```

### Install with git

If you do not want a global installation, clone it into your `roles_path`.

```shell
git clone git@github.com:archf/ansible-workstation.git /path/to/roles_path
```

But I often add it as a submdule in a given `playbook_dir` repository.

```shell
git submodule add git@github.com:archf/ansible-workstation.git <playbook_dir>/roles/workstation
```

As the role is not managed by Ansible Galaxy, you do not have to specify the
github user account.

Basic usage is:

```yaml
- hosts: all
  roles:
  - role: workstation
```
## User guide

### Introduction

- install a linux OS packages
- install pip packages
- add lightDM menu entries
- install i3 repository gpg key
- install postgresql gpg key
- disable Xsession gpg-agent (will use gpg-agent systemd --user unit file)
- change dumpcap capabilites to run wireshark without priviledge escalation
- On debian/ubuntu machines, required repos/ppas are also installed.


## Role Variables

Variables are divided in three types.

The [default vars](#default-vars) section shows you which variables you may
override in your ansible inventory. As a matter of fact, all variables should
be defined there for explicitness, ease of documentation as well as overall
role manageability.

The [mandatory variables](#mandatory-variables) section contains variables that
for several reasons do not fit into the default variables. As name implies,
they must absolutely be defined in the inventory or else the role will
fail. It is a good thing to avoid reach for these as much as possible and/or
design the role with clear behavior when they're undefined.

The [context variables](#context-variables) are shown in section below hint you
on how runtime context may affects role execution.

### Default vars

Role default variables from `defaults/main.yml`.

```yaml
workstation_pkg_state: latest

workstation_pip_pkgs:
  - Sphinx
  - sphinx-autobuild
  - sphinxcontrib-libreoffice
  - sphinxcontrib-exceltable
  - sphinx_rtd_theme
  - recommonmark
  - tabulate
  - netaddr
  - passlib
  - yaml2rst
  - m2r
  - jinja2
  - pyyaml
  - twine
  - flake8
  - flake8-docstrings
  - autopep8
  - tqdm
  - PyInstaller
  - hypothesis
  - pytest
  - pytest-cov
  - pytest-gitignore
  - ansible
  - ansidoc
  - httpie
  - ssh-import-id
  - i3ipc

  # - coverage
  # - pip
  # ldap
  # imaging libraries
  # - pil
  # - pillow
  # other stuff
  # - flake8-author
  # - dnspython

```

### Mandatory variables

None.

### Context variables

Those variables from `vars/*.{yml,json}` are loaded dynamically during task
runtime using the `include_vars` module.

Variables loaded from `vars/Debian.yml`.

```yaml
workstation_pkgs:
  - ipython3
  - python-dev
  - python3-ipdb
  - python3-pip
  - python3-dev
  - python3-psycopg2
  - libinotifytools-dev
  - silversearcher-ag
  - xsel
  - pandoc
  - exuberant-ctags
  - httrack
  - vagrant
  - gsmartcontrol
  - pgadmin3
  - zeal
  - gcc
  - wireshark
  - gitk
  - entr
  - mtpfs
  - jq
  - pv
  - progress
  - debootstrap
  - redshift-gtk
  - dos2unix
  - fusefat
  - pastebinit
  - bind9utils
  - ipcalc
  - xdotool
  - xbindkeys
  # random identity generator
  - rig
  # ASCII banners out of ordinary text (see lolcat for colors)
  - figlet
  - pdfshuffler
  - lxd
  - openconnect
  - network-manager-openconnect
  - network-manager-openconnect-gnome
  - network-manager-vpnc-gnome
  - network-manager-openvpn-gnome
  - network-manager-ssh
  - network-manager-ssh-gnome
  - stoken
  # Python implementation
  # - shadowsocks
  # client gui
  - shadowsocks-qt5
  # Pure C implementation
  - shadowsocks-libev
  # to build tmux
  - libevent-dev
  - ncurses-dev
  - yum
  # dbus viewer
  - fortune
  - d-feet
  - i3
  - j4-dmenu-desktop
  - pinentry-gnome3
  # - pinentry-gtk2
  - scdaemon
  - pcscd
  - yubikey-personalization-gui
  - python3-yubikey-manager
  # older versions requires
  - postgresql-client-9.5
  # this requires to add the postgresql repo to access earlier versions
  - postgresql-client-9.4
  # - yubioath-desktop
  # requires x2go ppa
  # - x2goserver
  # - x2goserver-xsession
  # - x2godesktopsharing

  - remmina
  - remmina-plugin-rdp
  - pavucontrol
  # - workrave
  # - lxc
  # - lxc-templates
  # - python3-lxc
  # - virtualbox-qt
  # - urlview
  # - parcellite
  # - pasystray
  # - golang-go
  # - golang-doc

# List of ppa to install.
apt_ppas:
  - 'ppa:ubuntu-lxc/lxc-stable'
  - 'ppa:ubuntu-lxc/lxd-stable'
  - 'ppa:ansible/ansible'
  - 'ppa:tmate.io/archive'
  - 'ppa:mkusb/ppa'
  - 'ppa:neovim-ppa/stable'
  - 'ppa:yubico/stable'
  - 'ppa:zeal-developers/ppa'
    # shadowsocks-qt5
  - 'ppa:hzwhuang/ss-qt5'
    # pure C flavor
  - 'ppa:max-c-lv/shadowsocks-libev'
  - 'deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main'
  # - 'ppa:openconnect/daily'
  # - 'ppa:ubuntu-wine/ppa'

# List of Debian repos to install
apt_repos:
  - 'deb [arch=amd64] http://debian.sur5r.net/i3/ xenial universe'
  - 'deb [arch=amd64] https://repo.skype.com/deb/ stable main'
  - 'deb [arch=amd64] https://packagecloud.io/slacktechnologies/slack/debian/ jessie main'
  - 'deb [arch=amd64] https://apt.syncthing.net/ syncthing release'
  - 'deb [arch=amd64] http://dl.google.com/linux/talkplugin/deb/ stable main'
  - 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main'

  # - 'deb [arch=amd64] http://ppa.launchpad.net/vincent-c/ponysay/ubuntu/ xenial main'
  # - 'ppa:x2go/stable'
  # see https://www.postgresql.org/download/
  # -'http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main'

dumpcap_path: /usr/bin/dumpcap

```

Variables loaded from `vars/RedHat.yml`.

```yaml
workstation_pkgs:
  - python3-ipython
  - python3-devel
  - python3-ipdb
  - python-pip
  - inotify-tools-devel
  - workrave
  - the_silver_searcher
  - xsel
  - pandoc
  - ctags
  - httrack
  - keepassx
  - redshift
  - remmina
  - vagrant
  - gsmartcontrol
  - pgadmin3
  - gcc
  - vagrant
  - wireshark
  - wireshark-gnome
  - gitk
  - libvirt-daemon-vbox
  - dkms
  - simple-mtpfs
  # random identity generator
  - rig
  - stoken
  - python3-devel
  # to build tmux
  - ncurses-devel
  - libevent-devel
  - fortune
  # - lxc
  # - lxc-extra
  # - lxc-templates
  # - x2goserver
  # - urlview
  # for virtualbox
  # - RemoteBox
  # - kernel-headers
  # - kernel-devel

dumpcap_path: /usr/sbin/dumpcap

```


## License

MIT.

## Author Information

Felix Archambault.

---
Please do not edit this file. This role `README.md` was generated using the
'ansidoc' python tool available on pypi!

*Installation:*

```shell
pip3 install ansidoc
```

*Basic usage:*

Validate output by running a dry-run (will output result to stdout)
```shell
ansidoc --dry-run <rolepath>
```

Generate you role readme file. Will write a `README.md` file under
`<rolepath>/README.md`.
```shell
ansidoc <rolepath>
```

Also usable programatically from Sphinx.