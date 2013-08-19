Capistrano::Configuration.instance.load do
  
  desc "Tasks to prepare a uberspace for deployment"
  namespace :setup do
    desc "Tasks to prepare a uberspace for deployment"
    task :default do
      ruby
      apache
      daemon_tools
    end
    
    desc "Setup ruby interpreter and tools"
    task :ruby do
      
    end
    
    desc "Setup daemon tools"
    task :daemon_tools do
      
    end
    
    desc "Setup Apache reverse-proxy & thin"
    task :apache do
      
    end
    
  end
end