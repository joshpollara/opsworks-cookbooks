#
# Cookbook Name:: cb-base
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# add users
user 'chris' do
  supports :manage_home => true
  comment 'Chris'
  uid '20000'
  gid '20000'
  home '/home/chris'
  shell '/bin/bash'
end

directory '/home/chris/.ssh' do
  owner 'chris'
  group 'chris'
  mode '0700'
  action :create
  only_if 'test -d /home/chris'
end

cookbook_file '/home/chris/.ssh/authorized_keys' do
  source 'chris-authorized_keys'
  owner 'chris'
  group 'chris'
  mode '0600'
  only_if 'test -d /home/chris/.ssh'
end

# set up /etc/sudoers.d/
cookbook_file '/etc/sudoers.d/chris' do
  source 'chris-sudoers'
  owner 'root'
  group 'root'
  mode '0600'
  only_if 'test -d /etc/sudoers.d'
end

# install packages
package 'htop' do
  action :install
end
