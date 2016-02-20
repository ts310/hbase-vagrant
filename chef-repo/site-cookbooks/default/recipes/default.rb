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

remote_file '/tmp/cloudera-cdh-5-0.x86_64.rpm' do
  source 'http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm'
end

package 'cloudera-cdh-5-repo' do
  action :install
  provider Chef::Provider::Package::Rpm
  source '/tmp/cloudera-cdh-5-0.x86_64.rpm'
end

package 'hbase-master' do
  action :install
end

service 'hbase-master' do
  action [:start, :enable]
end
