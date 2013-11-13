#
# Cookbook Name:: development
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{zsh apache2 emacs mysql-server vim redis-server sbcl screen ufw ntp sudo}.each do |pkg|
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
  mkdir #{home}/tmp && chown hiragi #{home}/tmp
  mkdir #{home}/downloads && chown hiragi #{home}/downloads
  EOS
end

=begin
bash "clone dotfiles" do
  user "root"

  code <<-EOS
  git clone git@bitbucket.org:hiragi/dotfiles.git
  EOS
end
=end
