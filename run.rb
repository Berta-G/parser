# frozen_string_literal: true

require './lib/parser'

filename = ARGV[0]

Parser.call(filename)
