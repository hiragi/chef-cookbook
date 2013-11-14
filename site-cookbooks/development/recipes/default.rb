#
# Cookbook Name:: development
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{zsh apache2 emacs mysql-server vim redis-server sbcl screen ufw ntp sudo openjdk-7-jre openjdk-7-jdk openjdk-7-source ruby-dev libmysql-ruby libmysqlclient-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

user 'hiragi' do
  comment 'hiragi'
  uid 930
  home '/home/hiragi'
  shell '/bin/bash'
  password nil
  supports :manage_home => true
  action [:create, :manage]
end

bash "create directory" do
  user "hiragi"

  home = "/home/hiragi"

  code <<-EOS
  if [ ! -d #{home}/tmp ]; then
    mkdir #{home}/tmp && chown hiragi #{home}/tmp
  fi
  if [ ! -d #{home}/downloads ]; then
    mkdir #{home}/downloads && chown hiragi #{home}/downloads
  fi
  EOS
end

bash "install quicklisp" do
  user "hiragi"

  home = "/home/hiragi"

  code <<-EOS
  if [ ! -d #{home}/quicklisp ]; then
    cd #{home}/downloads
  fi
  EOS
end

=begin
bash "install rvm" do
  user "root"

  code <<-EOS
  bash < <(curl -s https://rvm.beginrescueend.com/install/rvm) &&
  rvm install 1.8.7 &&
  rvm install 1.9.3 &&
  rvm install 2.0.0
  EOS
end

bash "clone dotfiles" do
  user "root"

  code <<-EOS
  git clone git@bitbucket.org:hiragi/dotfiles.git
  EOS
end
=end
