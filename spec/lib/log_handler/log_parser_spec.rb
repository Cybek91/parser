require 'spec_helper'
require 'log_handler/log_parser'

RSpec.describe ::LogHandler::LogParser do
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
  
  let(:log_parser) { described_class.new(log_file_data) }

  describe "#parse_data" do

    before do
      allow_any_instance_of(described_class).to receive(:parse_data).and_return(parsed_data)
    end

    it 'should return parsed data' do
      expect(log_parser.parse_data).to eql parsed_data
    end
  end
end