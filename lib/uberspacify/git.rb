Capistrano::Configuration.instance.load do

  desc "Git tasks"
  namespace :git do

    desc "Pull the latest version from git"
    task :pull do
      #run "cd #{fetch :application_home}" do |channel, stream, data|
      #  channel.send_data("password\n")
      #end
      run "cd #{fetch :application_home} && git pull origin #{fetch :branch}"
    end

  end
end