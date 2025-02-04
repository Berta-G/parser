# frozen_string_literal: true

require './lib/parser'

RSpec.describe Parser do
  let(:subject) { Parser }

  describe '.call' do
    context 'Error' do
      context 'Filename not present' do
        let(:filename) { nil }

        it 'serializes an error' do
          expect(ErrorSerializer).to receive(:call).with('ERROR: No filename given')

          subject.call(filename)
        end
      end

      context 'File not found' do
        let(:filename) { 'nothing.log' }

        it 'serializes and raises an error' do
          expect(ErrorSerializer).to receive(:call).with('ERROR: File nothing.log does not exist')

          subject.call(filename)
        end
      end
    end

    context 'Success' do
      let(:filename) { 'spec/files/visits.log' }

      it 'serializes the reports' do
        expect(ReportsSerializer).to receive(:call)

        subject.call(filename)
      end
    end
  end
end
