require_relative './config/environment'

puts "Task runner for CLI Weather"

def reload!
    load './lib/geolocation'
end

desc "A console"
task :console do
    Pry.start
end

# Run by invoking Rake --tasks