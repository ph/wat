module Wat
  class DataStore
    attr_accessor :name, :destination

    def initialize(name)
      @name = name
      @destination = Pathname.new(File.join(ENV["HOME"], '.wat'))
      @destination.mkpath
    end

    def write(time, message = nil)
      statement = [Time.now.to_i, time, message].compact.join(";")
      File.open(destination.join(name), 'a') do |f|
        f.write("#{statement}\n")
      end
    end
  end
end
