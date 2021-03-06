#
# Cookbook Name:: bitcoin
# Recipe:: _systemd
#

directory File.dirname(node['bitcoin']['service_file']) do
  user "root"
  group "root"
  mode "0755"
  only_if "test -f /bin/systemctl && /bin/systemctl"
end

template node['bitcoin']['service_file'] do
  source "bitcoind.service.erb"
  owner "root"
  group "root"
  mode "0644"
  variables(
    user: node['bitcoin']['user'],
    bitcoind: node['bitcoin']['bitcoind'],
    conf_dir: node['bitcoin']['conf_dir']
  )
  notifies :run, "execute[systemd-daemon-reload]", :immediately
  only_if "test -f /bin/systemctl && /bin/systemctl"
end

service "bitcoind" do
  provider   Chef::Provider::Service::Systemd
  action     [:enable]
  subscribes :restart, "template[#{node['bitcoin']['service_file']}]", :delayed
  subscribes :restart, "template[#{node['bitcoin']['conf_file']}]", :delayed
  only_if "test -f /bin/systemctl && /bin/systemctl"
end

execute "systemd-daemon-reload" do
  action :nothing
  command "systemctl daemon-reload"
  only_if "test -f /bin/systemctl && /bin/systemctl"
end
