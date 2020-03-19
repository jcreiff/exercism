class Tournament
  def initialize(results)
    @results = results.split("\n").map { _1.split(';') }
    @teams = {}
    update_results
  end

  def tally
    score_games(@results)
    Scoreboard.display(@teams.values)
  end

  def self.tally(results)
    Tournament.new(results).tally
  end

  private

  def update_results
    team_names = @results.flatten.uniq.reject { %w[win loss draw].include?(_1) }
    team_names.map { @teams[_1] = Team.new(_1, 0, 0, 0, 0, 0) }
    @results.map! { |t1, t2, result| [@teams[t1], @teams[t2], result] }
  end

  def score_games(games)
    games.each do |t1, t2, result|
      if result == 'draw'
        [t1, t2].each { score_draws(_1) }
      else
        score_wins(result == 'win' ? t1 : t2)
        score_losses(result == 'loss' ? t1 : t2)
      end
    end
  end

  [[:wins, 3], [:draws, 1], [:losses, 0]].each do |outcome, points|
    define_method("score_#{outcome}") do |team|
      team[:matches] += 1
      team[outcome] += 1
      team[:points] += points
    end
  end
end

Team = Struct.new(:name, :wins, :losses, :draws, :matches, :points)

class Scoreboard
  HEADER = %w[Team MP W D L P].freeze
  FORMAT = "%-31s| %2s |  %s |  %s |  %s |  %s\n".freeze

  def self.display(teams)
    (FORMAT % HEADER) + teams.sort_by { [-_1.points, _1.name] }
                             .map { FORMAT % stats(_1) }.join
  end

  def self.stats(team)
    [team.name, team.matches, team.wins, team.draws, team.losses, team.points]
  end
end
