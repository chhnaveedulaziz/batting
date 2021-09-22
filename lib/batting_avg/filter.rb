# frozen_string_literal: true

require_relative 'teams'

module BattingAvg
  module Filter
    include Teams

    def apply_filters(data, filters)
      data.select do |row|
        if !filters.dig('year').nil? && !filters.dig('team').nil?
          filter_by_year(filters, row) && filter_by_team(filters, row)
        elsif !filters.dig('year').nil? && filters.dig('team').nil?
          filter_by_year(filters, row)
        elsif filters.dig('year').nil? && !filters.dig('team').nil?
          filter_by_team(filters, row)
        else
          row
        end
      end
    end

    private

    def filter_by_team(filters, row)
      associated_team(row['teamID'])['name'] == filters.dig('team')
    end

    def filter_by_year(filters, row)
      row['yearID']&.to_i == filters.dig('year')&.to_i
    end
  end
end