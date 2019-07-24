require 'spec_helper'
require 'log_handler/log_analyzer'
require 'log_handler/log_parser'

RSpec.describe ::LogHandler::LogAnalyzer do
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

  let(:parsed_data) {
      [
        ["/help_page/1", "126.318.035.038"],
        ["/contact", "184.123.665.067"],
        ["/home", "184.123.665.067"],
        ["/about/2", "444.701.448.104"],
        ["/help_page/1", "929.398.951.889"],
        ["/index", "444.701.448.104"],
        ["/help_page/1", "722.247.931.582"],
        ["/about", "061.945.150.735"],
        ["/help_page/1", "646.865.545.408"],
        ["/home", "235.313.352.950"],
        ["/contact", "184.123.665.067"],
        ["/help_page/1", "543.910.244.929"]
      ]
  }
  let(:log_analyzer) { described_class.new(log_file_data) }

  before do
    allow_any_instance_of(::LogHandler::LogParser).to receive(:parse_data).and_return(:parsed_data)
  end
  describe "#get_most_viewed_web_pages" do
    let(:expected_output) {
      [["/help_page/1", 5], ["/home", 3], ["/contact", 2], ["/about", 1], ["/index", 1], ["/about/2", 1]]
    }

    before do
      allow_any_instance_of(described_class).to receive(:get_most_viewed_web_pages).and_return(expected_output)
    end

    it 'should return a list of web pages with most page views ordered from most to less page views' do
      expect(log_analyzer.get_most_viewed_web_pages).to eql expected_output
    end
  end

  describe "#get_most_viewed_unique_web_pages" do
    let(:expected_output) {
      [["/help_page/1", 5], ["/home", 3], ["/about", 1], ["/index", 1], ["/about/2", 1], ["/contact", 1]]
    }

    before do
      allow_any_instance_of(described_class).to receive(:get_most_viewed_unique_web_pages).and_return(expected_output)
    end

    it 'should return a list of uniq web pages with most page views ordered from most to less page views' do
      expect(log_analyzer.get_most_viewed_unique_web_pages).to eql expected_output
    end
  end
end