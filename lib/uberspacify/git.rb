Capistrano::Configuration.instance.load do

  desc "Git tasks"
  namespace :git do

    desc "Pull the latest version from git"
    task :pull do
      git_cmd = "cd #{fetch :application_home} && git pull origin #{fetch :branch}"
      
      run git_cmd do |channel, stream, out|
        if out =~ /Password:/
          channel.send_data("#{fetch :scm_password}\n")
        else
          puts out
        end
      end
   
    end
    
    desc "Clone the repository into web_root"
    task :setup do
      
      # clone the repo first
      git_cmd = "git clone #{fetch :repository}"
      
      run git_cmd do |channel, stream, out|
        if out =~ /Password:/
          channel.send_data("#{fetch :scm_password}\n")
        else
          puts out
        end
      end
      
      # move repo to html
      run "rm -rf #{fetch :application_home}"
      run "mv #{fetch :application} #{fetch :application_home}"
      
    end
    
  end
end