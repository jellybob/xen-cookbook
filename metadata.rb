maintainer        "Jon Wood"
maintainer_email  "jon@blankpad.net"
license           "Apache 2.0"
description       "Spawn new VMs from a base image, using Xen tools"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version           "1.0"

supports "debian", ">= 5.0"

attribute "xen",
          :display_name => "Xen",
          :description => "Hash of Xen attributes",
          :type => "hash"

attribute "xen/guest_ips",
          :display_name => "Guest IPs",
          :description => "Array of IP addresses for VMs to use",
          :type => "array"

attribute "xen/default_vm",
          :display_name => "Default VM settings",
          :description => "Hash of default settings for VMs",
          :type => "hash"

attribute "xen/default_vm/domain",
          :display_name => "Domain name",
          :description => "The domain name which VMs should be placed under",
          :type => "string"

attribute "xen/default_vm/size",
          :display_name => "Disk size",
          :description => "The size of the VM's disk. Can use suffixes such as M, G etc",
          :type => "string"

attribute "xen/default_vm/memory",
          :display_name => "Memory",
          :description => "The maximum memory for the VM. Can use suffixes such as M, G etc",
          :type => "string"

attribute "xen/default_vm/volume_group",
          :display_name => "Volume Group",
          :description => "The LVM volume group to place the VM's disk in",
          :type => "string"

attribute "xen/default_vm/install_method",
          :display_name => "Install method",
          :description => "The method xen-tools should use to bootstrap a server.",
          :type => "string"

attribute "xen/default_vm/install_source",
          :display_name => "Install source",
          :description => "The full path to the default VM image to use for copy or tar install methods.",
          :type => "string"

attribute "xen/default_vm/kernel",
          :display_name => "Kernel",
          :description => "The default kernel to use for new VMs.",
          :type => "string"

attribute "xen/default_vm/initrd",
          :display_name => "Initrd",
          :description => "The default initrd to use for new VMs.",
          :type => "string"

attribute "xen/default_vm/fs",
          :display_name => "Filesystem type",
          :description => "The filesystem to use for new VMs.",
          :type => "string"

attribute "xen/default_vm/ip",
          :display_name => "IP address",
          :description => "Set to auto to use the list of IP addresses specified in guest_ips. Otherwise you need to override this for each VM.",
          :type => "string"

attribute "xen/default_vm/gateway",
          :display_name => "Network gateway",
          :description => "The gateway to use for new VMs.",
          :type => "string"

attribute "xen/default_vm/broadcast",
          :display_name => "Broadcast address",
          :description => "The broadcast address to use for new VMs.",
          :type => "string"

attribute "xen/default_vm/netmask",
          :display_name => "Netmask",
          :description => "The netmask to use for new VMs.",
          :type => "string"
