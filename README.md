# ansible-workstation

A role to install default packages on a machine used for daily developpement.

## Requirements

### Ansible version

Minimum required ansible version is 2.0.

## Description

On debian machines, required ppas are also installed.


## Role Variables

### Variables conditionally loaded

Those variables from `vars/*.{yml,json}` are loaded dynamically during task
runtime using the `include_vars` module.

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
  - workrave
  - silversearcher-ag
  - xsel
  - pandoc
  - exuberant-ctags
  - httrack
  - vagrant
  - gsmartcontrol
  - pgadmin3
  - gcc
  - wireshark
  - gitk
  - entr
  - mtpfs
  - jq
  - debootstrap
  - redshift-gtk
  - fusefat
  - bind9utils
  - ipcalc
  - xdotool
  - xbindkeys
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
  # to build tmux
  - libevent-dev
  - ncurses-dev
  - yum
  - fortune
  # require x2go ppa
  # - x2goserver
  # - x2goserver-xsession
  # - x2godesktopsharing

  # - remmina
  # - remmina-plugin-rdp
  # - lxc
  # - lxc-templates
  # - python3-lxc
  # - virtualbox-qt
  # - urlview
  # - parcellite
  # - i3
  # - j4-dmenu-desktop
  # - pavucontrol
  # - pasystray
  # - golang-go
  # - golang-doc

dumpcap_path: /usr/bin/dumpcap

```

### Default vars

Defaults from `defaults/main.yml`.

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

## Ansible role dependencies

None.

## License

MIT.

## Author Information

Felix Archambault.

## Role stack

This role was carefully selected to be part an ultimate deck of roles to manage
your infrastructure.

All roles' documentation is wrapped in this [convenient guide](http://127.0.0.1:8000/).


---
This README was generated using ansidoc. This tool is available on pypi!

```shell
pip3 install ansidoc

# validate by running a dry-run (will output result to stdout)
ansidoc --dry-run <rolepath>

# generate you role readme file
ansidoc <rolepath>
```

You can even use it programatically from sphinx. Check it out.