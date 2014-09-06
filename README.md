ansible-venv-bootstrapper
=========================

# Bootstrapper to install Ansible within a desired VirtualEnvironment

### What's it for

It's for those people who are too lazy, like myself, to continaully setup
virtual environments for ansible within different systems.  And because
utilizing virtual environments is far better for working with, especially
if you don't have root or sudo level access.

### Usage

##### If you want the repo

`git clone https://github.com/configuresystems/ansible-venv-bootstrapper.git`

For an environment without a rackspace configuration, run this command:

`bash ansible-venv-bootstrapper/bootstrapper.sh /full/path/to/directory/for/install`

For an environment with a rackspace configuration, run this command:

`bash ansible-venv-bootstrapper/bootstrapper.sh /full/path/to/directory/for/install USERNAME API_KEY`

Replace USERNAME and API_KEY, with your actual Rackspace Username and Api Key.

##### From Curl

For an environment without a rackspace configuration, run this command:

`bash <( curl https://raw.githubusercontent.com/configuresystems/ansible-venv-bootstrapper/master/bootstrapper.sh ) /full/path/to/directory/for/install`

For an environment with a rackspace configuration, run this command:

`bash <( curl https://raw.githubusercontent.com/configuresystems/ansible-venv-bootstrapper/master/bootstrapper.sh ) /full/path/to/directory/for/install USERNAME API_KEY`

Replace USERNAME and API_KEY, with your actual Rackspace Username and Api Key.

### Tested On

System | Status
------------ | -------------
CentOS 6.X | Working
Ubuntu 12.04 | Working
Ubuntu 14.04 | Working
OSX 10.9.4 | Working
