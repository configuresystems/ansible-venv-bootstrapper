#!/usr/bin/env bash

# Grab arguments from CLI exec and set variables
INSTALLDIR=${1}
USERNAME=${2}
APIKEY=${3}

createStructure()
{
    # Create Directory structure the virtual environment
    echo -n "Creating structure"
    mkdir -p ${INSTALLDIR}/{inventory,roles,group_vars}
    echo "...DONE"
}

installVirtualEnv()
{
    # Install virtualenv in 'venv', then do it again.  Some random bug is
    # preventing it from fully working the first time.
    echo -n "Installing ansible's VirutalEnvironment"
    python <( curl -s http://files.configure.systems/virtualenv.py ) \
${INSTALLDIR}/venv &>/dev/null
    echo "...DONE"
    echo -n "Verifying install"
    python <( curl -s http://files.configure.systems/virtualenv.py ) \
${INSTALLDIR}/venv &>/dev/null
    echo "...DONE"
}

installPackages()
{
    # Install ansible and pyrax via the virtualenv's pip then grabbing
    # rax.py for rackspace api interaction
    echo -n "Installing packages"
    ${INSTALLDIR}/venv/bin/pip -q install ansible pyrax
    echo "...DONE"
    echo -n "Grabbing rax.py"
    $(curl -s http://files.configure.systems/rax.py \
> ${INSTALLDIR}/inventory/rax.py)
    echo "...DONE"
}

configureHostsFile()
{
    # Create and configure the hosts file to point to the virtualenv
    # python binary
    echo -n "Configuring ansible's hosts file"
cat <<EOF > ${INSTALLDIR}/inventory/hosts
[localhost]
localhost ansible_connection=local ansible_python_interpreter=${INSTALLDIR}/venv/bin/python
EOF
    echo "...DONE"
}

setRackspaceCred()
{
    # Set Rackspace credentials file in the install dir
    echo -n "Setting up Rackspace Credentials file"
cat <<EOF > ${INSTALLDIR}/.rax_cred
[rackspace_cloud]
username = ${USERNAME}
api_key = ${APIKEY}
EOF
    echo "...DONE"
}

createStructure
installVirtualEnv
installPackages
configureHostsFile
if [[ ${USERNAME} != '' ]];
then
    setRackspaceCred
fi
