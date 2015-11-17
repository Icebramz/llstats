class Team < ActiveRecord::Base
 
 has_many :players, dependent: :destroy

 validates :name, presence: true, format: {with: /\A[a-zA-Z\s]+\z/, message: "Only Letters are allowed"}
 validates :division, presence: true, numericality: {greater_than_or_equal_to: 0}

 has_attached_file :avatar,
    :styles => {
      :large =>"500x500>",
      :medium => "300x300>",
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :thumb => "200x200>" },
    :url => "/:class/:attachment/:id/:style_:basename.:extension"
  
  validates_attachment :avatar, 
      content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] },
      :size => { :in => 0..20.megabytes } 

  def calcteamstats

    #initializes all stat values to zero then sets stats to sum of player stats

    self.hits = 0
    self.atbats = 0
    self.runs = 0
    self.singles = 0
    self.doubles = 0
    self.triples = 0
    self.homeRuns = 0
    self.rbis = 0
    self.stolenBases = 0
    self.caughtStealing = 0
    self.walks = 0
    self.strikeouts = 0
    self.hitByPitch = 0
    self.sacrificeFlies = 0
    self.sacrificeHits = 0
    self.putouts = 0
    self.outfieldAssists = 0
    self.infieldAssists = 0
    self.f_errors = 0
    self.passedBalls = 0
    self.f_stolenBases = 0
    self.f_caughtStealing = 0
    self.wins = 0
    self.losses = 0
    self.earnedRuns = 0
    self.inningsPitched = 0
    self.gamesStarted = 0
    self.completeGames = 0
    self.shutouts = 0
    self.saves = 0
    self.p_hits = 0
    self.p_runs = 0
    self.p_homeRuns = 0
    self.p_walks = 0
    self.p_strikeouts = 0
    self.p_hitByPitch = 0
    self.balks = 0
    self.wildPitches = 0

    self.players.each do |c_player|
      self.hits = self.hits + c_player.hits
      self.atbats = self.atbats + c_player.atbats
      self.runs = self.runs + c_player.runs
      self.singles = self.singles + c_player.singles
      self.doubles = self.doubles + c_player.doubles
      self.triples = self.triples + c_player.triples
      self.homeRuns = self.homeRuns + c_player.homeRuns
      self.rbis = self.rbis + c_player.rbis
      self.stolenBases = self.stolenBases + c_player.stolenBases
      self.caughtStealing = self.caughtStealing + c_player.caughtStealing
      self.walks = self.walks + c_player.walks
      self.strikeouts = self.strikeouts + c_player.strikeouts
      self.hitByPitch = self.hitByPitch + c_player.hitByPitch
      self.sacrificeFlies = self.sacrificeFlies + c_player.sacrificeFlies
      self.sacrificeHits = self.sacrificeHits + c_player.sacrificeHits
      self.putouts = self.putouts + c_player.putouts
      self.outfieldAssists = self.outfieldAssists + c_player.outfieldAssists
      self.infieldAssists = self.infieldAssists + c_player.infieldAssists
      self.f_errors = self.f_errors + c_player.f_errors
      self.passedBalls = self.passedBalls + c_player.passedBalls
      self.f_stolenBases = self.f_stolenBases + c_player.f_stolenBases
      self.f_caughtStealing = self.f_caughtStealing + c_player.f_caughtStealing
      self.wins = self.wins + c_player.wins
      self.losses = self.losses + c_player.losses
      self.earnedRuns = self.earnedRuns + c_player.earnedRuns
      self.inningsPitched = self.inningsPitched + c_player.inningsPitched
      self.gamesStarted = self.gamesStarted + c_player.gamesStarted
      self.completeGames = self.completeGames + c_player.completeGames
      self.shutouts = self.shutouts + c_player.shutouts
      self.saves = self.saves + c_player.saves
      self.p_hits = self.p_hits + c_player.p_hits
      self.p_runs = self.p_runs + c_player.p_runs
      self.p_homeRuns = self.p_homeRuns + c_player.p_homeRuns
      self.p_walks = self.p_walks + c_player.p_walks
      self.p_strikeouts = self.p_strikeouts + c_player.p_strikeouts
      self.p_hitByPitch = self.p_hitByPitch + c_player.p_hitByPitch
      self.balks = self.balks + c_player.balks
      self.wildPitches = self.wildPitches + c_player.wildPitches
    end

    if self.atbats != 0
      self.batavg = self.hits.to_f / self.atbats
    else
      self.batavg = 0
    end

    self.plateAppearances = self.atbats + self.walks + self.hitByPitch + self.sacrificeFlies + self.sacrificeHits

    if self.plateAppearances != 0
      self.onBasePercentage = (self.hits + self.walks + self.hitByPitch) / self.plateAppearances.to_f
    else
      self.onBasePercentage = 0
    end

    if self.atbats != 0
      self.sluggingPercentage = (self.singles + (2 * self.doubles) + (3 * self.triples) + (4 * self.homeRuns)) / self.atbats.to_f
    else
      self.sluggingPercentage = 0
    end

    if self.stolenBases != 0 and self.caughtStealing != 0
      self.caughtStealingPercentage = self.caughtStealing.to_f / (self.stolenBases + self.caughtStealing)
    else
      self.caughtStealingPercentage = 0
    end

    self.assists = self.outfieldAssists + self.infieldAssists

    self.defensiveChances = self.putouts + self.assists + self.f_errors

    if self.defensiveChances != 0
      self.fieldingPercentage = (self.putouts + self.assists) / self.defensiveChances.to_f
    else
      self.fieldingPercentage = 0
    end

    if self.f_stolenBases != 0 and f_caughtStealing != 0
      self.f_caughtStealingPercentage = self.f_caughtStealing.to_f / (self.f_stolenBases + f_caughtStealing)
    else
      self.f_caughtStealingPercentage = 0
    end

    if self.inningsPitched != 0
      self.earnedRunAverage = (9 * self.earnedRuns) / self.inningsPitched
      self.whip = (self.p_walks + self.p_hits) / self.inningsPitched
      self.h9 = (9 * self.p_hits) / self.inningsPitched
      self.hr9 = (9 * self.p_homeRuns) / self.inningsPitched
      self.bb9 = (9 * self.p_walks) / self.inningsPitched
      self.k9 = (9 * self.p_strikeouts) / self.inningsPitched
    else
      self.earnedRunAverage = 0
      self.whip = 0
      self.h9 = 0
      self.hr9 = 0
      self.bb9 = 0
      self.k9 = 0
    end
  end


end































