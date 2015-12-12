# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#team = Team.create(
# [
#  { name: "Ballers", division: 1},
#  { name: "Not", division: 2}
# ]
#)

game = Game.create([
{home_inningone: nil, home_inningtwo: nil, home_inningthree: nil, home_inningfour: nil, home_inningfive: nil, home_inningsix: nil, home_inningseven: nil, home_inningeight: nil, home_inningnine: nil, home_runs: nil, home_hits: nil, home_error: nil, home_score: nil, away_inningone: nil, away_inningtwo: nil, away_inningthree: nil, away_inningfour: nil, away_inningfive: nil, away_inningsix: nil, away_inningeight: nil, away_inningnine: nil, away_runs: nil, away_hits: nil, away_error: nil, away_score: nil}, 
{home_inningone: 1, home_inningtwo: 2, home_inningthree: nil, home_inningfour: nil, home_inningfive: nil, home_inningsix: nil, home_inningseven: nil, home_inningeight: nil, home_inningnine: nil, home_runs: nil, home_hits: 10, home_error: nil, home_score: nil, away_inningone: 1, away_inningtwo: nil, away_inningthree: nil, away_inningfour: nil, away_inningfive: nil, away_inningsix: nil, away_inningeight: nil, away_inningnine: nil, away_runs: nil, away_hits: nil, away_error: nil, away_score: nil}, 
{home_inningone: 1, home_inningtwo: 2, home_inningthree: nil, home_inningfour: nil, home_inningfive: nil, home_inningsix: nil, home_inningseven: nil, home_inningeight: nil, home_inningnine: nil, home_runs: nil, home_hits: 10, home_error: nil, home_score: nil, away_inningone: 1, away_inningtwo: nil, away_inningthree: nil, away_inningfour: nil, away_inningfive: nil, away_inningsix: nil, away_inningeight: nil, away_inningnine: nil, away_runs: nil, away_hits: nil, away_error: nil, away_score: nil}]) 


play = Play.create([
{inning: 2, player_name: nil, home_away: nil, message: nil, balls: nil, strikes: nil, out: nil},
{inning: nil, player_name: nil, home_away: nil, message: nil, balls: nil, strikes: nil, out: nil}])


