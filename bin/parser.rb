#!/usr/bin/env ruby
if $0 == __FILE__
  raise ArgumentError, "Usage: #{$0} './webserver.log'" unless ARGV.length == 1
  require_relative '../lib/log_handler'

  log_loader = LogHandler::LogLoader.new(ARGV[0])
  log_data = log_loader.load_log_file
  viewer = LogHandler::LogViewer.new(log_data)
  viewer.most_viewed_web_pages
  viewer.most_viewed_unique_web_pages
end