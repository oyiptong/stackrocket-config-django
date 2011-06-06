#install requirements
%w{libshadow-ruby1.8}.each do |pkg|
  package pkg do
    :install
  end  
end

node[:users].each_pair do |username, info|
    user username do
        comment info[:full_name]
        shell info[:disabled] ? "/sbin/nologin" : "/bin/bash"
        supports :manage_home => true
        password info[:password]
        home "/home/#{username}"
    end
end


