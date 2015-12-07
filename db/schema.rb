# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151207005730) do

  create_table "games", force: :cascade do |t|
    t.integer  "hometeam_id",      limit: 4
    t.integer  "awayteam_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "home_inningone",   limit: 4
    t.integer  "home_inningtwo",   limit: 4
    t.integer  "home_inningthree", limit: 4
    t.integer  "home_inningfour",  limit: 4
    t.integer  "home_inningfive",  limit: 4
    t.integer  "home_inningsix",   limit: 4
    t.integer  "home_inningseven", limit: 4
    t.integer  "home_inningeight", limit: 4
    t.integer  "home_inningnine",  limit: 4
    t.integer  "home_runs",        limit: 4
    t.integer  "home_hits",        limit: 4
    t.integer  "home_error",       limit: 4
    t.integer  "home_score",       limit: 4
    t.integer  "away_inningone",   limit: 4
    t.integer  "away_inningtwo",   limit: 4
    t.integer  "away_inningthree", limit: 4
    t.integer  "away_inningfour",  limit: 4
    t.integer  "away_inningfive",  limit: 4
    t.integer  "away_inningsix",   limit: 4
    t.integer  "away_inningseven", limit: 4
    t.integer  "away_inningeight", limit: 4
    t.integer  "away_inningnine",  limit: 4
    t.integer  "away_runs",        limit: 4
    t.integer  "away_hits",        limit: 4
    t.integer  "away_error",       limit: 4
    t.integer  "away_score",       limit: 4
    t.integer  "user_id",          limit: 4
  end

  create_table "players", force: :cascade do |t|
    t.string   "first",                      limit: 255
    t.string   "last",                       limit: 255
    t.integer  "hits",                       limit: 4
    t.integer  "assists",                    limit: 4
    t.integer  "atbats",                     limit: 4
    t.float    "batavg",                     limit: 24
    t.integer  "team_id",                    limit: 4
    t.integer  "runs",                       limit: 4
    t.integer  "singles",                    limit: 4
    t.integer  "doubles",                    limit: 4
    t.integer  "triples",                    limit: 4
    t.integer  "homeRuns",                   limit: 4
    t.integer  "rbis",                       limit: 4
    t.integer  "stolenBases",                limit: 4
    t.integer  "caughtStealing",             limit: 4
    t.integer  "walks",                      limit: 4
    t.integer  "strikeouts",                 limit: 4
    t.integer  "hitByPitch",                 limit: 4
    t.integer  "sacrificeHits",              limit: 4
    t.integer  "sacrificeFlies",             limit: 4
    t.integer  "plateAppearances",           limit: 4
    t.float    "onBasePercentage",           limit: 24
    t.float    "sluggingPercentage",         limit: 24
    t.float    "caughtStealingPercentage",   limit: 24
    t.integer  "putouts",                    limit: 4
    t.integer  "outfieldAssists",            limit: 4
    t.integer  "infieldAssists",             limit: 4
    t.integer  "f_errors",                   limit: 4
    t.integer  "defensiveChances",           limit: 4
    t.float    "fieldingPercentage",         limit: 24
    t.integer  "passedBalls",                limit: 4
    t.integer  "f_stolenBases",              limit: 4
    t.integer  "f_caughtStealing",           limit: 4
    t.float    "f_caughtStealingPercentage", limit: 24
    t.integer  "wins",                       limit: 4
    t.integer  "losses",                     limit: 4
    t.integer  "earnedRuns",                 limit: 4
    t.float    "inningsPitched",             limit: 24
    t.integer  "gamesStarted",               limit: 4
    t.integer  "completeGames",              limit: 4
    t.integer  "shutouts",                   limit: 4
    t.integer  "saves",                      limit: 4
    t.integer  "p_hits",                     limit: 4
    t.integer  "p_runs",                     limit: 4
    t.integer  "p_homeRuns",                 limit: 4
    t.integer  "p_walks",                    limit: 4
    t.integer  "p_strikeouts",               limit: 4
    t.integer  "p_hitByPitch",               limit: 4
    t.integer  "balks",                      limit: 4
    t.integer  "wildPitches",                limit: 4
    t.float    "earnedRunAverage",           limit: 24
    t.float    "whip",                       limit: 24
    t.float    "h9",                         limit: 24
    t.float    "hr9",                        limit: 24
    t.float    "bb9",                        limit: 24
    t.float    "k9",                         limit: 24
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id",                    limit: 4
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "plays", force: :cascade do |t|
    t.integer  "inning",      limit: 4
    t.string   "player_name", limit: 255
    t.string   "home_away",   limit: 255
    t.string   "message",     limit: 255
    t.integer  "balls",       limit: 4
    t.integer  "strikes",     limit: 4
    t.integer  "out",         limit: 4
    t.integer  "game_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",     limit: 4
  end

  add_index "plays", ["game_id"], name: "index_plays_on_game_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.integer  "division",                   limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "avatar_file_name",           limit: 255
    t.string   "avatar_content_type",        limit: 255
    t.integer  "avatar_file_size",           limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "hits",                       limit: 4
    t.integer  "atbats",                     limit: 4
    t.float    "batavg",                     limit: 24
    t.integer  "runs",                       limit: 4
    t.integer  "singles",                    limit: 4
    t.integer  "doubles",                    limit: 4
    t.integer  "triples",                    limit: 4
    t.integer  "homeRuns",                   limit: 4
    t.integer  "rbis",                       limit: 4
    t.integer  "stolenBases",                limit: 4
    t.integer  "caughtStealing",             limit: 4
    t.integer  "walks",                      limit: 4
    t.integer  "strikeouts",                 limit: 4
    t.integer  "hitByPitch",                 limit: 4
    t.integer  "sacrificeHits",              limit: 4
    t.integer  "sacrificeFlies",             limit: 4
    t.integer  "plateAppearances",           limit: 4
    t.float    "onBasePercentage",           limit: 24
    t.float    "sluggingPercentage",         limit: 24
    t.float    "caughtStealingPercentage",   limit: 24
    t.integer  "putouts",                    limit: 4
    t.integer  "outfieldAssists",            limit: 4
    t.integer  "infieldAssists",             limit: 4
    t.integer  "f_errors",                   limit: 4
    t.integer  "assists",                    limit: 4
    t.integer  "defensiveChances",           limit: 4
    t.float    "fieldingPercentage",         limit: 24
    t.integer  "passedBalls",                limit: 4
    t.integer  "f_stolenBases",              limit: 4
    t.integer  "f_caughtStealing",           limit: 4
    t.float    "f_caughtStealingPercentage", limit: 24
    t.integer  "wins",                       limit: 4
    t.integer  "losses",                     limit: 4
    t.integer  "earnedRuns",                 limit: 4
    t.float    "inningsPitched",             limit: 24
    t.integer  "gamesStarted",               limit: 4
    t.integer  "completeGames",              limit: 4
    t.integer  "shutouts",                   limit: 4
    t.integer  "saves",                      limit: 4
    t.integer  "p_hits",                     limit: 4
    t.integer  "p_runs",                     limit: 4
    t.integer  "p_homeRuns",                 limit: 4
    t.integer  "p_walks",                    limit: 4
    t.integer  "p_strikeouts",               limit: 4
    t.integer  "p_hitByPitch",               limit: 4
    t.integer  "balks",                      limit: 4
    t.integer  "wildPitches",                limit: 4
    t.float    "earnedRunAverage",           limit: 24
    t.float    "whip",                       limit: 24
    t.float    "h9",                         limit: 24
    t.float    "hr9",                        limit: 24
    t.float    "bb9",                        limit: 24
    t.float    "k9",                         limit: 24
    t.integer  "user_id",                    limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "players", "teams"
  add_foreign_key "plays", "games"
end
