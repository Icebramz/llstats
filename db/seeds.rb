# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

team = Team.create(
 [
  { name: "Ballers", division: 1}
 ]
)

player = Player.create(
 [
  { first: "Baseball", last: "Swaglord", hits: 1, atbats: 1, batavg: 0, runs: 1, singles: 1, doubles: 1, triples: 1, homeRuns: 1, rbis: 1, stolenBases: 1, caughtStealing: 1, walks: 1, strikeouts: 1, hitByPitch: 1, sacrificeHits: 1, sacrificeFlies: 1, plateAppearances: 0, onBasePercentage: 0, sluggingPercentage: 0, caughtStealingPercentage: 0, putouts: 1, outfieldAssists: 1, infieldAssists: 1, f_errors: 1, assists: 0, defensiveChances: 0, fieldingPercentage: 0, passedBalls: 1, f_stolenBases: 1, f_caughtStealing: 1, f_caughtStealingPercentage: 0, wins: 1, losses: 1, earnedRuns: 1, inningsPitched: 1, gamesStarted: 1, completeGames: 1, shutouts: 1, saves: 1, p_hits: 1, p_runs: 1, p_homeRuns: 1, p_walks: 1, p_strikeouts: 1, p_hitByPitch: 1, balks: 1, wildPitches: 1, earnedRunAverage: 0, whip: 0, h9: 0, hr9: 0, bb9: 0, k9: 0, team_id: team[0].id}
 ]
)
