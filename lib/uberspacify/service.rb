Capistrano::Configuration.instance.load do
  
  namespace :service do
    task :start do
      run "svc -u ~/service/#{fetch :daemon_service}"
    end
    
    task :stop do
      run "svc -d ~/service/#{fetch :daemon_service}"
    end
    
    task :restart do
      run "svc -du ~/service/#{fetch :daemon_service}"
    end
    
  end
end