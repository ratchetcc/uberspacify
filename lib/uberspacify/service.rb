Capistrano::Configuration.instance.load do
  
  desc "tasks to start/stop/restart the web server"
  namespace :service do
    desc "start the web server"
    task :start do
      run "svc -u ~/service/#{fetch :daemon_service}"
    end
    
    desc "stop the web server"
    task :stop do
      run "svc -d ~/service/#{fetch :daemon_service}"
    end
    
    desc "restart the web server"
    task :restart do
      run "svc -du ~/service/#{fetch :daemon_service}"
    end
    
  end
end