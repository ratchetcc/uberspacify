Capistrano::Configuration.instance.load do
  
  desc "Git tasks"
  namespace :git do
    
    desc "Pull the latest version from git"
    task :pull do
      run "git pull origin #{fetch :repo_branch}"
    end
    
  end
end