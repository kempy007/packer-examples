# packer-examples

don't use esxi-hack it's here as an example. try the vsphere.test.json

fetch vsphere-iso builder from https://github.com/jetbrains-infra/packer-builder-vsphere/releases

turn your kickstart file into an iso;
mkisofs -V OEMDRV -o kickstart.iso ks.cfg

ref: https://github.com/jetbrains-infra/packer-builder-vsphere/issues/85

upload iso files to datastore.
