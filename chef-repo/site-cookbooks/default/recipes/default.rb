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

service 'ntpd' do
  action [:enable, :start]
end
