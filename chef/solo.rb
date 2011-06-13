log_level :info
abspath = File.dirname(File.expand_path(__FILE__))
cookbook_path abspath + "/cookbooks"
if ENV['KOI_CMD'] && ENV['KOI_CMD'] == 'init'
  json_attribs abspath + "/install.json"
else
  json_attribs abspath + "/run.json" 
end
