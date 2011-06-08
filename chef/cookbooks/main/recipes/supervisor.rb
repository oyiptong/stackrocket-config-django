# install supervisor
execute('pip install supervisor==3.0a10')

template "/etc/supervisord.conf" do
  source "supervisor/supervisord.conf"
  mode 0640
  owner "root"
  group "root"
end

directory "/koi/log/supervisor" do
    recursive true
    owner "root"
    group "root"
    mode 0700
end

execute "restarting supervisord" do
  command "supervisorctl reload"  
  only_if "ps auwx | grep supervisord | grep -v grep"
end
  
execute "starting supervisord" do
    command "supervisord"
    not_if "ps auwx | grep supervisord | grep -v grep"
end  

