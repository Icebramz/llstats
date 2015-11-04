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

ActiveRecord::Schema.define(version: 20151103020726) do

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
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "division",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "players", "teams"
end
