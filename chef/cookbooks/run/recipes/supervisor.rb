execute "restarting supervisord" do
  command "supervisorctl reload"  
  only_if "ps auwx | grep supervisord | grep -v grep"
end
  
execute "starting supervisord" do
    command "supervisord"
    not_if "ps auwx | grep supervisord | grep -v grep"
end  
