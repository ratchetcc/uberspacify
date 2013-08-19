Capistrano::Configuration.instance.load do

  desc "Git tasks"
  namespace :git do

    desc "Pull the latest version from git"
    task :pull do
      pull_cmd = "cd #{fetch :application_home} && git pull origin #{fetch :branch}"
      
      run pull_cmd do |channel, stream, out|
        channel.send_data("#{fetch :scm_password}") if out =~ /Password:/
      end
      #run "cd #{fetch :application_home} && git pull origin #{fetch :branch}"
    end

  end
end