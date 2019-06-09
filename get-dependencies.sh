#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

rolesdir=$(dirname $0)/..

[ ! -d $rolesdir/juju4.redhat_epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat_epel
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.mig-postgres ] && ln -s ansible-mig-postgres $rolesdir/juju4.mig-postgres
[ ! -e $rolesdir/juju4.mig-postgres ] && cp -R $rolesdir/ansible-mig-postgres $rolesdir/juju4.mig-postgres

## don't stop build on this script return code
true
