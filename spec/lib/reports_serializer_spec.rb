# frozen_string_literal: true

require './lib/reports_serializer'

RSpec.describe ReportsSerializer do
  let(:subject) { ReportsSerializer }

  let(:title) { 'This is the tile' }
  let(:page) { '/page1' }
  let(:lines) { [Report::Line.new(page, 2)] }

  let(:reports) { [instance_double(Report, lines: lines, title: title)] }

  it 'outputs the report to stdout' do
    expect { subject.call(reports) }.to output(%r{2\t/page1}).to_stdout
    expect { subject.call(reports) }.to output(/This is the tile/).to_stdout
  end
end
