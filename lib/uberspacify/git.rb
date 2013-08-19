Capistrano::Configuration.instance.load do

  desc "Git tasks"
  namespace :git do

    desc "Pull the latest version from git"
    task :pull do
      pull_cmd = "cd #{fetch :application_home} && git pull origin #{fetch :branch}"
      
      run pull_cmd do |channel, stream, out|
        if out =~ /Password:/
          channel.send_data("#{fetch :scm_password}\n")
        else
          puts out
        end
      end
   
    end

  end
end