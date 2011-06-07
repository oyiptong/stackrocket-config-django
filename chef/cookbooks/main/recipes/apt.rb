package('python-software-properties')
directory('/etc/apt') do
	group 'root'
	mode '0755'
	owner 'root'
	recursive true
end
execute('add-apt-repository ppa:pitti/postgresql')
execute('add-apt-respository ppa:nginx/stable')
execute('add-apt-respository ppa:uwsgi/release')

cookbook_file('/etc/apt/sources.list') do
	backup false
	group 'root'
	mode '0644'
	owner 'root'
	source 'etc/apt/sources.list'
end
execute('apt-get -q update')
