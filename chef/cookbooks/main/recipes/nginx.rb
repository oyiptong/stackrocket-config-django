package('nginx')
service('nginx') do
  action :disable
end

directory '/koi/log/nginx' do
    owner 'root'
    group 'root'
    mode '0700'
    recursive true
end
cookbook_file('/etc/nginx/nginx.conf') do
  backup false
  group 'root'
  owner 'root'
  mode '0644'
  source 'nginx/nginx.conf'
end
template("/etc/nginx/sites-available/#{node[:koi][:app_name]}") do
  backup false
  group 'root'
  owner 'root'
  mode '0644'
  source 'nginx/sites-available/koi'
end
link("/etc/nginx/sites-enabled/#{node[:koi][:app_name]}") do
  to "/etc/nginx/sites-available/#{node[:koi][:app_name]}"
  link_type :symbolic
end
