# frozen_string_literal: true

module ReportsSerializer
  extend self

  def call(reports)
    reports.each do |report|
      serialize_report(report)
    end
  end

  private

  def serialize_report(report)
    header(report.title)

    print_lines(report.lines) if report.lines.any?

    footer
  end

  def print_lines(lines)
    lines_header

    lines.each do |line|
      puts "#{line.total}\t#{line.page}"
    end
  end

  def header(title)
    puts '_' * 50
    puts
    puts " = #{title} ="
    puts
  end

  def lines_header
    puts "count\tpage"
    puts '-' * 30
  end

  def footer
    puts
    puts '_' * 50
  end
end
