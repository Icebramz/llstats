class Player < ActiveRecord::Base
  belongs_to :team
  before_save :calcstats
  
  def initializePlayerStats
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
    #i dont know whats going on
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
  end
  def calcstats
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
