#
# Cookbook Name:: development
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{zsh apache2 emacs mysql-server vim redis-server sbcl screen ufw}.each do |pkg|
  package pkg do
    action :install
  end
end