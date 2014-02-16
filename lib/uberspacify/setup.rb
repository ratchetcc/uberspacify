Capistrano::Configuration.instance.load do
  
  desc "Tasks to prepare a uberspace for deployment"
  namespace :setup do
    desc "Tasks to prepare a uberspace for deployment"
    task :default do
      ruby
      reverse_proxy
      daemon_tools
    end
    
    desc "Setup ruby interpreter and tools"
    task :ruby do
      
      # script to setup ruby
      ruby_script = <<-EOF

# ruby #{ruby_version} environment
export PATH=/package/host/localhost/ruby-#{ruby_version}/bin:$PATH
export PATH=$HOME/.gem/ruby/#{ruby_version}/bin:$PATH
EOF

      # setup the ruby environment
      put ruby_script, "/home/#{user}/ruby_scrip"
      run "cat /home/#{user}/ruby_scrip >> /home/#{user}/.bashrc"
      
      # configure ruby
      run "echo 'gem: --user-install --no-rdoc --no-ri' > ~/.gemrc"
      run "gem install bundler"
      run "bundle install --path ~/.gem" # FIXME ?
      
      # cleanup
      run "rm /home/#{user}/ruby_scrip"
      
    end
    
    desc "Setup daemon tools"
    task :daemon_tools do
      # activate the daemontools
      run "uberspace-setup-svscan"
      run "uberspace-setup-service #{daemon_service} ~/bin/#{daemon_service}"
    end
    
    desc "Setup Apache reverse-proxy & thin script"
    task :reverse_proxy do
           
      # script to setup ruby
      thin_script = <<-EOF
#!/bin/bash
export HOME=/home/#{user}
source $HOME/.bash_profile
cd /var/www/virtual/#{user}/html
exec /home/#{user}/.gem/ruby/#{ruby_version}/bin/bundle exec thin start -p #{daemon_port} -e production 2>&1
EOF

      htaccess = <<-EOF
RewriteEngine On
RewriteBase /
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^(.*)$ http://localhost:#{daemon_port}/$1 [P]
      
EOF

      # upload the thin script
      put thin_script, "/home/#{user}/bin/#{daemon_service}"
      run "chmod 755 /home/#{user}/bin/#{daemon_service}"
      
      # place the .htaccess file
      put htaccess, "/home/#{user}/html/.htaccess"
      run "chmod +r /home/#{user}/html/.htaccess"
      
    end
    
  end
end