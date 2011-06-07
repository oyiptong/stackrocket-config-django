postgres_version = "9.0"

package('postgresql')
package('libpq-dev')

cookbook_file('/etc/postgresql/9.0/main/pg_hba.conf') do
	backup false
	group 'postgres'
	mode '0640'
	owner 'postgres'
	source 'postgres/pg_hba.conf'
end
cookbook_file('/etc/postgresql/9.0/main/postgresql.conf') do
	backup false
	group 'postgres'
	mode '0644'
	owner 'postgres'
	source 'postgres/postgresql.conf'
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

service "postgresql" do
  action :restart
end    
