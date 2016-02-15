#
# Cookbook Name:: cb-php57
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file '/tmp/php-7.0.3.tar.gz' do
  source 'http://nl3.php.net/get/php-7.0.3.tar.gz/from/this/mirror'
  notifies :run, "bash[install_php]", :immediately
  not_if 'test -f /usr/local/bin/php'
end

bash 'install_php' do
  code <<-EOH
    tar xzf /tmp/php-7.0.3.tar.gz
    cd /tmp/php-7.0.3
    ./configure
    make
    make install
    rm -rf /tmp/php-7.0.3.tar.gz
    rm -rf /tmp/php-7.0.3
    EOH
  action :nothing
end
