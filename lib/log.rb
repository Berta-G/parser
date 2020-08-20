class Log
  LINE_FORMAT = %r{(?<page>/[\w|/]*)\s(?<ip>\d{3}.\d{3}.\d{3}.\d{3})}.freeze

  Line = Struct.new(:page, :ip)

  def initialize(filename:)
    @filename = filename
  end

  attr_reader :filename

  def lines
    @lines ||= Enumerator.new do |y|
      input.each do |i|
        attrs = i.match(LINE_FORMAT)&.named_captures
        y << Line.new(*attrs.values) if attrs
      end
    end
  end

  private

  def input
    @input ||= IO.foreach(filename)
  end
end

