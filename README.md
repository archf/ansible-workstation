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

Variables loaded from `vars/Debian.yml`.

```yaml
workstation_pkgs:
  - ipython3
  - python-dev
  - python3-ipdb
  - python3-pip
  - libinotifytools-dev
  - workrave
  - silversearcher-ag
  - xsel
  - pandoc
  - exuberant-ctags
  - httrack
  - remmina
  - remmina-plugin-rdp
  - vagrant
  - gsmartcontrol
  - pgadmin3
  - gcc
  - wireshark
  - gitk
  - entr
  - mtpfs
  - debootstrap
  - redshift-gtk
  - fusefat
  - bind9utils
  - ipcalc
  - xdotool
  - xbindkeys
  - pdfshuffler
  - lxd
  - network-manager-openconnect
  - network-manager-vpnc
  - network-manager-openvpn
  - network-manager-ssh
  - stoken
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

### Default vars

Defaults from `defaults/main.yml`.

```yaml
workstation_pkg_state: latest

workstation_pip_pkgs:
  - sphinx-autobuild
  - recommonmark
  - sphinxcontrib-libreoffice
  - sphinxcontrib-exceltable
  - sphinx_rtd_theme
  - tabulate
  - netaddr
  - passlib
  - yaml2rst
  - m2r
  - jinja2
  - pyyaml
  - pytest
  - hypothesis
  - twine
  - flake8
  - flake8-docstrings
  - autopep8
  - Sphinx
  # - pip
  # ldap
  # imaging libraries
  # - pil
  # - pillow

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