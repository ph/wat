module Wat
  class CLI
    def self.run(*argv)
      name, time, message = argv

      if name.nil? || time.nil?
        puts "you need to specify a project key and a time for it."
      else
        data_store = DataStore.new(name)
        data_store.write(time, message)
      end
    end
  end
end
