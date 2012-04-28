require 'spec_helper'

module Wat
  describe CLI do
    context "when using the CLI" do
      let(:output) { StringIO.new }
      it "outputs an error message if the time or name is missing" do
        CLI.run(output, [])
        output.string.should == "you need to specify a project key and a time for it.\n"
      end

      it "writes to the datastore" do
        data_store = mock('data_store')
        data_store.should_receive(:write).with(5, 'arrghghg with pirates!')

        DataStore.stub(:new).with('pirate') { data_store }

        CLI.run(output, ['pirate', 5, 'arrghghg with pirates!'])
      end
    end
  end
end
