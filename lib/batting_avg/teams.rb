# frozen_string_literal: true

module BattingAvg
  module Teams
    def associated_team(team_id)
      find_team(team_id)
    end

    private

    def find_team(team_id)
      parse_teams

      CSV.foreach("#{__dir__}/../../files/parsed_teams.csv", headers: true) do |row|
        return row if row['teamID'] == team_id
      end
    end

    def parse_teams
      return if File.exist?("#{__dir__}/../../files/parsed_teams.csv")

      puts "LOG: PARSING TEAMS CSV"
      hash = {}

      CSV.foreach("#{__dir__}/../../files/Teams.csv", headers: true) do |row|
        hash[row['teamID']] = row['name']
      end

      CSV.open("#{__dir__}/../../files/parsed_teams.csv", "w", write_headers: true,
               headers: %w[teamID name]) do |csv|
        hash.each do |key, value|
          csv << [key, value]
        end
      end
      puts "LOG: TEAMS PARSING COMPLETE"
    end
  end
end