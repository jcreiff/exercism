class Tournament
  def initialize(results)
    @results = results.lines.map(&:chomp).map { |line| line.split(';') }
    @teams = @results.flat_map { |result| result[0, 2] }
                     .uniq.map { |name| Team.new(name) }
    @games = @results.map { |t1, t2, result| Game.new(t1, t2, result) }
  end

  def tally
    return Scoreboard::HEADER if @teams.empty?
    TournamentScorer.new(@games, @teams).score_games
    Scoreboard.display(@teams)
  end

  def self.tally(results)
    Tournament.new(results).tally
  end
end

class Team
  attr_reader :name
  attr_accessor :wins, :losses, :draws

  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @draws = 0
  end

  def matches_played
    wins + losses + draws
  end

  def points
    wins * 3 + draws
  end
end

class Game
  attr_reader :teams, :result

  def initialize(team1, team2, result)
    @teams = [team1, team2]
    @result = result
  end

  [[:winner, 'win'], [:loser, 'loss']].each do |name, outcome|
    define_method(name) { result == outcome ? @teams.first : @teams.last }
  end
end

class TournamentScorer
  def initialize(games, teams)
    @games = games
    @teams = teams
  end

  def score_games
    @games.each do |game|
      if game.result == 'draw'
        game.teams.each { |name| @teams.find { |t| t.name == name }.draws += 1 }
      else
        @teams.find { |team| team.name == game.winner }.wins += 1
        @teams.find { |team| team.name == game.loser }.losses += 1
      end
    end
  end
end

class Scoreboard
  HEADER = "Team                           | MP |  W |  D |  L |  P\n".freeze
  DIVIDER = ' |  '.freeze

  def self.display(teams)
    HEADER + sort(teams).map { |team| stat_line(team) }.join("\n") + "\n"
  end

  def self.sort(teams)
    teams.sort_by { |team| [-team.points, team.name] }
  end

  def self.stat_line(team)
    [team.name.ljust(30), team.matches_played, team.wins, team.draws,
     team.losses, team.points].join(DIVIDER)
  end
end

module BookKeeping
  VERSION = 3
end
