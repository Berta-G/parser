class Report

  def initialize(log:, key:)
    @log = log
    @key = key.to_sym
  end

  attr_reader :key, :log
  
  Line = Struct.new(:page, :total)

  def title
    @title ||= case key
      when :pages_most_visited_overall then 'Most Visited Pages Total Number Of Visits'
      when :pages_most_visited_unique then 'Most Visited Pages Unique Visits by IP'
    end
  end

  def lines
    @lines ||= Enumerator.new do |y|
      lines_attributes.each { |attrs| y << Line.new(*attrs) }
    end
  end

  private

  def lines_attributes
    case key
    when :pages_most_visited_overall then pages_most_visited(log.lines)
    when :pages_most_visited_unique then pages_most_visited(log.lines.uniq { |l| [l.ip, l.page] })
    end
  end

  def pages_most_visited(log_lines)
    log_lines.map(&:page).tally.sort_by { |k, v| [-v, k] }
  end
end