class Player < ActiveRecord::Base
  belongs_to :team
  before_save :calcstats

  def calcstats
    self.batavg = self.hits.to_f / self.atbats
    self.plateAppearances = self.atbats + self.walks + self.hitByPitch + self.sacrificeFlies + self.sacrificeHits
    self.onBasePercentage = (self.hits + self.walks + self.hitByPitch) / self.plateAppearances.to_f
    self.sluggingPercentage = (self.singles + (2 * self.doubles) + (3 * self.triples) + (4 * self.homeRuns)) / self.atbats.to_f
    self.caughtStealingPercentage = self.caughtStealing.to_f / (self.stolenBases + self.caughtStealing)
    self.assists = self.outfieldAssists + self.infieldAssists
    self.defensiveChances = self.putouts + self.assists + self.f_errors
    self.fieldingPercentage = (self.putouts + self.assists) / self.defensiveChances.to_f
    self.f_caughtStealingPercentage = self.f_caughtStealing.to_f / (self.f_stolenBases + f_caughtStealing)
    self.earnedRunAverage = (9 * self.earnedRuns) / self.inningsPitched
    self.whip = (self.p_walks + self.p_hits) / self.inningsPitched
    self.h9 = (9 * self.p_hits) / self.inningsPitched
    self.hr9 = (9 * self.p_homeRuns) / self.inningsPitched
    self.bb9 = (9 * self.p_walks) / self.inningsPitched
    self.k9 = (9 * self.p_strikeouts) / self.inningsPitched
  end
end
