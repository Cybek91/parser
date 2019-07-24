module LogHandler
  class LogViewer < Base

    def most_viewed_web_pages
      LogAnalyzer.new(log_file_data).get_most_viewed_web_pages.each do |web_page, quantity|
        puts "#{web_page} #{quantity} views"
      end
    end

    def most_viewed_unique_web_pages
      LogAnalyzer.new(log_file_data).get_most_viewed_unique_web_pages.each do |web_page, quantity|
        puts "#{web_page} #{quantity} views"
      end
    end
  end
end