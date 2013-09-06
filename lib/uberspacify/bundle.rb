Capistrano::Configuration.instance.load do
  
  desc "Common bundle tasks"
  namespace :bundle do
    
    desc "bundle install"
    task :install do
      run "cd #{fetch :application_home} && bundle install RAILS_ENV=#{fetch :environment}"
    end
    
  end
end