team = Team.create([
  {name: "Athletics", division: 1, avatar_file_name: "Oakland_Athletics.png", avatar_content_type: "image/png", avatar_file_size: 50783, avatar_updated_at: "2015-12-07 00:04:49", hits: nil, atbats: nil, batavg: nil, runs: nil, singles: nil, doubles: nil, triples: nil, homeRuns: nil, rbis: nil, stolenBases: nil, caughtStealing: nil, walks: nil, strikeouts: nil, hitByPitch: nil, sacrificeHits: nil, sacrificeFlies: nil, plateAppearances: nil, onBasePercentage: nil, sluggingPercentage: nil, caughtStealingPercentage: nil, putouts: nil, outfieldAssists: nil, infieldAssists: nil, f_errors: nil, assists: nil, defensiveChances: nil, fieldingPercentage: nil, passedBalls: nil, f_stolenBases: nil, f_caughtStealing: nil, f_caughtStealingPercentage: nil, wins: nil, losses: nil, earnedRuns: nil, inningsPitched: nil, gamesStarted: nil, completeGames: nil, shutouts: nil, saves: nil, p_hits: nil, p_runs: nil, p_homeRuns: nil, p_walks: nil, p_strikeouts: nil, p_hitByPitch: nil, balks: nil, wildPitches: nil, earnedRunAverage: nil, whip: nil, h9: nil, hr9: nil, bb9: nil, k9: nil},
  {name: "Expos", division: 1, avatar_file_name: "Montreal_Expos.svg.png", avatar_content_type: "image/png", avatar_file_size: 158377, avatar_updated_at: "2015-12-07 00:06:31", hits: nil, atbats: nil, batavg: nil, runs: nil, singles: nil, doubles: nil, triples: nil, homeRuns: nil, rbis: nil, stolenBases: nil, caughtStealing: nil, walks: nil, strikeouts: nil, hitByPitch: nil, sacrificeHits: nil, sacrificeFlies: nil, plateAppearances: nil, onBasePercentage: nil, sluggingPercentage: nil, caughtStealingPercentage: nil, putouts: nil, outfieldAssists: nil, infieldAssists: nil, f_errors: nil, assists: nil, defensiveChances: nil, fieldingPercentage: nil, passedBalls: nil, f_stolenBases: nil, f_caughtStealing: nil, f_caughtStealingPercentage: nil, wins: nil, losses: nil, earnedRuns: nil, inningsPitched: nil, gamesStarted: nil, completeGames: nil, shutouts: nil, saves: nil, p_hits: nil, p_runs: nil, p_homeRuns: nil, p_walks: nil, p_strikeouts: nil, p_hitByPitch: nil, balks: nil, wildPitches: nil, earnedRunAverage: nil, whip: nil, h9: nil, hr9: nil, bb9: nil, k9: nil},
  {name: "RedSox", division: 2, avatar_file_name: "Red_Sox.png", avatar_content_type: "image/png", avatar_file_size: 229231, avatar_updated_at: "2015-12-07 00:08:27", hits: nil, atbats: nil, batavg: nil, runs: nil, singles: nil, doubles: nil, triples: nil, homeRuns: nil, rbis: nil, stolenBases: nil, caughtStealing: nil, walks: nil, strikeouts: nil, hitByPitch: nil, sacrificeHits: nil, sacrificeFlies: nil, plateAppearances: nil, onBasePercentage: nil, sluggingPercentage: nil, caughtStealingPercentage: nil, putouts: nil, outfieldAssists: nil, infieldAssists: nil, f_errors: nil, assists: nil, defensiveChances: nil, fieldingPercentage: nil, passedBalls: nil, f_stolenBases: nil, f_caughtStealing: nil, f_caughtStealingPercentage: nil, wins: nil, losses: nil, earnedRuns: nil, inningsPitched: nil, gamesStarted: nil, completeGames: nil, shutouts: nil, saves: nil, p_hits: nil, p_runs: nil, p_homeRuns: nil, p_walks: nil, p_strikeouts: nil, p_hitByPitch: nil, balks: nil, wildPitches: nil, earnedRunAverage: nil, whip: nil, h9: nil, hr9: nil, bb9: nil, k9: nil},
  {name: "Yankees", division: 2, avatar_file_name: "Yankees.png", avatar_content_type: "image/png", avatar_file_size: 15961, avatar_updated_at: "2015-12-07 00:09:39", hits: nil, atbats: nil, batavg: nil, runs: nil, singles: nil, doubles: nil, triples: nil, homeRuns: nil, rbis: nil, stolenBases: nil, caughtStealing: nil, walks: nil, strikeouts: nil, hitByPitch: nil, sacrificeHits: nil, sacrificeFlies: nil, plateAppearances: nil, onBasePercentage: nil, sluggingPercentage: nil, caughtStealingPercentage: nil, putouts: nil, outfieldAssists: nil, infieldAssists: nil, f_errors: nil, assists: nil, defensiveChances: nil, fieldingPercentage: nil, passedBalls: nil, f_stolenBases: nil, f_caughtStealing: nil, f_caughtStealingPercentage: nil, wins: nil, losses: nil, earnedRuns: nil, inningsPitched: nil, gamesStarted: nil, completeGames: nil, shutouts: nil, saves: nil, p_hits: nil, p_runs: nil, p_homeRuns: nil, p_walks: nil, p_strikeouts: nil, p_hitByPitch: nil, balks: nil, wildPitches: nil, earnedRunAverage: nil, whip: nil, h9: nil, hr9: nil, bb9: nil, k9: nil}
])

