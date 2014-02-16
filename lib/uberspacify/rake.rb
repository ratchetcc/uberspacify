Capistrano::Configuration.instance.load do
  
  desc "Common rake tasks"
  namespace :rake do
    
    desc "rake db:create"
    task :create do
      run "cd #{fetch :application_home} && bundle exec rake db:create RAILS_ENV=#{fetch :environment}"
    end
    
    desc "rake db:setup"
    task :setup do
      run "cd #{fetch :application_home} && bundle exec rake db:setup RAILS_ENV=#{fetch :environment}"
    end
    
    desc "rake db:seed"
    task :seed do
      run "cd #{fetch :application_home} && bundle exec rake db:seed RAILS_ENV=#{fetch :environment}"
    end
    
    desc "rake db:migrate"
    task :migrate do
      run "cd #{fetch :application_home} && bundle exec rake db:migrate RAILS_ENV=#{fetch :environment}"
    end
    
    desc "rake assets:precompile"
    task :precompile do
      run "cd #{fetch :application_home} && bundle exec rake assets:precompile RAILS_ENV=#{fetch :environment}"
      
      # create symbolic links
      run "cd #{fetch :application_home} && ln -s public/assets assets"
    end
    
    desc "create the database.yml file"
    task :create_yml do
      
      my_cnf = capture('cat ~/.my.cnf')
      
      my_cnf.match(/^user=(\w+)/)
      mysql_user = $1
      my_cnf.match(/^password=(\w+)/)
      mysql_pwd = $1

      database_yml = <<-EOF
production:
  adapter: mysql2
  encoding: utf8
  database: #{mysql_user}
  pool: 15
  username: #{mysql_user}
  password: #{mysql_pwd}
  host: localhost
  socket: /var/lib/mysql/mysql.sock
  timeout: 10000

EOF

      # upload the database.yml file
      put database_yml, "/home/#{user}/html/config/database.yml"
    
    end
    
  end
end