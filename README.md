vagrant-puppetdev
=================

This repo contains a very basic vagrant box to develop and test the [graylog2 puppet module](https://github.com/synyx/puppet-graylog2).


Installation
------------

Get the vagrant box by cloning the repository:

```bash
git clone https://github.com/grafjo/vagrant-puppetdev.git
git checkout graylog2_ubuntu
```

Requirements
------------

You have to install the following software:

[vagrant](https://github.com/mitchellh/vagrant)
[librarian-puppet](https://github.com/rodjek/librarian-puppet)

```bash
sudo apt-get install vagrant librarian-puppet
```


Usage
-----

Install required puppet modules:
```bash
cd puppet
librarian-puppet install
```

After the puppet modules are installed you can start the vagrant box:
```bash
cd ../vagrant
vagrant up
```

Now you have to wait! After a few minutes graylog2 setup is ready and you can start working with graylog2. The webinterface is running on https://192.168.33.10 login with admin/admin


License
-------

vagrant-puppetdev is released under the MIT License. See the bundled LICENSE file for details.
