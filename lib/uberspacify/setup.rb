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
      
    end
    
    desc "Setup daemon tools"
    task :daemon_tools do
      
    end
    
    desc "Setup Apache reverse-proxy & thin script"
    task :reverse_proxy do
      
    end
    
  end
end