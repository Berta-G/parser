# frozen_string_literal: true

require './lib/error_serializer'
require './lib/reports_serializer'
require './lib/log'
require './lib/report'

require 'pry'

module Parser
  extend self

  def call(filename)
    return error('No filename given') unless filename
    return error("File #{filename} does not exist") unless File.exist?(filename)

    log = Log.new(filename: filename)

    reports = [
      Report.new(log: log, key: :pages_most_visited_overall),
      Report.new(log: log, key: :pages_most_visited_unique)
    ]

    ReportsSerializer.call(reports)
  end

  private

  def error(message)
    ErrorSerializer.call("ERROR: #{message}")
  end
end
