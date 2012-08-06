Demo Setup
========
* Get access to Eucalyptus Community Cloud
* Prepare Puppet Master
* Launch instance for mysql role
* Launch instance for apache role

Prepare Puppet Master
========
* Spin up a medium instance
* Install Puppet Master
* Install puppet modules: apache, mysql
* Replace /etc/puppet/site.pp with version from eucademo repo
* Enable cert auto-sign
* Install custom Factor Fact from eucademo repo

Launch instance for mysql role
========
* Launch small Ubuntu instance, using cloud-start script from repo
* Add hostname to /etc/hosts
  sudo sed -i.bak '/127.0.0.1 localhost/c127.0.0.1 localhost '"$HOSTNAME" /etc/hosts
* $ sudo puppet agent --test

Launch instance for apache role
========
* Launch small Ubuntu instance, using cloud-start script from repo
* Add hostname to /etc/hosts
  sudo sed -i.bak '/127.0.0.1 localhost/c127.0.0.1 localhost '"$HOSTNAME" /etc/hosts
* $ sudo puppet agent --test
