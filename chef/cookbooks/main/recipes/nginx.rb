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
directory('/etc/nginx') do
  group 'root'
  owner 'root'
  mode '0644'
  recursive true
end
directory('/etc/nginx/sites-available') do
  group 'root'
  owner 'root'
  mode '0644'
  recursive true
end
directory('/etc/nginx/sites-enabled') do
  group 'root'
  owner 'root'
  mode '0644'
  recursive true
end
cookbook_file('/etc/nginx/nginx.conf') do
  backup false
  group 'root'
  owner 'root'
  mode '0644'
  source 'nginx/nginx.conf'
end
cookbook_file('/etc/nginx/sites-available/koi') do
  backup false
  group 'root'
  owner 'root'
  mode '0644'
  source 'nginx/sites-available/koi'
end
link('/etc/nginx/sites-available/koi') do
  to '/etc/nginx/sites-enabled/koi'
  link_type :symbolic
end
