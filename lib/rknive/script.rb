
require 'optparse'
require 'rubygems'
require 'capistrano/cli'

module RatchetKnive
  
  module Script
    
    def self.run
      
      # name of the current running script
      prog = File.basename($0)
      
      # execute Capistrano with the new set of command line options
      puts 'Running #{prog}'
      #Capistrano::CLI.parse(ARGC).execute!
      
    end
      
  end
  
end