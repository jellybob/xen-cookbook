set_unless[:xen] = {
  :guest_ips => [],
  :default_vm => {
    :domain => "vm.blankpad.net", 
    :install_method => "tar", 
    :install_source => "/media/iso/debian-with-chef.tgz", 
    :kernel => "/boot/vmlinuz-`uname -r`", 
    :initrd => "/boot/initrd.img-`uname -r`", 
    :ip => "auto", 
    :netmask => "255.255.255.0", 
    :gateway => "192.168.1.1",
    :broadcast => "192.168.1.255", 
    :memory => "256M", 
    :size => "2G", 
    :fs => "ext3", 
    :volume_group => "pool", 
  }
}
