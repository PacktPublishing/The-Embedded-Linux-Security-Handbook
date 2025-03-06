# mykickstart.ks
# version 1

# anaconda installer type
text

# ensure that you connect your device to a Ethernet network with active DHCP
network --bootproto=dhcp --device=link --activate

# basic partitioning
clearpart --all --initlabel --disklabel=gpt

reqpart --add-boot

part / --grow --fstype xfs

# here’s where we reference the container image
# notice this kickstart has no packages section
ostreecontainer --url quay.io/matt_st_onge/bootc/lamp-bootc:latest \
 --no-signature-verification

# additional settings for demonstration purposes
# in production use better settings
# the purpose of this exercise is not to tech you kickstart
# but to show how to leverage it in custom installers

firewall --disabled
services --enabled=sshd

# add your own user account to the system
user --name=mstonge --groups=wheel --plaintext --password=embedded

# set root password
rootpw --plaintext --password=embedded
