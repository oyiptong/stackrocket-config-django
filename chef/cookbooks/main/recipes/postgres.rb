postgres_version = "9.0"

package('postgresql')
package('libpq-dev')

directory('/etc/postgresql-common') do
	group 'root'
	mode '0755'
	owner 'root'
	recursive true
end
cookbook_file('/etc/postgresql-common/root.crt') do
	backup false
	group 'root'
	mode '0644'
	owner 'root'
	source 'etc/postgresql-common/root.crt'
end
directory('/etc/postgresql/9.0/main') do
	group 'root'
	mode '0755'
	owner 'root'
	recursive true
end
cookbook_file('/etc/postgresql/9.0/main/environment') do
	backup false
	group 'postgres'
	mode '0644'
	owner 'postgres'
	source 'etc/postgresql/9.0/main/environment'
end
cookbook_file('/etc/postgresql/9.0/main/pg_hba.conf') do
	backup false
	group 'postgres'
	mode '0640'
	owner 'postgres'
	source 'etc/postgresql/9.0/main/pg_hba.conf'
end
cookbook_file('/etc/postgresql/9.0/main/postgresql.conf') do
	backup false
	group 'postgres'
	mode '0644'
	owner 'postgres'
	source 'etc/postgresql/9.0/main/postgresql.conf'
end

unless File.exists? "/tmp/db_init.sql"
  
  cookbook_file "/tmp/db_init.sql" do
    source "postgres/db_init.sql"
    mode 0640
    owner "postgres"
    group "postgres"
  end

  execute "initialized db" do
    command "sudo -u postgres psql -f /tmp/db_init.sql"
  end
end

service "postgresql-" + postgres_version do
  action :restart
end    
