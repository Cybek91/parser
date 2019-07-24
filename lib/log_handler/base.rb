module LogHandler
  class Base
    attr_accessor :log_file_data

    def initialize(log_file_data)
      @log_file_data = log_file_data
    end
  end
end