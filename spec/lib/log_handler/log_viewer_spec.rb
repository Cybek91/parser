require 'spec_helper'
require 'log_handler/base'
require 'log_handler/log_viewer'

RSpec.describe ::LogHandler::LogViewer do
  it { expect(LogHandler::LogViewer).to be < LogHandler::Base }
  let(:log_file_data) {
    [
      "/help_page/1 126.318.035.038\n",
      "/contact 184.123.665.067\n",
      "/home 184.123.665.067\n",
      "/about/2 444.701.448.104\n",
      "/help_page/1 929.398.951.889\n",
      "/index 444.701.448.104\n",
      "/help_page/1 722.247.931.582\n",
      "/about 061.945.150.735\n",
      "/help_page/1 646.865.545.408\n",
      "/home 235.313.352.950\n",
      "/contact 184.123.665.067\n",
      "/help_page/1 543.910.244.929\n",
    ].join("\n") + "\n"
  }
  let(:log_viewer) { LogHandler::LogViewer.new(log_file_data) }

  describe "#most_viewed_web_pages" do
    before do
      allow_any_instance_of(::LogHandler::LogViewer).to receive(:most_viewed_web_pages).and_return("some data")
    end

    it 'should list the most viewed web pages' do
      expect(log_viewer.most_viewed_web_pages).to eql "some data"
    end
  end

  describe "#most_viewed_unique_web_pages" do
    before do
      allow_any_instance_of(::LogHandler::LogViewer).to receive(:most_viewed_unique_web_pages).and_return("some data")
    end

    it 'should list the most unique web pages' do
      expect(log_viewer.most_viewed_unique_web_pages).to eql "some data"
    end
  end
end