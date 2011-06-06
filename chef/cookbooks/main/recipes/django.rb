package('libjpeg62')
package('uwsgi-python')
package('memcached')
cookbook_file('/etc/memcached.conf') do
	backup false
	group 'root'
	mode '0644'
	owner 'root'
	source 'etc/memcached.conf'
end
service "memcached" do
  action :restart
end    

execute('pip install psycopg2==2.4')
execute('pip install Django==1.3')
execute('pip install python_memcached==1.47')
execute('pip install simplejson==2.1.5')
