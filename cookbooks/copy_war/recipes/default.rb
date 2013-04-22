#
# Cookbook Name:: copy_war
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apache2"
include_recipe "tomcat7"
include_recipe "java"

directory "/d00/apps/plms/tomcat1" do
  owner "root"
  group "root"
  mode 00644
  action :create
  recursive true
end

service "tomcat7" do
service_name "tomcat7"

action :stop
end

#remote_file "/d00/apps/plms/tomcat1/ls_plms.war" do
remote_file "/usr/share/tomcat/webapps/ls_plms.war" do
  source "http://hqprfprdapp01.ptc.com/ls_plms.war"
  
end

package "apache2" do
action :install
end

service "apache2" do
action [ :start, :enable ]
end

#service "tomcat" do
#action :stop
#end

tomcat_webapp = "/d00/apps/plms/tomcat1/webapps/ROOT"

#template "#{tomcat_webapp}/index.html" do
#source "index.html.erb"

#mode "0644"
#end

service "tomcat7" do
    service_name "tomcat7"
    action :start
end
#service "tomcat" do
#action :start
#end
