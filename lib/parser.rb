require './lib/error_serializer'
require 'pry'

module Parser
  extend self

  def call(filename)
    return error('No filename given') unless filename
    return error("File #{filename} does not exist") unless File.exist?(filename)
    
    # log = LogFactory.call(filename: filename)

    # reports = [ 
    #   ReportFactory.call(log, :pages_most_visited_overall),
    #   ReportFactory.call(log, :pages_most_visited_unique_visits)
    # ]

    # ReportsSerializer.call(reports)
    puts
  end

  private

  def error(message)
    ErrorSerializer.call("ERROR: #{message}")
  end
end