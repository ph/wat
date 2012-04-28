require 'spec_helper'

module Wat
  describe DataStore do
    include FakeFS::SpecHelpers

    context "when writing time" do
      let(:datastore) { DataStore.new('ninja') }
      let(:csv_file) { DataStore::DESTINATION.join('ninja.csv')}

      it "creates the saving directory" do
        DataStore.new('ninja')
        File.directory?(DataStore::DESTINATION).should == true
      end

      it "creates a CSV file for each project" do
        datastore.write(2.5, 'yaarrrrgh!')
        File.exists?(csv_file)
      end

      it "saves the contents to the file" do
        datastore.write(2.5, 'yaarrrrgh!')

        content = datastore.load
        content[0].should match(/2.5;yaarrrrgh!$/)
      end
    end

    it "write a better check for the format"
  end
end
