require './lib/report.rb'

RSpec.describe Report do
  let(:subject) { Report.new(log: log, key: key) }
  
  let(:log) { double('Log', lines: log_lines ) }
  let(:log_lines) { log_lines_data.map { |attrs| Log::Line.new(*attrs) } }

  let(:log_lines_data) do
    [
      ['/page3', '789.789.789.789'],
      ['/page1', '123.123.123.123'],
      ['/page3', '789.789.789.789'],
      ['/page3', '789.789.789.789'],
      ['/page1', '456.456.456.456']
    ]
  end

  context 'report :pages_most_visited_overall' do
    let(:key) { :pages_most_visited_overall }

    describe '#lines' do
      it 'returns one line per page' do
        expect(subject.lines.count).to eq(2)
      end

      it 'are correctly formatted' do
        lines = subject.lines
        
        expect(lines).to all( be_an(Report::Line) )
        expect(lines.map(&:page)).to eq ['/page3', '/page1']
        expect(lines.map(&:total)).to eq [3, 2]
      end
    end

    describe '#title' do
      it 'returns the correct title for the report' do
        expect(subject.title).to eq 'Most Visited Pages Total Number Of Visits'
      end
    end
  end

  context 'report :pages_most_visited_unique' do
    let(:key) { :pages_most_visited_unique }
    
    describe '#lines' do
      it 'returns one line per page' do
        expect(subject.lines.count).to eq(2)
      end

      it 'are correctly formatted' do
        lines = subject.lines
        
        expect(lines).to all( be_an(Report::Line) )
        expect(lines.map(&:page)).to eq ['/page1', '/page3']
        expect(lines.map(&:total)).to eq [2, 1]
      end
    end

    describe '#title' do
      it 'returns the correct title for the report' do
        expect(subject.title).to eq 'Most Visited Pages Unique Visits by IP'
      end
    end
  end
end
