class Weather

    def initialize()
        puts "Initialize"
    end

    def self.start()
        puts "Welcome to CLI Weather!"
        weather = self.new
    end

end