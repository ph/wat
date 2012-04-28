module Wat
  class DataStore
    DESTINATION = Pathname.new(File.join(ENV["HOME"], '.wat'))
    
    attr_reader :name

    def initialize(name)
      @name = name
      @file_name = "#{name}.csv"

      DESTINATION.mkpath unless File.directory?(DESTINATION)
    end

    def write(time, message = nil)
      current_time = Time.now

      statement = [name, current_time.to_i, current_time.strftime("%Y-%m-%d"), time, message].compact.join(";")

      f = File.open(DESTINATION.join(@file_name), 'a')
      f.write(statement)
    end

    def load
      File.open(DESTINATION.join(@file_name)).read.split("\n")
    end
  end
end
