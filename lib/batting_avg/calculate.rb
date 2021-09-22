# frozen_string_literal: true

require 'csv'
require_relative 'filter'
require_relative 'average_calculator'

module BattingAvg
  class Calculate
    class << self
      include Filter
      include AverageCalculator

      def average(file_path, filters = {})
        data = read_file(file_path)
        data = apply_filters(data, filters) unless filters.empty?

        results = calculate_average(data)
        results = results.sort_by { |hsh| hsh['Batting Average'].to_s }.reverse unless filters.empty?

        results
      end

      private

      def read_file(file_path)
        CSV.parse(File.read(file_path), headers: true)
      end
    end
  end
end
