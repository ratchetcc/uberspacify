Capistrano::Configuration.instance.load do
  
  desc "Tasks to start/stop/restart the web server"
  namespace :service do
    desc "Start the web server"
    task :start do
      run "svc -u ~/service/#{fetch :daemon_service}"
    end
    
    desc "Stop the web server"
    task :stop do
      run "svc -d ~/service/#{fetch :daemon_service}"
    end
    
    desc "Restart the web server"
    task :restart do
      run "svc -du ~/service/#{fetch :daemon_service}"
    end
    
  end
end