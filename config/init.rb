# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
require 'ftools'
require 'fileutils'
 
use_orm :datamapper
use_test :rspec
use_template_engine :erb
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '095200501e1a82ece68f0ffbe55fad37b250803a'  # required for cookie session store
  c[:session_id_key] = '_kangaroo_session_id' # cookie session id key, defaults to "_session_id"
end

Merb.add_mime_type(:zip, :to_zip, %w[application/zip])
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
end
