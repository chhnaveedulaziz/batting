# frozen_string_literal: true

require_relative 'teams'

module BattingAvg
  module AverageCalculator
    include Teams
    def calculate_average(data)
      stats = generate_stats(data)

      average = []
      stats.each do |player, stats|
        row = {}
        stats.keys.each do |year|
          row['playerID'] = player
          row['yearId'] = year
          row['Team Name (s)'] = stats[year]['teams'].join(', ')
          hits = stats[year]['stats']['hits']
          at_bats = stats[year]['stats']['at_bats']
          batting_average = at_bats.zero? ? 0 : hits.to_f / at_bats.to_f
          row['Batting Average'] = batting_average&.round(3)

          average << row
        end
      end

      average
    end

    private

    def generate_stats(data)
      player_ids = []
      data.each do |row|
        player_ids = player_ids | [row['playerID']]
      end

      stats = {}

      player_ids.each do |playerID|
        stats[playerID] = {}
      end

      data.each do |row|
        years_hash = stats[row['playerID']][row['yearID']] ||= {}

        teams = years_hash['teams'] ||= []
        years_hash['teams'] = teams | [associated_team(row['teamID'])['name']]

        yearly_stats_hash = years_hash['stats'] ||= {}

        sum_of_hits = yearly_stats_hash['hits'] ||= 0
        yearly_stats_hash['hits'] = sum_of_hits + row['H'].to_i

        sum_of_at_bats = yearly_stats_hash['at_bats'] ||= 0
        yearly_stats_hash['at_bats'] = sum_of_at_bats + row['AB'].to_i
      end

      stats
    end
  end
end