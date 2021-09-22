# frozen_string_literal: true

require 'thor'
require_relative 'calculate'

module BattingAvg
  class CLI < Thor
    desc "calculate batting average", "Calculate batting average by reading CSV from given path"
    option :year, type: :numeric, desc: 'Filter results on year - YYYY'
    option :team, type: :string, desc: 'Filter results on team name'
    def average(file_path)
      puts BattingAvg::Calculate.average(file_path, options)
    end
  end
end