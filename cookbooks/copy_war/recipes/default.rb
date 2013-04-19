#
# Cookbook Name:: copy_war
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2"
include_recipe "tomcat"
include_recipe "java"

remote_file "/tmp/ls_plms.war" do
  source "http://hqprfprdapp01.ptc.com/ls_plms.war"
  
end

package "apache2" do
action :install
end

service "apache2" do
action [ :start, :enable ]
end

service "tomcat" do
action :stop
end

tomcat_webapp = "/var/lib/tomcat6/webapps/ROOT"

template "#{tomcat_webapp}/index.html" do
source "index.html.erb"

mode "0644"
end

service "tomcat" do
action :start
end
