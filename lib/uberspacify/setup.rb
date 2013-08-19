Capistrano::Configuration.instance.load do
  
  desc "Tasks to prepare a uberspace for deployment"
  namespace :setup do
    desc "Tasks to prepare a uberspace for deployment"
    task :default do
      
    end
    
    desc "Setup ruby interpreter and tools"
    task :ruby do
      
    end
    
    desc "Setup daemon tools"
    task :daemon_tools do
      
    end
    
  end
end