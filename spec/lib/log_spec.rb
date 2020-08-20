# frozen_string_literal: true

require './lib/log'

RSpec.describe Log do
  let(:subject) { Log.new(filename: filename) }
  let(:filename) { './spec/files/visits.log' }
  let(:content) { IO.foreach(filename) }

  describe '#lines' do
    it 'returns the number of correctly formatted lines' do
      expect(subject.lines.count).to eq(content.count - 1) # there is a wrongly formatted record
    end

    it 'returns lines' do
      expect(subject.lines).to all(be_an(Log::Line))
    end

    it 'are correctly formatted' do
      lines = subject.lines

      expected_pages = content.map { |l| l.split(' ').first } - ['/wrong']
      expected_ips = content.map { |l| l.split(' ').last } - ['444.XXX.448.104']
      expect(lines.map(&:page).sort).to eq(expected_pages.sort)
      expect(lines.map(&:ip).sort).to eq(expected_ips.sort)
    end
  end
end
