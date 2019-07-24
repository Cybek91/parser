module LogHandler
  class LogParser
    attr_reader :log_file_data

    def initialize(log_file_data)
      @log_file_data = log_file_data
    end

    def parse_data
      log_file_data.map { |data| data.strip.split }
    end
  end
end