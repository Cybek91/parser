module LogHandler
  class LogLoader
    attr_reader :log_file_directory

    def initialize(log_file_directory)
      @log_file_directory = log_file_directory
    end

    def load_log_file
      File.readlines(log_file_directory)
    end
  end
end