#
# Cookbook Name:: site_user
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# LWRPの呼び出し
user_account 'tsuchikazu' do            # tsuchikazuというユーザを
  action :create                        # 作成してね
  ssh_keys  ['ssh-rsa AAAAB3NzaC....']  # authorized_keysはこれで
end
