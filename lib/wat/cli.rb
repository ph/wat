module Wat
  class CLI
    def self.run(output, argv)
      name, time = argv

      if name.nil? || time.nil?
        output.puts("you need to specify a project key and a time for it.")
      else
        message = argv[2..argv.size].join(' ')

        data_store = DataStore.new(name)
        data_store.write(time, message)
      end
    end
  end
end
