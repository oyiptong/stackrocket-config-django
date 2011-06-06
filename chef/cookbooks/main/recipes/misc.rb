cookbook_file('/tmp/1e1326c7c3b0483ee747081916e48cdce0c53312.tar') do
	backup false
	group 'root'
	mode '0644'
	owner 'root'
	source 'tmp/1e1326c7c3b0483ee747081916e48cdce0c53312.tar'
end
execute('tar xf /tmp/1e1326c7c3b0483ee747081916e48cdce0c53312.tar') { cwd '/usr/local' }
cookbook_file('/etc/hosts') do
	backup false
	group 'root'
	mode '0644'
	owner 'root'
	source 'etc/hosts'
end
execute('make-ssl-cert generate-default-snakeoil --force-overwrite')
execute('/bin/rm /etc/ssh/ssh_host_*')
execute('dpkg-reconfigure openssh-server')
