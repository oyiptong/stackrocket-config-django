directory('/etc/apt') do
	group 'root'
	mode '0755'
	owner 'root'
	recursive true
end
directory('/etc/apt/sources.list.d') do
	group 'root'
	mode '0755'
	owner 'root'
	recursive true
end
cookbook_file('/etc/apt/sources.list.d/nginx-stable-lucid.list') do
	backup false
	group 'root'
	mode '0600'
	owner 'root'
	source 'etc/apt/sources.list.d/nginx-stable-lucid.list'
end
cookbook_file('/etc/apt/sources.list.d/nginx-stable-lucid.list.save') do
	backup false
	group 'root'
	mode '0600'
	owner 'root'
	source 'etc/apt/sources.list.d/nginx-stable-lucid.list.save'
end
cookbook_file('/etc/apt/sources.list.d/pitti-postgresql-lucid.list') do
	backup false
	group 'root'
	mode '0600'
	owner 'root'
	source 'etc/apt/sources.list.d/pitti-postgresql-lucid.list'
end
cookbook_file('/etc/apt/sources.list.d/pitti-postgresql-lucid.list.save') do
	backup false
	group 'root'
	mode '0600'
	owner 'root'
	source 'etc/apt/sources.list.d/pitti-postgresql-lucid.list.save'
end
cookbook_file('/etc/apt/sources.list.d/uwsgi-release-lucid.list') do
	backup false
	group 'root'
	mode '0600'
	owner 'root'
	source 'etc/apt/sources.list.d/uwsgi-release-lucid.list'
end
cookbook_file('/etc/apt/secring.gpg') do
	backup false
	group 'root'
	mode '0600'
	owner 'root'
	source 'etc/apt/secring.gpg'
end
cookbook_file('/etc/apt/sources.list') do
	backup false
	group 'root'
	mode '0644'
	owner 'root'
	source 'etc/apt/sources.list'
end
cookbook_file('/etc/apt/trustdb.gpg') do
	backup false
	group 'root'
	mode '0600'
	owner 'root'
	source 'etc/apt/trustdb.gpg'
end
execute('apt-get -q update')
