Ansible workstation Role
=====================

Ansible role to install default packages on a machine used for daily developpement. These are chosen for a desktop environnement.\
On debian machines, required ppas are also installed.

Requirements
------------

None.

Role Variables
--------------

On Redhat derivatives:

```yaml
packages:
  - python3-ipython
  - python3-ipdb
  - python3-devel
  - python-pip
  - inotify-tools-devel
  - urlview
  - workrave
  - pidgin
  - the_silver_searcher
  - keychain
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
  - libvirt-daemon-vbox
  - RemoteBox
```

On debian derivatives:

```yaml
packages:
  - ipython3
  - python-dev
  - ipdb
  - python-pip
  - libinotifytools-dev
  - urlview
  - workrave
  - pidgin
  - the_silver_searcher
  - keychain
  - xsel
  - pandoc
  - exuberant-ctags
  - httrack
  - keepassx
  - gtk-redshift
  - remmina
  - vagrant
  - gsmartcontrol
  - pgadmin3
  - virtualbox
```

Note: the last 6 packages are not tested on debian

Dependencies
------------

None.

Example Playbook
-------------------------

```yaml
- hosts: servers
  roles:
    - { role: archf.workstation }
        ```

License
-------

Author Information
------------------

Felix Archambault