#player = Player.create(
# [
#  { first: "Baseball", last: "Swaglord", hits: 200, assists: 4, team_id: team[0].id},
#  { first: "Isaac", last: "Beadle Ramirez", hits: 500, assists: 10, team_id: team[0].id},
#  { first: "Joey", last:"Shelton", hits: 0, assists: 1,  team_id: team[1].id},
#  { first: "Johnny", last:"Not-so-turbo", hits: 1, assists: 3,  team_id: team[1].id},
#  { first: "Kendra", last: "Kuivenhoven", hits: 2, assists: 1, team_id: team[1].id}
# ]
#)
player1 = Player.create({first: "F", last: "L"})
player2 = Player.create({first: "F", last: "L"})
player3 = Player.create({first: "F", last: "L"})
player4 = Player.create({first: "F", last: "L"})
player5 = Player.create({first: "F", last: "L"})
player6 = Player.create({first: "F", last: "L"})
player7 = Player.create({first: "F", last: "L"})
player8 = Player.create({first: "F", last: "L"})


player1.update({first: "Brett", last: "Lawrie", hits: 146, assists: 311, atbats: 562, batavg: 0.259786, team_id: team[0].id, runs: 64, singles: 98, doubles: 29, triples: 3, homeRuns: 16, rbis: 60, stolenBases: 5, caughtStealing: 2, walks: 28, strikeouts: 144, hitByPitch: 5, sacrificeHits: 3, sacrificeFlies: 4, plateAppearances: 602, onBasePercentage: 0.298831, sluggingPercentage: 0.407473, caughtStealingPercentage: 0.285714, putouts: 92, outfieldAssists: 0, infieldAssists: 311, f_errors: 24, defensiveChances: 427, fieldingPercentage: 0.943794, passedBalls: 0, f_stolenBases: 0, f_caughtStealing: 0, f_caughtStealingPercentage: 0.0, wins: 0, losses: 0, earnedRuns: 0, inningsPitched: 0.0, gamesStarted: 0, completeGames: 0, shutouts: 0, saves: 0, p_hits: 0, p_runs: 0, p_homeRuns: 0, p_walks: 0, p_strikeouts: 0, p_hitByPitch: 0, balks: 0, wildPitches: 0, earnedRunAverage: 0.0, whip: 0.0, h9: 0.0, hr9: 0.0, bb9: 0.0, k9: 0.0})
  player2.update({first: "Sonny", last: "Gray", hits: 1, assists: 23, atbats: 6, batavg: 0.166667, team_id: team[0].id, runs: 0, singles: 1, doubles: 0, triples: 0, homeRuns: 0, rbis: 0, stolenBases: 0, caughtStealing: 0, walks: 0, strikeouts: 4, hitByPitch: 0, sacrificeHits: 0, sacrificeFlies: 0, plateAppearances: 6, onBasePercentage: 0.166667, sluggingPercentage: 0.166667, caughtStealingPercentage: 0.0, putouts: 37, outfieldAssists: 0, infieldAssists: 23, f_errors: 0, defensiveChances: 60, fieldingPercentage: 1.0, passedBalls: 0, f_stolenBases: 0, f_caughtStealing: 0, f_caughtStealingPercentage: 0.0, wins: 17, losses: 7, earnedRuns: 63, inningsPitched: 208.0, gamesStarted: 31, completeGames: 3, shutouts: 2, saves: 0, p_hits: 166, p_runs: 71, p_homeRuns: 17, p_walks: 59, p_strikeouts: 169, p_hitByPitch: 2, balks: 0, wildPitches: 13, earnedRunAverage: 2.72596, whip: 1.08173, h9: 7.18269, hr9: 0.735577, bb9: 2.55288, k9: 7.3125})
  player3.update({first: "Stephen", last: "Vogt", hits: 116, assists: 55, atbats: 445, batavg: 0.260674, team_id: team[0].id, runs: 58, singles: 74, doubles: 21, triples: 3, homeRuns: 18, rbis: 71, stolenBases: 0, caughtStealing: 2, walks: 56, strikeouts: 97, hitByPitch: 2, sacrificeHits: 0, sacrificeFlies: 8, plateAppearances: 511, onBasePercentage: 0.340509, sluggingPercentage: 0.442697, caughtStealingPercentage: 0.0, putouts: 840, outfieldAssists: 0, infieldAssists: 55, f_errors: 2, defensiveChances: 897, fieldingPercentage: 0.99777, passedBalls: 9, f_stolenBases: 43, f_caughtStealing: 20, f_caughtStealingPercentage: 0.31746, wins: 0, losses: 0, earnedRuns: 0, inningsPitched: 0.0, gamesStarted: 0, completeGames: 0, shutouts: 0, saves: 0, p_hits: 0, p_runs: 0, p_homeRuns: 0, p_walks: 0, p_strikeouts: 0, p_hitByPitch: 0, balks: 0, wildPitches: 0, earnedRunAverage: 0.0, whip: 0.0, h9: 0.0, hr9: 0.0, bb9: 0.0, k9: 0.0})
  player4.update({first: "Coco", last: "Crisp", hits: 22, assists: 1, atbats: 126, batavg: 0.174603, team_id: team[0].id, runs: 11, singles: 16, doubles: 6, triples: 0, homeRuns: 0, rbis: 6, stolenBases: 2, caughtStealing: 0, walks: 13, strikeouts: 25, hitByPitch: 0, sacrificeHits: 0, sacrificeFlies: 0, plateAppearances: 139, onBasePercentage: 0.251799, sluggingPercentage: 0.222222, caughtStealingPercentage: 0.0, putouts: 51, outfieldAssists: 1, infieldAssists: 0, f_errors: 0, defensiveChances: 52, fieldingPercentage: 1.0, passedBalls: 0, f_stolenBases: 0, f_caughtStealing: 0, f_caughtStealingPercentage: 0.0, wins: 0, losses: 0, earnedRuns: 0, inningsPitched: 0.0, gamesStarted: 0, completeGames: 0, shutouts: 0, saves: 0, p_hits: 0, p_runs: 0, p_homeRuns: 0, p_walks: 0, p_strikeouts: 0, p_hitByPitch: 0, balks: 0, wildPitches: 0, earnedRunAverage: 0.0, whip: 0.0, h9: 0.0, hr9: 0.0, bb9: 0.0, k9: 0.0})
  player5.update({first: "Joey", last: "Shelton", hits: 12, assists: 12, atbats: 32, batavg: 0.375, team_id: team[1].id, runs: 10, singles: 10, doubles: 1, triples: 0, homeRuns: 1, rbis: 6, stolenBases: 1, caughtStealing: 0, walks: 4, strikeouts: 2, hitByPitch: 0, sacrificeHits: 0, sacrificeFlies: 0, plateAppearances: 36, onBasePercentage: 0.444444, sluggingPercentage: 0.5, caughtStealingPercentage: 0.0, putouts: 12, outfieldAssists: 5, infieldAssists: 7, f_errors: 1, defensiveChances: 25, fieldingPercentage: 0.96, passedBalls: 0, f_stolenBases: 0, f_caughtStealing: 0, f_caughtStealingPercentage: 0.0, wins: 1, losses: 0, earnedRuns: 2, inningsPitched: 6.0, gamesStarted: 1, completeGames: 1, shutouts: 0, saves: 0, p_hits: 4, p_runs: 2, p_homeRuns: 1, p_walks: 3, p_strikeouts: 7, p_hitByPitch: 0, balks: 0, wildPitches: 1, earnedRunAverage: 3.0, whip: 1.16667, h9: 6.0, hr9: 1.5, bb9: 4.5, k9: 10.5})
  player6.update({first: "Johnny", last: "Turbo", hits: 15, assists: 13, atbats: 32, batavg: 0.46875, team_id: team[1].id, runs: 8, singles: 10, doubles: 2, triples: 1, homeRuns: 2, rbis: 12, stolenBases: 3, caughtStealing: 1, walks: 6, strikeouts: 1, hitByPitch: 0, sacrificeHits: 0, sacrificeFlies: 0, plateAppearances: 38, onBasePercentage: 0.552632, sluggingPercentage: 0.78125, caughtStealingPercentage: 0.25, putouts: 9, outfieldAssists: 0, infieldAssists: 13, f_errors: 0, defensiveChances: 22, fieldingPercentage: 1.0, passedBalls: 0, f_stolenBases: 0, f_caughtStealing: 0, f_caughtStealingPercentage: 0.0, wins: 0, losses: 0, earnedRuns: 0, inningsPitched: 0.0, gamesStarted: 0, completeGames: 0, shutouts: 0, saves: 0, p_hits: 0, p_runs: 0, p_homeRuns: 0, p_walks: 0, p_strikeouts: 0, p_hitByPitch: 0, balks: 0, wildPitches: 0, earnedRunAverage: 0.0, whip: 0.0, h9: 0.0, hr9: 0.0, bb9: 0.0, k9: 0.0})
  player7.update({first: "Donald", last: "Trump", hits: 1, assists: 13, atbats: 35, batavg: 0.0285714, team_id: team[1].id, runs: 0, singles: 0, doubles: 0, triples: 0, homeRuns: 1, rbis: 1, stolenBases: 1, caughtStealing: 9, walks: 0, strikeouts: 16, hitByPitch: 4, sacrificeHits: 0, sacrificeFlies: 1, plateAppearances: 40, onBasePercentage: 0.125, sluggingPercentage: 0.114286, caughtStealingPercentage: 0.9, putouts: 16, outfieldAssists: 0, infieldAssists: 13, f_errors: 9, defensiveChances: 38, fieldingPercentage: 0.763158, passedBalls: 16, f_stolenBases: 14, f_caughtStealing: 2, f_caughtStealingPercentage: 0.125, wins: 0, losses: 0, earnedRuns: 0, inningsPitched: 0.0, gamesStarted: 0, completeGames: 0, shutouts: 0, saves: 0, p_hits: 0, p_runs: 0, p_homeRuns: 0, p_walks: 0, p_strikeouts: 0, p_hitByPitch: 0, balks: 0, wildPitches: 0, earnedRunAverage: 0.0, whip: 0.0, h9: 0.0, hr9: 0.0, bb9: 0.0, k9: 0.0})
  player8.update({first: "Barry", last: "Bonds", hits: 100, assists: 23, atbats: 102, batavg: 0.980392, team_id: team[1].id, runs: 68, singles: 10, doubles: 10, triples: 10, homeRuns: 70, rbis: 123, stolenBases: 48, caughtStealing: 2, walks: 12, strikeouts: 0, hitByPitch: 0, sacrificeHits: 0, sacrificeFlies: 0, plateAppearances: 114, onBasePercentage: 0.982456, sluggingPercentage: 3.33333, caughtStealingPercentage: 0.04, putouts: 49, outfieldAssists: 23, infieldAssists: 0, f_errors: 0, defensiveChances: 72, fieldingPercentage: 1.0, passedBalls: 0, f_stolenBases: 0, f_caughtStealing: 0, f_caughtStealingPercentage: 0.0, wins: 0, losses: 0, earnedRuns: 0, inningsPitched: 0.0, gamesStarted: 0, completeGames: 0, shutouts: 0, saves: 0, p_hits: 0, p_runs: 0, p_homeRuns: 0, p_walks: 0, p_strikeouts: 0, p_hitByPitch: 0, balks: 0, wildPitches: 0, earnedRunAverage: 0.0, whip: 0.0, h9: 0.0, hr9: 0.0, bb9: 0.0, k9: 0.0})


User.create!(name: "Example User", 
             email: "example@railstutorial.org", 
             password: "foobar", 
             password_confirmation: "foobar", 
             admin: true, 
             activated: true, 
             activated_at: Time.zone.now)
#note: above makes the first user an admin by default

60.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name, 
               email: email, 
               password: password, 
               password_confirmation: password, 
               activated: true, 
               activated_at: Time.zone.now)
end
