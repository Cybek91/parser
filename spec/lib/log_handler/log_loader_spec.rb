require 'spec_helper'
require 'log_handler/log_loader'

RSpec.describe ::LogHandler::LogLoader do
  let(:log_file_directory) { "./webserver.log" }
  let(:log_loader) { described_class.new(log_file_directory) }

  describe "#load_log_file" do
    before do
      allow_any_instance_of(described_class).to receive(:load_log_file).and_return("some data")
    end

    it 'load the log file and return some data' do
      expect(log_loader.load_log_file).to eql "some data"
    end
  end
end