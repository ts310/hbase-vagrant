#
# Cookbook Name:: default
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w(mlocate ntp).each do |pkg|
  package pkg do
    action :install
  end
end

ruby_block 'service-hbase-master-start-and-enable' do
  block do
    %w(enable start).each do |action|
      resources('service[hbase-master]').run_action(action.to_sym)
    end
  end
end
