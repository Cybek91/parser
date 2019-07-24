module LogHandler
  class LogAnalyzer
    attr_reader :log_file_data, :data

    def initialize(log_file_data)
      @log_file_data = log_file_data
      @data = LogParser.new(log_file_data).parse_data
    end

    def get_most_viewed_web_pages
      web_pages_and_quantity = get_web_pages_and_quantities(data)
      sort_by_most_views(web_pages_and_quantity)
    end

    def get_most_viewed_unique_web_pages
      web_pages_and_quantity = get_web_pages_and_quantities(data.uniq)
      sort_by_most_views(web_pages_and_quantity)
    end

    private

    def get_web_pages_and_quantities(data)
      data.uniq.map(&:first).group_by(&:itself).transform_values(&:count)
    end

    def sort_by_most_views(data)
      data.sort_by{|website, count| -count}
    end
  end
end