package "xen-tools"

# Configure the list of available IPs if one was provided
if node["xen"]["guest_ips"]
  execute "touch /etc/xen-tools/ips.txt" do
    creates "/etc/xen-tools/ips.txt"
  end

  node["xen"]["guest_ips"].each do |ip|
    execute "echo '#{ip}' >> /etc/xen-tools/ips.txt" do
      not_if "grep '#{ip}' /etc/xen-tools/ips.txt"
    end
  end
end

template "/etc/xen-tools/xen-tools.conf" do
  source "xen-tools.conf.erb"
  mode "0644"
  variables({
    :defaults => node["xen"]["default_vm"]
  })
end

search(:virtual_machines) do |vm|
  # Bootstrap
  domain = vm[:domain] || node[:xen][:default_vm][:domain]
  hostname = "#{vm[:id]}.#{domain}"
  
  create_command = "xen-create-image --hostname=#{vm[:id]}.#{domain}"
  vm.keys.reject { |k| %w(id domain).include?(k) }.each do |option|
    create_command << " --#{option.gsub("_", "-")}=#{vm[option]}"
  end

  ruby_block { block { Chef::Log.info("Creating VM using #{create_command}") } }
  execute "#{create_command}" do
    creates "/etc/xen/#{hostname}"
  end

  # Start
  ruby_block { block { Chef::Log.info("Starting VM for #{hostname}") } }
  execute "xm create #{hostname}" do
    not_if "xm list | grep #{hostname}"
  end
end
