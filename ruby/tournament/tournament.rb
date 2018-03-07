class Tournament
  attr_reader :results, :teams, :games

  def initialize(results)
    @results = results.lines.map(&:chomp).map { |line| line.split(';') }
    @teams = {}
    @games = []
  end

  def tally
    create_teams
    return Scoreboard::HEADER if teams.empty?
    create_games
    score_games
    Scoreboard.display(teams)
  end

  def create_teams
    results.flat_map { |result| result[0, 2] }.uniq
           .map { |name| teams[name] = Team.new(name) }
  end

  def create_games
    results.each do |team1, team2, result|
      games << Game.new(teams[team1], teams[team2], result)
    end
  end

  def score_games
    games.each { |game| TournamentScorer.score_game(game) }
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
  def self.score_game(game)
    if game.result == 'draw'
      game.teams.map { |team| team.draws += 1 }
    else
      game.winner.wins += 1
      game.loser.losses += 1
    end
  end
end

class Scoreboard
  HEADER = 'Team' + (' ' * 27) + "| MP |  W |  D |  L |  P\n"
  DIVIDER = ' |  '.freeze

  def self.display(teams)
    HEADER + sort(teams.values).map { |team| line(team) }.join("\n") + "\n"
  end

  def self.sort(teams)
    teams.sort_by { |team| [-team.points, team.name] }
  end

  def self.line(team)
    [team.name.ljust(30), team.matches_played, team.wins, team.draws,
     team.losses, team.points].join(DIVIDER)
  end
end

module BookKeeping
  VERSION = 3
end
