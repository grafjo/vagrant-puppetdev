vagrant-puppetdev
=============

This repo contains a very basic vagrant box to develop and test puppet related stuff.


Installation
------------

Get the vagrant box by cloning the repository:

```bash
git clone https://github.com/grafjo/vagrant-puppetdev.git
```


Requirements
------------

You have to install the following software:

[vagrant](https://github.com/mitchellh/vagrant)
[puppet](https://github.com/puppetlabs/puppet)
[librarian-puppet](https://github.com/rodjek/librarian-puppet)

```bash
sudo apt-get install vagrant puppet librarian-puppet
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


License
-------

vagrant-puppetdev is released under the MIT License. See the bundled LICENSE file for details.
