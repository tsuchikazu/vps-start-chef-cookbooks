#
# Cookbook Name:: site_user
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# LWRPの呼び出し
user_account node[:site_user][:username] do
  action :create
  ssh_keys  node[:site_user][:ssh_keys]
end
