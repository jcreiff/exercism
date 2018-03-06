class Tournament
  attr_reader :teams, :games
  attr_accessor :scoreboard, :ranking

  def initialize
    @scoreboard = 'Team' + (' ' * 27) + "| MP |  W |  D |  L |  P\n"
    @teams = {}
    @games = []
    @ranking = []
  end

  def tally(results)
    split_games(results)
    create_teams
    score_games
    sort_teams
    create_scoreboard(ranking)
    scoreboard
  end

  def split_games(results)
    results.split("\n").each { |game| games << game.split(';') }
  end

  def create_teams
    teams_only = games.flatten.reject { |word| %w[win loss draw].include?(word) }.uniq
    teams_only.each { |team| new_team(team) }
  end

  def new_team(team_name)
    teams[team_name] = { 'MP' => 0, 'W' => 0, 'D' => 0, 'L' => 0, 'P' => 0 }
  end

  def score_games
    games.each { |game| game[2] == 'win' ? score_win(game) : game[2] == 'loss' ? score_loss(game) : score_draw(game)}
  end

  def score_win(game)
    teams[game[0]]['MP'] += 1
    teams[game[0]]['W'] += 1
    teams[game[0]]['P'] += 3
    teams[game[1]]['MP'] += 1
    teams[game[1]]['L'] += 1
  end

  def score_loss(game)
    teams[game[1]]['MP'] += 1
    teams[game[1]]['W'] += 1
    teams[game[1]]['P'] += 3
    teams[game[0]]['MP'] += 1
    teams[game[0]]['L'] += 1
  end

  def score_draw(game)
    game[0, 2].each do |team|
      teams[team]['MP'] += 1
      teams[team]['D'] += 1
      teams[team]['P'] += 1
    end
  end

  def sort_teams
    scores = teams.keys.map { |team| teams[team]['P'] }.sort.reverse
    teams.keys.sort.each do |team|
      score = teams[team]['P']
      rank = scores.index(score)
      ranking[rank] = team
      scores[rank] = nil
    end
  end

  def create_scoreboard(sorted_teams)
    divider = ' |  '
    sorted_teams.each do |team|
      self.scoreboard += (team + (' ' * (30 - team.length)))
      self.scoreboard += (divider + teams[team]['MP'].to_s)
      self.scoreboard += (divider + teams[team]['W'].to_s)
      self.scoreboard += (divider + teams[team]['D'].to_s)
      self.scoreboard += (divider + teams[team]['L'].to_s)
      self.scoreboard += (divider + teams[team]['P'].to_s + "\n")
    end
  end

  def self.tally(results)
    Tournament.new.tally(results)
  end
end

module BookKeeping
  VERSION = 3
end
